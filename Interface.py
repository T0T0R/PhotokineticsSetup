import time
import serial
import tkinter as tk
import tkinter.ttk as ttk




class SerialCommunication:
    #ser = None  # open serial port
    
    
    def __init__(self): pass
        
            
    def definePort(self, serialPort):
        try:
            self.ser = serial.Serial(str(serialPort))
        except serial.serialutil.SerialException:
            raise serial.serialutil.SerialException("Incorrect name port")        
    
    def begin(self):
        self.reset()
        
    def stop(self):
        self.ser.write("PROG_1STEP\r".encode())
        self.ser.close()
    
    def reset(self):
        self.ser.write("MAN1\r".encode())
        self.ser.write("INP\r".encode())
        self.ser.write("CNT1\r".encode())
        self.ser.write("PROG_1STEP\r".encode())   

    
    def irradiate(self, activate, intensity, filterA, filterB):
        if activate:
            self.moveFilterA(int(filterA))
            self.moveFilterB(int(filterB))
            self.intSet(intensity)
            
            prevTime = time.time()
            while time.time() - prevTime < 5: pass   # Wait for the intensity to reach the command (about 5 sec).            
            
            self.shutterOpen()
        else:
            self.shutterClose()    
    
    
    
    
    
    def intSet(self, intensity):
        perc = f'{int(intensity):03}'
        self.send("INTSET"+perc+"\r")
    
    def shutterClose(self):
        self.send("S0\r")
        
    def shutterOpen(self):
        self.send("S1\r")
        
    def moveFilterA(self, pos):
        self.send("MOVA"+str(pos)+"\r")
        
    def moveFilterB(self, pos):
        self.send("MOVB"+str(pos)+"\r")
        
    def setFilterA(self, pos):
        self.send("SETA"+str(pos)+"\r")
        
    def setFilterB(self, pos):
        self.send("SETB"+str(pos)+"\r")        
        
    def send(self, string):
        self.ser.write(string.encode())
        
        
        
MySerial = SerialCommunication();








class Step:
    '''This class contains informations corresponding to a step of irradiation'''
    stepNo = 0
    duration = 0
    perc = 0
    filterA = 0
    filterB = 0
    test = False
    
    def __init__(self, s=0, p=0, d=0, A=0, B=0, test=False):
        self.stepNo = s
        self.perc = p
        self.duration = d
        self.filterA = A
        self.filterB = B
        self.test = False
        
    def update(self, intensity, duration, FA, FB, v):
        self.duration = duration
        self.perc = intensity
        self.filterA = FA
        self.filterB = FB
        if v==self.stepNo:
            self.test = True
        else:
            self.test = False
        
        MySerial.irradiate(self.test, self.perc, self.filterA, self.filterB)




Step1 = Step(1,0,0,1,1)
Step2 = Step(2,0,0,1,1)
Step3 = Step(3,0,0,1,1)
Step4 = Step(4,0,0,1,1)
Step5 = Step(5,0,0,1,1)

root = tk.Tk ()   # Main window
default_bg = root.cget('bg')
#zone_texte  = tkinter.Label (text = "zone de texte")
#zone_texte.config (text = "second texte")
#zone_texte.pack ()            # on ajoute l'objet à la fenêtre principale





def fnctTest():
    print("test")
    
    
    
    
def definePort():
    try:
        MySerial.definePort(connexionEntryUI.get())
        messagesUI.config(text="Serial port: "+MySerial.ser.name)
        MySerial.begin()
    except serial.serialutil.SerialException:
        messagesUI.config(text="Incorrect serial port: "+connexionEntryUI.get())
        
        


def startSequence():
    currentCycle = 0
    
    
    while currentCycle < int(setNbCyclesUI.get()):
        for step in [Step1, Step2, Step3, Step4, Step5]:
            perc,duration = step.perc, int(step.duration)
            if duration == 0: continue
            
            if step == Step1:
                step1LabelUI.config(bg="yellow"); step2LabelUI.config(bg=default_bg); step3LabelUI.config(bg=default_bg); step4LabelUI.config(bg=default_bg); step5LabelUI.config(bg=default_bg); 
            if step == Step2:
                step1LabelUI.config(bg=default_bg); step2LabelUI.config(bg="yellow"); step3LabelUI.config(bg=default_bg); step4LabelUI.config(bg=default_bg); step5LabelUI.config(bg=default_bg); 
            if step == Step3:
                step1LabelUI.config(bg=default_bg); step2LabelUI.config(bg=default_bg); step3LabelUI.config(bg="yellow"); step4LabelUI.config(bg=default_bg); step5LabelUI.config(bg=default_bg); 
            if step == Step4:
                step1LabelUI.config(bg=default_bg); step2LabelUI.config(bg=default_bg); step3LabelUI.config(bg=default_bg); step4LabelUI.config(bg="yellow"); step5LabelUI.config(bg=default_bg); 
            if step == Step5:
                step1LabelUI.config(bg=default_bg); step2LabelUI.config(bg=default_bg); step3LabelUI.config(bg=default_bg); step4LabelUI.config(bg=default_bg); step5LabelUI.config(bg="yellow"); 
            
            MySerial.irradiate(True, perc, step.filterA, step.filterB)
            prevTime = time.time()

            messagesUI.config(text="Cycle " +str(currentCycle+1))
            
            while time.time() - prevTime < duration: pass
                
            MySerial.irradiate(False, perc, step.filterA, step.filterB)
            
        currentCycle +=1    



