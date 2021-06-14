/* Start: April 2021
 *  Interface Serial console / Hamamatsu lamp & motors
 *  UART and RS-232 protocol
 *  Last modification: 11/06/2021
 */

#define FILTERA PA8 // Pin used to drive filter A.
#define FA_IS_MOVING PA0     // Pin used to receive the feedback from filter A (LOW if the filter is locked in position).
#define FILTERB PA9 // Pin used to drive filter B.
#define FB_IS_MOVING PA1     // Pin used to receive the feedback from filter B (LOW if the filter is locked in position).

#define SWITCHA PB14  // Switch controlling the position of filter A in manual mode.
#define SWITCHB PB15  // Switch controlling the position of filter B in manual mode.

#define LED_MOTORS PA4  // LED indicating the mechanical activity of filters.
#define LED_MANUAL PA7    // LED indicating that the manual mode is active.


HardwareSerial Serial3(PB11, PB10); // Enables UART communication through serial3 ports (RX3=PB11, TX3=PB10).
//HardwareSerial Serial2(PA3, PA2);


String computerStr = "";  // Stores the message from the computer.
String lampStr = "";      // Stores the message from the lamp.

/*  When manual mode is activated, the computer's instructions to drive filters will be ignored by the microcontroller.
 * Instead, it will drive them accordingly to states of SWITCHA and SWITCHB.
 * When the power is turned on, the default behavior is manual because you may not want to connect the computer to just move a filter.
 */
bool manualMode = true;







/*  This function toggles the state of FILTERA and FILTERB  in order to move the connected filters.
 * A LOW signal will switch it to position POS1, ad HIGH to POS2. 
 */
void moveFilter(byte const& filter, byte pos){
  pos = ((pos-1)%2 )+1; // Make sure that the requested position is between 1 and 2.
  
  int filterPin = 0;
  if (filter==1){
    filterPin = FILTERA;
  }else if (filter==2){
    filterPin = FILTERB;
  }

  digitalWrite(LED_MOTORS, HIGH);
  
  if(pos == 1) digitalWrite(filterPin, LOW);
  else digitalWrite(filterPin, HIGH);

  while (digitalRead(FA_IS_MOVING) || digitalRead(FB_IS_MOVING)) continue;  // Wait until the filter stops moving

  digitalWrite(LED_MOTORS, LOW);

  if (filter==1){
    Serial.write("FAOK\r");
  }else if (filter==2){
    Serial.write("FBOK\r");
  }
}










void setup(){
  Serial.begin(19200, SERIAL_8N1);   // Communication with the computer: 9600 bauds, 8 data bits, no parity, one stop bit.
  Serial3.begin(9600, SERIAL_8N1);  // Communication with the Hamamatsu lamp: 9600 bauds, 8 data bits, no parity, one stop bit.
  delay(1000);
  
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(FILTERA, OUTPUT);  digitalWrite(FILTERA, LOW);
  pinMode(FILTERB, OUTPUT); digitalWrite(FILTERB, LOW);

  pinMode(FA_IS_MOVING, INPUT_PULLDOWN); // If feedback is not connected, filters will be seen as not moving by the microcontroller and so it will not wait for them to stop moving.
  pinMode(FB_IS_MOVING, INPUT_PULLDOWN);
  pinMode(SWITCHA, INPUT_PULLDOWN);
  pinMode(SWITCHB, INPUT_PULLDOWN);

  pinMode(LED_MOTORS, OUTPUT);  digitalWrite(LED_MOTORS, LOW);
  pinMode(LED_MANUAL, OUTPUT);  digitalWrite(LED_MANUAL, LOW); 
}






void loop(){
  digitalWrite(LED_BUILTIN, HIGH); // Turn off the LED monitoring the serial transmission.
  

  if(Serial.available()){
    digitalWrite(LED_BUILTIN, LOW);  // Turn on the LED monitoring the serial transmission.
    
    computerStr = Serial.readStringUntil('\r')+'\r'; // Captures the incoming instruction (ending with the '\r' character).

    if(computerStr=="MOVA1\r" && (not manualMode)){  // Check if the received instruction is concerning the filters or the lamp.
      moveFilter(1,1);
    }else if(computerStr=="MOVA2\r" && (not manualMode))  moveFilter(1,2);
    else if(computerStr=="MOVB1\r" && (not manualMode))   moveFilter(2,1);
    else if(computerStr=="MOVB2\r" && (not manualMode))   moveFilter(2,2);
    else if(computerStr=="MAN1\r"){
      manualMode = false;
      Serial.write("MAN1OK\r");
    }
    else if(computerStr=="MAN2\r"){
      manualMode = true;
      Serial.write("MAN2OK\r");
    }
    else{  // If the received instructions do not concern filters, they are passed to the lamp.

      char* buf = (char*) malloc(sizeof(char)*(computerStr.length() + 1)); // Creates a char array buffer to store the string $computerStr$.
      computerStr.toCharArray(buf, computerStr.length() + 1);              // Convert String $computerStr$ to a char array $cString$.

      while (digitalRead(FA_IS_MOVING) || digitalRead(FB_IS_MOVING)) continue;  // If a filter is moving, wait until it stops to send instructions to the lamp. 
      
      Serial3.write(buf);
      free(buf);
        
    }
  }



  if (manualMode){  // In manual mode, check states of switches to drive filters.
    digitalWrite(LED_MANUAL, HIGH);
    digitalWrite(FILTERA, digitalRead(SWITCHA));
    digitalWrite(FILTERB, digitalRead(SWITCHB));
  }else{
    digitalWrite(LED_MANUAL, LOW);
  }
  

 
  //  Transmits messages from the lamp to the computer.
  while(Serial3.available()){
    digitalWrite(LED_BUILTIN, LOW);  // Turn on the LED monitoring the serial transmission.
    Serial.write(Serial3.read());
  }

delay(10);
}
