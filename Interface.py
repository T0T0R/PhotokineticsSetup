from datetime import datetime
import time
import serial
import serial.tools.list_ports
import tkinter as tk
import tkinter.ttk as ttk
import os
from threading import Thread






class SerialCommunication:
    '''
       Class managing the communication with the lamp over a serial port.
    '''
   
    
    def __init__(self):
        self.socketDefined = False # Is the serial port defined by the user yet ?
        self.shutterOpened = False # Is lamp shutter open ?


    # Define the port used for this serial communication.
    def definePort(self, serialPort):   # Use of "try...except" to avoid crashing if the selected port is incorrect.
        try:
            self.ser = serial.Serial(str(serialPort))
            self.socketDefined = True
        except serial.serialutil.SerialException:
            raise serial.serialutil.SerialException("Incorrect name port")        
    
    
    # Begin the communication with the lamp.
    def begin(self):
        self.reset()
    
    
    # Stops the communication with the lamp.
    def stop(self):
        if self.socketDefined:
            self.ser.write("PROG_7STEP\r".encode()) # Set the mode of the lamp back to 7-step (this mode is the one that is usually used when the lamp is turned on).
            self.ser.close()
    
    
    # Series of instruction to ensure that the microcontroller and the lamp will receive and execute commands.
    def reset(self):
        self.send("MAN1\r")         # Turning off the manual mode of the interface,
        self.send("INP\r")          # maybe not useful,
        self.send("CNT1\r")         # control of the lamp via commands,
        self.send("PROG_1STEP\r")   # set the program mode to 1-step in order to use INTSET*** later.

    
    # Changes the state of the irradiation (light on/off, filter used, intensity).
    def irradiate(self, activate, intensity, filterA, filterB):
        if activate:
            self.moveFilterA(int(filterA))
            self.moveFilterB(int(filterB))
            self.intSet(intensity)
            
            prevTime = time.time()
            while time.time() - prevTime < 5: pass   # Wait for the intensity to reach the command (about 5 sec).            
            
            self.shutterOpen()
        else:
            #print("should see SO")
            self.shutterClose()    
    
    
    # Set the intensity of the lamp/
    def intSet(self, intensity):
        perc = f'{int(intensity):03}'
        self.send("INTSET"+perc+"\r")
    
    
    # Closes the shutter of the lamp.
    def shutterClose(self):
        if self.shutterOpened:
            self.send("S0\r")
            self.shutterOpened = False
    
    
    # Opens the shutter of the lamp. 
    def shutterOpen(self):
        if not self.shutterOpened:
            self.send("S1\r")
            self.shutterOpened = True
    
    
    # Moves the filter A.
    def moveFilterA(self, pos):
        self.send("MOVA"+str(pos)+"\r")
    
    
    # Moves the filter B.
    def moveFilterB(self, pos):
        self.send("MOVB"+str(pos)+"\r")
               
    
    # Send a String to the serial port.
    def send(self, string):
        print(string)   # For debug purposes, this line can be removed.
        MyLog.write(string[:-1])
        self.ser.write(string.encode()) # Converts the unicode string into a byte string.
    
    
    # Returns the state of the serial socket.  
    def isDefined(self):
        return self.socketDefined
    
    
    # Returns the name of the port used for serial communication.
    def getPort(self):
        return self.ser.port
        
        







class Step:
    '''
       This class contains informations corresponding to one step of irradiation.
    '''
    
    stepNo = 0     # Number of the step.
    duration = 0   # Duration of the step.
    perc = 0       # Light intensity of the step.
    filterA = 0    # Position of the filter A.
    filterB = 0    # Position of the filter B.
    test = False   # Test this step by turning on the lamp outside the irradiation sequence to adjust parameters.
    
    
    def __init__(self, s=0, p=0, d=0, A=0, B=0, test=False):
        self.stepNo = s
        self.perc = p
        self.duration = d
        self.filterA = A
        self.filterB = B
        self.test = False
    
    
    # Update the parameters of this step with new values.
    def update(self, intensity, duration, FA, FB, v):
        self.duration = duration
        self.perc = intensity
        self.filterA = FA
        self.filterB = FB
        if v==self.stepNo:
            self.test = True
        else:
            self.test = False
        
        if App._thread is None:
            MySerial.irradiate(self.test, self.perc, self.filterA, self.filterB)