def setFilterA():
    MySerial.setFilterA(setFAListUI.get())


def setFilterB():
    MySerial.setFilterB(setFBListUI.get())



def updateDuration(): pass



v_test     = tk.IntVar ()
v_test.set(0)
columnLabelIntensityUI = tk.Label(text = "Intensity (%)"); columnLabelIntensityUI.grid (column = 1, row = 0);
columnLabelDurationUI = tk.Label(text = "Duration (s)"); columnLabelDurationUI.grid (column = 2, row = 0)
columnLabelFAUI = tk.Label(text = "Filter A");    columnLabelFAUI.grid (column = 3, row = 0)
columnLabelFBUI = tk.Label(text = "Filter B");    columnLabelFBUI.grid (column = 4, row = 0)
columnLabelTestUI = tk.Radiobutton(variable = v_test, value = 0, text = "No test");    columnLabelTestUI.grid (column = 5, row = 0)

connexionLabelUI = tk.Label(text = "COM port:");            connexionLabelUI.grid (column = 7, row = 0)
connexionEntryUI = tk.Entry(width=10);                      connexionEntryUI.grid (column = 8, row = 0)
connexionOKUI = tk.Button(text="OK", command=definePort);   connexionOKUI.grid (column = 9, row = 0)
setFALabelUI = tk.Label(text = "Set filter A:");            setFALabelUI.grid (column = 7, row = 1)
setFAListUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);  setFAListUI.grid (column = 8, row = 1)
setFAokUI = tk.Button(text="OK", command=setFilterA);                           setFAokUI.grid (column = 9, row = 1)
setFBLabelUI = tk.Label(text = "Set filter B:");            setFBLabelUI.grid (column = 7, row = 2)
setFBListUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);  setFBListUI.grid (column = 8, row = 2)
setFBokUI = tk.Button(text="OK", command=setFilterB);                           setFBokUI.grid (column = 9, row = 2)
setNbCyclesLabelUI = tk.Label(text="Nb cycles:");           setNbCyclesLabelUI.grid (column = 7, row = 3)
setNbCyclesUI = tk.Entry(width=10);                         setNbCyclesUI.grid (column = 8, row = 3);       setNbCyclesUI.insert(0,"1")
setCyclesOkUI = tk.Button(text="OK", command=updateDuration);     setCyclesOkUI.grid (column = 9, row = 3)

startUI = tk.Button(text="Start", command=startSequence);                                 startUI.grid (column = 7, row = 4)
#stopUI = tk.Button(text="Stop", command=stopSequence);                                   stopUI.grid (column = 8, row = 4)
resetUI = tk.Button(text="Reset", command=MySerial.reset);         resetUI.grid (column = 9, row = 4)
messagesUI = tk.Label(relief="groove", width=20);                  messagesUI.grid(column = 7, columnspan=3, row = 5, rowspan=1)


step1LabelUI = tk.Label(text = "Step 1");                   step1LabelUI.grid (column = 0, row = 1);
step1IntensityUI = tk.Entry(width=10);                      step1IntensityUI.grid (column = 1, row = 1); step1IntensityUI.insert(0,"0")
step1DurationUI = tk.Entry(width=10);                       step1DurationUI.grid (column = 2, row = 1);  step1DurationUI.insert(0,"0")
step1FAUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step1FAUI.grid (column = 3, row = 1);        step1FAUI.current(0)
step1FBUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step1FBUI.grid (column = 4, row = 1);        step1FBUI.current(0)
step1TestUI = tk.Radiobutton(variable = v_test, value = 1); step1TestUI.grid (column = 5, row = 1);
step1OKUI = tk.Button(text="Confirm", command=lambda: Step1.update(step1IntensityUI.get(), step1DurationUI.get(), step1FAUI.get(), step1FBUI.get(), v_test.get()));    step1OKUI.grid (column = 6, row = 1)

step2LabelUI = tk.Label(text = "Step 2");                   step2LabelUI.grid (column = 0, row = 2);
step2IntensityUI = tk.Entry(width=10);                      step2IntensityUI.grid (column = 1, row = 2); step2IntensityUI.insert(0,"0")
step2DurationUI = tk.Entry(width=10);                       step2DurationUI.grid (column = 2, row = 2);  step2DurationUI.insert(0,"0")
step2FAUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step2FAUI.grid (column = 3, row = 2);        step2FAUI.current(0)
step2FBUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step2FBUI.grid (column = 4, row = 2);        step2FBUI.current(0)
step2TestUI = tk.Radiobutton(variable = v_test, value = 2); step2TestUI.grid (column = 5, row = 2);
step2OKUI = tk.Button(text="Confirm", command=lambda: Step2.update(step2IntensityUI.get(), step2DurationUI.get(), step2FAUI.get(), step2FBUI.get(), v_test.get()));    step2OKUI.grid (column = 6, row = 2)