class SerialWindow(tk.Tk):
    '''
       Window used to select the serial port that will be used to communicate with the lamp.
    '''
    
    def __init__(self):
        tk.Tk.__init__(self)
        self.addWidgets()
        
    
    # Add all the graphical elements (widgets) in the window.
    def addWidgets(self):
        vcmd = (self.register(self.onValidate), '%P')           # Method used to check the validity of user entries.      
        
        self.logFilenameLabelUI = tk.Label(text = "Log filename:");            self.logFilenameLabelUI.grid (column = 0, row = 0)
        self.logFilenameUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                      self.logFilenameUI.grid (column = 1, row = 0); self.logFilenameUI.insert(0,"log")
        self.connexionLabelUI = tk.Label(text = "COM port:");            self.connexionLabelUI.grid (column = 0, row = 1)
        self.connexionListUI = ttk.Combobox(values=[item[0] for item in serial.tools.list_ports.comports()], width=7);  self.connexionListUI.grid (column = 1, row = 1)
        self.connexionOKUI = tk.Button(text="OK", command=self.validate);   self.connexionOKUI.grid (column = 2, row = 1)
        self.messagesUI = tk.Label(relief="groove", width=20);                  self.messagesUI.grid(column = 0, columnspan=3, row = 2, rowspan=1)
        
    def validate(self):
        MyLog.update(str(self.logFilenameUI.get()))
        self.definePort()
    
    
    # Define the port used for this serial communication.
    def definePort(self):   # Use of "try...except" to avoid crashing if the selected port is incorrect.
        try:
            MySerial.definePort(self.connexionListUI.get())
            self.messagesUI.config(text="Serial port: "+MySerial.ser.name)
            MySerial.begin()
            self.destroy()
        except serial.serialutil.SerialException:
            self.messagesUI.config(text="Incorrect serial port: "+self.connexionListUI.get())
        
            
    # Returns the state of the serial socket.     
    def serialIsOpen(self):
        return MySerial.isOpen()
    
    #Validation method:
    def onValidate(self, P):
        return all(c.isalnum() or (c=="_") or (c=="-") for c in P)  # Only letters, numbers, "_" and "-" in the filename.
            
            
            
            
class Log():
    '''
       Class designed to produce a log.
    '''
    def __init__(self):
        self.MyLogFileCache = open("log.txt", "a")
        self.isLogDefined = False
        
        
    def update(self, filename):
        if filename != "" and filename != "log":
            self.MyLogFile = open(filename+".txt", "a")
            self.isLogDefined = True
            
            
    def writeCache(self, string):
        now = datetime.now()
        self.MyLogFileCache.write(now.strftime("%d/%m/%Y %H:%M:%S") + ": " + string + "\n")
        self.MyLogFileCache.flush()
        os.fsync(self.MyLogFileCache.fileno())   
        
        
    def write(self, string):
        if self.isLogDefined:
            now = datetime.now()
            self.MyLogFile.write(now.strftime("%d/%m/%Y %H:%M:%S") + ": " + string + "\n")
            self.MyLogFile.flush()
            os.fsync(self.MyLogFile.fileno())
        self.writeCache(string)

        
    def close(self):
        if self.isLogDefined:
            self.MyLogFile.close()
        self.MyLogFileCache.close()
        
        
        
        
            
            