step3LabelUI = tk.Label(text = "Step 3");                   step3LabelUI.grid (column = 0, row = 3);
step3IntensityUI = tk.Entry(width=10);                      step3IntensityUI.grid (column = 1, row = 3); step3IntensityUI.insert(0,"0")
step3DurationUI = tk.Entry(width=10);                       step3DurationUI.grid (column = 2, row = 3);  step3DurationUI.insert(0,"0")
step3FAUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step3FAUI.grid (column = 3, row = 3);        step3FAUI.current(0)
step3FBUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step3FBUI.grid (column = 4, row = 3);        step3FBUI.current(0)
step3TestUI = tk.Radiobutton(variable = v_test, value = 3); step3TestUI.grid (column = 5, row = 3);
step3OKUI = tk.Button(text="Confirm", command=lambda: Step3.update(step3IntensityUI.get(), step3DurationUI.get(), step3FAUI.get(), step3FBUI.get(), v_test.get()));    step3OKUI.grid (column = 6, row = 3)

step4LabelUI = tk.Label(text = "Step 4");                   step4LabelUI.grid (column = 0, row = 4);
step4IntensityUI = tk.Entry(width=10);                      step4IntensityUI.grid (column = 1, row = 4); step4IntensityUI.insert(0,"0")
step4DurationUI = tk.Entry(width=10);                       step4DurationUI.grid (column = 2, row = 4);  step4DurationUI.insert(0,"0")
step4FAUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step4FAUI.grid (column = 3, row = 4);        step4FAUI.current(0)
step4FBUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step4FBUI.grid (column = 4, row = 4);        step4FBUI.current(0)
step4TestUI = tk.Radiobutton(variable = v_test, value = 4); step4TestUI.grid (column = 5, row = 4);
step4OKUI = tk.Button(text="Confirm", command=lambda: Step4.update(step4IntensityUI.get(), step4DurationUI.get(), step4FAUI.get(), step4FBUI.get(), v_test.get()));    step4OKUI.grid (column = 6, row = 4)

step5LabelUI = tk.Label(text = "Step 5");                   step5LabelUI.grid (column = 0, row = 5);
step5IntensityUI = tk.Entry(width=10);                      step5IntensityUI.grid (column = 1, row = 5); step5IntensityUI.insert(0,"0")
step5DurationUI = tk.Entry(width=10);                       step5DurationUI.grid (column = 2, row = 5);  step5DurationUI.insert(0,"0")
step5FAUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step5FAUI.grid (column = 3, row = 5);        step5FAUI.current(0)
step5FBUI = ttk.Combobox(values=[1,2,3,4,5,6], width=7);    step5FBUI.grid (column = 4, row = 5);        step5FBUI.current(0)
step5TestUI = tk.Radiobutton(variable = v_test, value = 5); step5TestUI.grid (column = 5, row = 5);
step5OKUI = tk.Button(text="Confirm", command=lambda: Step5.update(step5IntensityUI.get(), step5DurationUI.get(), step5FAUI.get(), step5FBUI.get(), v_test.get()));    step5OKUI.grid (column = 6, row = 5)


root.mainloop ()       # on affiche enfin la fenêtre principale et on attend
                       # les événements (souris, clic, clavier)



ser.write("INP\r".encode())
ser.write("CNT1\r".encode())
ser.write("PROG_1STEP\r".encode())








tempStr = ""
stepNo = 1
steps=[]
nbCycles=0
shutterOpen()
while True:
    while True:
        tempStr = input("Step "+str(stepNo)+" - Output percentage (ok to confirm): ")
        if tempStr == "ok":
            break
        else:
            perc = tempStr
        intSet(perc)
    
    duration = int(input("Duration (sec): "))
    steps.append([perc,duration])
    
    if input("Stop now? (y/n): ")=="y":
        break
    stepNo +=1
    
    
    
    
shutterClose()  
print(steps)




tempStr = input("Nb of cycles (0 to stop): ")
if tempStr != 0:
    nbCycles = int(tempStr)
    currentCycle = 0
    
    
    while currentCycle < nbCycles:
        for step in steps:
            perc,duration = step
            
            intSet(perc)
            prevTime = time.time()
            while time.time() - prevTime < 5: pass   # Wait for the intensity to reach the command (about 5 sec).
            
            prevTime = time.time()
            shutterOpen()
            print("Cycle " +str(currentCycle+1)+ ", step: " +perc+ "%, " + str(duration) + " s.")
            
            while time.time() - prevTime < duration: pass
                
            shutterClose()
        currentCycle +=1
            
        
ser.write("PROG_7STEP\r".encode())    

        
        
        
        

while ser.isOpen():
    while ser.inWaiting():
        ligne = ser.read()
        print(ligne)
    
    chaine=input("\nSaisir une chaine :")+'\r'
    test = chaine.encode()
    ser.write(chaine.encode())
    
    while ser.inWaiting():
        ligne = ser.read()
        print(ligne)    
ser.close()             # close port