class Window(tk.Tk):
    '''
       Main window where the irradiation sequence is set.
    '''
    
    def __init__(self):
        tk.Tk.__init__(self)
        self.addWidgets()
        self._thread, self._stop = None, True
        self.lock_steps = False

    
    # Changes the displayed color of a step.
    def colorStep(self, number, color):
        default_bg = self.cget('bg') # Store the default color of the initial background.
        
        if number == 1:
            self.step1LabelUI.config(bg=color); self.step2LabelUI.config(bg=default_bg); self.step3LabelUI.config(bg=default_bg); self.step4LabelUI.config(bg=default_bg); self.step5LabelUI.config(bg=default_bg); 
        elif number == 2:
            self.step1LabelUI.config(bg=default_bg); self.step2LabelUI.config(bg=color); self.step3LabelUI.config(bg=default_bg); self.step4LabelUI.config(bg=default_bg); self.step5LabelUI.config(bg=default_bg); 
        elif number == 3:
            self.step1LabelUI.config(bg=default_bg); self.step2LabelUI.config(bg=default_bg); self.step3LabelUI.config(bg=color); self.step4LabelUI.config(bg=default_bg); self.step5LabelUI.config(bg=default_bg); 
        elif number == 4:
            self.step1LabelUI.config(bg=default_bg); self.step2LabelUI.config(bg=default_bg); self.step3LabelUI.config(bg=default_bg); self.step4LabelUI.config(bg=color); self.step5LabelUI.config(bg=default_bg); 
        elif number == 5:
            self.step1LabelUI.config(bg=default_bg); self.step2LabelUI.config(bg=default_bg); self.step3LabelUI.config(bg=default_bg); self.step4LabelUI.config(bg=default_bg); self.step5LabelUI.config(bg=color); 
        else:
            self.step1LabelUI.config(bg=default_bg); self.step2LabelUI.config(bg=default_bg); self.step3LabelUI.config(bg=default_bg); self.step4LabelUI.config(bg=default_bg); self.step5LabelUI.config(bg=default_bg); 
              
        self.update()
            
            
    def startThread(self):
        if self._thread is None:
            self._stop = False
            self._thread = Thread(target=self.startSequence)
            self._thread.start()
            
    def stopThread(self):
        if self._thread is not None:
            self._stop = True
            self._thread = None
   
       
    
    
    # Irradiation sequence.
    def startSequence(self):
        # Access data from a thread: need to lock these data
        self.lock_steps = True
        # Do not start if the manual mode is used.
        if self.v_manualMode.get():
            self.messagesUI.config(text="Manual mode is on.")
            self.stopThread()
            return
        if Step1.test or Step2.test or Step3.test or Step4.test or Step5.test:
            self.messagesUI.config(text="A step is being tested.")
            self.stopThread()
            return            
        else:
            self.messagesUI.config(text="")
        nbCycles = int(self.setNbCyclesUI.get())
        
        currentCycle = 0
        
          
        while currentCycle < nbCycles:
            for step in [Step1, Step2, Step3, Step4, Step5]:
                self.messagesUI.config(text="Processing cycle " +str(currentCycle+1))
                
                # Gather informations from the step
                filterA, filterB = step.filterA, step.filterB
                number = step.stepNo
                perc, duration = step.perc, int(step.duration)
                if duration == 0: continue  # Skip empty steps.
                
                self.colorStep(number, "yellow")  # Indicating that intensity is reaching command intensity (closed shutter).             
                
                self.lock_steps = False # Steps' data can be modified wgile waiting
                MySerial.irradiate(True, perc, step.filterA, step.filterB)
                self.colorStep(number, "green")  # Indiating irradiation (opened shutter).
                prevTime = time.time()

                while time.time() - prevTime < duration: 
                    if self._stop:  # If the user hit the "stop" button, exit the method.
                        self.colorStep(0, None) # Removes the color from the highlighted labels.
                        return
                    
                MySerial.irradiate(False, perc, filterA, filterB)
                self.lock_steps = True
            currentCycle +=1
        
        self.colorStep(0, None) # Removes the color from the highlighted labels.
        self.messagesUI.config(text=str(self.setNbCyclesUI.get()) + " cycle(s) done.")
        MyLog.write("*** " + str(self.setNbCyclesUI.get()) + " cycle(s) done.")
        self.lock_steps = False
        self._stop = True
        self._thread = None        
    
    
    
    
    # Add all the graphical elements (widgets) in the window.
    def addWidgets(self):
        vcmd = (self.register(self.onValidate), '%P')           # Method used to check the validity of user entries.      
        
        self.v_test     = tk.IntVar ()  # Contains which step is to be tested.
        self.v_test.set(0)
        
        self.v_manualMode = tk.IntVar() # States if the device is operated manually or through this interface.  
        self.v_manualMode.set(False)
        
        self.columnLabelIntensityUI = tk.Label(text = "Intensity (%)"); self.columnLabelIntensityUI.grid (column = 1, row = 0);
        self.columnLabelDurationUI = tk.Label(text = "Duration (s)"); self.columnLabelDurationUI.grid (column = 2, row = 0)
        self.columnLabelFAUI = tk.Label(text = "Filter A");    self.columnLabelFAUI.grid (column = 3, row = 0)
        self.columnLabelFBUI = tk.Label(text = "Filter B");    self.columnLabelFBUI.grid (column = 4, row = 0)
        self.columnLabelTestUI = tk.Radiobutton(variable = self.v_test, value = 0, text = "No test", command=self.updateValues);    self.columnLabelTestUI.grid (column = 5, row = 0)
        
        self.setManualModeLabelUI = tk.Label(text = "Manual mode");  self.setManualModeLabelUI.grid(column = 8, row = 1)
        self.setManualModeUI = tk.Checkbutton(variable = self.v_manualMode, command=self.updateManualMode); self.setManualModeUI.grid(column = 9, row = 1)
        self.setNbCyclesLabelUI = tk.Label(text="Nb cycles:");           self.setNbCyclesLabelUI.grid (column = 7, row = 3)
        self.setNbCyclesUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                         self.setNbCyclesUI.grid (column = 8, row = 3);       self.setNbCyclesUI.insert(0,"1")
        #self.setCyclesOkUI = tk.Button(text="OK", command=self.updateDuration);     self.setCyclesOkUI.grid (column = 9, row = 3)
        
        self.startUI = tk.Button(text="Start", command=self.startThread);                                 self.startUI.grid (column = 7, row = 4)
        self.stopUI = tk.Button(text="Stop", command=self.stopThread);                                   self.stopUI.grid (column = 8, row = 4)
        self.resetUI = tk.Button(text="Reset", command=MySerial.reset);         self.resetUI.grid (column = 9, row = 4)
        self.messagesUI = tk.Label(relief="groove", width=20);                  self.messagesUI.grid(column = 7, columnspan=3, row = 5, rowspan=1)
        
        
        self.step1LabelUI = tk.Label(text = "Step 1");                   self.step1LabelUI.grid (column = 0, row = 1);
        self.step1IntensityUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                      self.step1IntensityUI.grid (column = 1, row = 1); self.step1IntensityUI.insert(0,"0")
        self.step1DurationUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                       self.step1DurationUI.grid (column = 2, row = 1);  self.step1DurationUI.insert(0,"0")
        self.step1FAUI = ttk.Combobox(values=[1,2], width=7);    self.step1FAUI.grid (column = 3, row = 1);        self.step1FAUI.current(0)
        self.step1FBUI = ttk.Combobox(values=[1,2], width=7);    self.step1FBUI.grid (column = 4, row = 1);        self.step1FBUI.current(0)
        self.step1TestUI = tk.Radiobutton(variable = self.v_test, value = 1, command=self.updateValues); self.step1TestUI.grid (column = 5, row = 1);
        
        self.step2LabelUI = tk.Label(text = "Step 2");                   self.step2LabelUI.grid (column = 0, row = 2);
        self.step2IntensityUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                      self.step2IntensityUI.grid (column = 1, row = 2); self.step2IntensityUI.insert(0,"0")
        self.step2DurationUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                       self.step2DurationUI.grid (column = 2, row = 2);  self.step2DurationUI.insert(0,"0")
        self.step2FAUI = ttk.Combobox(values=[1,2], width=7);    self.step2FAUI.grid (column = 3, row = 2);        self.step2FAUI.current(0)
        self.step2FBUI = ttk.Combobox(values=[1,2], width=7);    self.step2FBUI.grid (column = 4, row = 2);        self.step2FBUI.current(0)
        self.step2TestUI = tk.Radiobutton(variable = self.v_test, value = 2, command=self.updateValues); self.step2TestUI.grid (column = 5, row = 2);
        
        self.step3LabelUI = tk.Label(text = "Step 3");                   self.step3LabelUI.grid (column = 0, row = 3);
        self.step3IntensityUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                      self.step3IntensityUI.grid (column = 1, row = 3); self.step3IntensityUI.insert(0,"0")
        self.step3DurationUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                       self.step3DurationUI.grid (column = 2, row = 3);  self.step3DurationUI.insert(0,"0")
        self.step3FAUI = ttk.Combobox(values=[1,2], width=7);    self.step3FAUI.grid (column = 3, row = 3);        self.step3FAUI.current(0)
        self.step3FBUI = ttk.Combobox(values=[1,2], width=7);    self.step3FBUI.grid (column = 4, row = 3);        self.step3FBUI.current(0)
        self.step3TestUI = tk.Radiobutton(variable = self.v_test, value = 3, command=self.updateValues); self.step3TestUI.grid (column = 5, row = 3);
        
        self.step4LabelUI = tk.Label(text = "Step 4");                   self.step4LabelUI.grid (column = 0, row = 4);
        self.step4IntensityUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                      self.step4IntensityUI.grid (column = 1, row = 4); self.step4IntensityUI.insert(0,"0")
        self.step4DurationUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                       self.step4DurationUI.grid (column = 2, row = 4);  self.step4DurationUI.insert(0,"0")
        self.step4FAUI = ttk.Combobox(values=[1,2], width=7);    self.step4FAUI.grid (column = 3, row = 4);        self.step4FAUI.current(0)
        self.step4FBUI = ttk.Combobox(values=[1,2], width=7);    self.step4FBUI.grid (column = 4, row = 4);        self.step4FBUI.current(0)
        self.step4TestUI = tk.Radiobutton(variable = self.v_test, value = 4, command=self.updateValues); self.step4TestUI.grid (column = 5, row = 4);
        
        self.step5LabelUI = tk.Label(text = "Step 5");                   self.step5LabelUI.grid (column = 0, row = 5);
        self.step5IntensityUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                      self.step5IntensityUI.grid (column = 1, row = 5); self.step5IntensityUI.insert(0,"0")
        self.step5DurationUI = tk.Entry(width=10, validate="all", validatecommand=vcmd);                       self.step5DurationUI.grid (column = 2, row = 5);  self.step5DurationUI.insert(0,"0")
        self.step5FAUI = ttk.Combobox(values=[1,2], width=7);    self.step5FAUI.grid (column = 3, row = 5);        self.step5FAUI.current(0)
        self.step5FBUI = ttk.Combobox(values=[1,2], width=7);    self.step5FBUI.grid (column = 4, row = 5);        self.step5FBUI.current(0)
        self.step5TestUI = tk.Radiobutton(variable = self.v_test, value = 5, command=self.updateValues); self.step5TestUI.grid (column = 5, row = 5);
        
        
    #Validation method:
    def onValidate(self, P):
        return P.isdigit() or P=="" # An empty string is allowed because  it is very convenient to remove the whole content of the entry box. The empty string is then replaced by a 0 in the the updateValues method.
    
    
    # Update the state of the manual mode.
    def updateManualMode(self):
        if self.v_manualMode.get():
            self.setManualModeLabelUI.config(bg="red")
            MySerial.send("MAN2\r")
        else:
            self.setManualModeLabelUI.config(bg=self.cget('bg'))   
            MySerial.send("MAN1\r")
        
        self.update()
        
        
        
    # Methods called when values have to be updated throught the UI:
    def updateValuesEvent(self, event):
        self.updateValues()
        
    def updateValues(self):
        if self.lock_steps: # The steps objects must not be updated when the irradiation thread is accessing them.
            return
        
        # Limiting the intensity percentage between 0 and 100.
        for stepIntensityUI in [self.step1IntensityUI,self.step2IntensityUI,self.step3IntensityUI,self.step4IntensityUI,self.step5IntensityUI]:
            if stepIntensityUI.get() == ""  :
                stepIntensityUI.delete(0,"end")
                stepIntensityUI.insert(0,"0")            
            if int(stepIntensityUI.get()) > 100 :
                stepIntensityUI.delete(0,"end")
                stepIntensityUI.insert(0,"100")
            if int(stepIntensityUI.get()) < 0  :
                stepIntensityUI.delete(0,"end")
                stepIntensityUI.insert(0,"0")
        
        if self.setNbCyclesUI.get() == ""  :
            self.setNbCyclesUI.delete(0,"end")
            self.setNbCyclesUI.insert(0,"0")         
                                
        Step1.update(self.step1IntensityUI.get(), self.step1DurationUI.get(), self.step1FAUI.get(), self.step1FBUI.get(), self.v_test.get())
        Step2.update(self.step2IntensityUI.get(), self.step2DurationUI.get(), self.step2FAUI.get(), self.step2FBUI.get(), self.v_test.get())
        Step3.update(self.step3IntensityUI.get(), self.step3DurationUI.get(), self.step3FAUI.get(), self.step3FBUI.get(), self.v_test.get())
        Step4.update(self.step4IntensityUI.get(), self.step4DurationUI.get(), self.step4FAUI.get(), self.step4FBUI.get(), self.v_test.get())
        Step5.update(self.step5IntensityUI.get(), self.step5DurationUI.get(), self.step5FAUI.get(), self.step5FBUI.get(), self.v_test.get())
        
        
        








if __name__ == "__main__":
    MySerial = SerialCommunication();
    MyLog = Log();

    # Create 5 steps for the sequence.
    Step1 = Step(1,0,0,1,1)
    Step2 = Step(2,0,0,1,1)
    Step3 = Step(3,0,0,1,1)
    Step4 = Step(4,0,0,1,1)
    Step5 = Step(5,0,0,1,1)
    
    App = SerialWindow()
    App.title("Choose a serial port")
    App.mainloop()
    
    MyLog.writeCache("********** Normal start: connected to port " + str(MySerial.getPort()))
    
    if MySerial.isDefined():
        App = Window()
        App.title("Interface for filters")
        App.bind("<Any-KeyPress>", App.updateValuesEvent)
        App.bind("<Button>", App.updateValuesEvent)
        App.mainloop()    

MyLog.writeCache("********** Normal end.")
MyLog.close()        
MySerial.stop()
