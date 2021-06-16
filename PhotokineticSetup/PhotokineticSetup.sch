EESchema Schematic File Version 4
LIBS:PhotokineticSetup-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x20 J7
U 1 1 60C48809
P 4250 3950
F 0 "J7" H 4200 2800 50  0000 L CNN
F 1 "Conn_01x20" H 4200 2700 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 4250 3950 50  0001 C CNN
F 3 "~" H 4250 3950 50  0001 C CNN
	1    4250 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x20 J8
U 1 1 60C48902
P 5050 3950
F 0 "J8" H 5050 2800 50  0000 L CNN
F 1 "Conn_01x20" H 4700 2700 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 5050 3950 50  0001 C CNN
F 3 "~" H 5050 3950 50  0001 C CNN
	1    5050 3950
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0101
U 1 1 60C48B4D
P 5600 2650
F 0 "#PWR0101" H 5600 2500 50  0001 C CNN
F 1 "+3V3" H 5615 2823 50  0000 C CNN
F 2 "" H 5600 2650 50  0001 C CNN
F 3 "" H 5600 2650 50  0001 C CNN
	1    5600 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3250 5600 3250
Wire Wire Line
	5600 3250 5600 2650
Wire Wire Line
	5250 3150 5350 3150
Wire Wire Line
	5350 3150 5350 3050
Wire Wire Line
	5350 3050 5250 3050
Wire Wire Line
	5350 3050 6350 3050
Connection ~ 5350 3050
$Comp
L power:GND #PWR0102
U 1 1 60C48C0F
P 6350 3100
F 0 "#PWR0102" H 6350 2850 50  0001 C CNN
F 1 "GND" H 6355 2927 50  0000 C CNN
F 2 "" H 6350 3100 50  0001 C CNN
F 3 "" H 6350 3100 50  0001 C CNN
	1    6350 3100
	1    0    0    -1  
$EndComp
NoConn ~ 5250 3350
NoConn ~ 5250 3650
NoConn ~ 5250 3750
NoConn ~ 5250 4050
NoConn ~ 5250 4650
NoConn ~ 5250 4750
NoConn ~ 5250 4850
NoConn ~ 5250 4950
$Comp
L Interface_UART:MAX232 U1
U 1 1 60C48E67
P 8250 2950
F 0 "U1" H 7750 4250 50  0000 C CNN
F 1 "MAX232" H 7850 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 8300 1900 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8250 3050 50  0001 C CNN
	1    8250 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3050 6350 3100
Wire Wire Line
	7450 3450 5250 3450
Wire Wire Line
	5250 3550 6800 3550
Wire Wire Line
	6800 3550 6800 3050
Wire Wire Line
	6800 3050 7450 3050
Text Label 5400 3450 0    50   ~ 0
PB11
Text Label 5400 3550 0    50   ~ 0
PB10
NoConn ~ 9050 3250
NoConn ~ 9050 3650
$Comp
L Device:CP C1
U 1 1 60C491F5
P 7200 2200
F 0 "C1" H 7318 2246 50  0000 L CNN
F 1 "1u" H 7318 2155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 7238 2050 50  0001 C CNN
F 3 "~" H 7200 2200 50  0001 C CNN
	1    7200 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 60C4923D
P 9250 2200
F 0 "C2" H 9368 2246 50  0000 L CNN
F 1 "1u" H 9368 2155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 9288 2050 50  0001 C CNN
F 3 "~" H 9250 2200 50  0001 C CNN
	1    9250 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2050 7450 2050
Wire Wire Line
	7200 2350 7450 2350
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 60C4B47A
P 9850 3200
F 0 "J2" H 9930 3192 50  0000 L CNN
F 1 "Serial" H 9930 3101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9850 3200 50  0001 C CNN
F 3 "~" H 9850 3200 50  0001 C CNN
	1    9850 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3050 9350 3050
Wire Wire Line
	9350 3200 9650 3200
Wire Wire Line
	9650 3300 9350 3300
Wire Wire Line
	9350 3450 9050 3450
Wire Wire Line
	9350 3300 9350 3450
Wire Wire Line
	9350 3050 9350 3200
$Comp
L Device:CP C3
U 1 1 60C4BDE0
P 9650 2550
F 0 "C3" V 9800 2450 50  0000 C CNN
F 1 "1u" V 9700 2450 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 9688 2400 50  0001 C CNN
F 3 "~" H 9650 2550 50  0001 C CNN
	1    9650 2550
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C4
U 1 1 60C4C53B
P 9650 2850
F 0 "C4" V 9700 2750 50  0000 C CNN
F 1 "1u" V 9800 2750 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 9688 2700 50  0001 C CNN
F 3 "~" H 9650 2850 50  0001 C CNN
	1    9650 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 2050 9250 2050
Wire Wire Line
	9050 2350 9250 2350
Wire Wire Line
	9050 2550 9500 2550
Wire Wire Line
	9500 2850 9050 2850
Wire Wire Line
	9800 2550 9900 2550
Wire Wire Line
	9900 2550 9900 2850
Wire Wire Line
	9900 2850 9800 2850
Wire Wire Line
	9900 2550 10250 2550
Wire Wire Line
	10250 2550 10250 2750
Connection ~ 9900 2550
$Comp
L power:GND #PWR0103
U 1 1 60C4D837
P 10250 2750
F 0 "#PWR0103" H 10250 2500 50  0001 C CNN
F 1 "GND" H 10255 2577 50  0000 C CNN
F 2 "" H 10250 2750 50  0001 C CNN
F 3 "" H 10250 2750 50  0001 C CNN
	1    10250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4150 8250 4350
$Comp
L power:GND #PWR0104
U 1 1 60C4DEDC
P 8000 5400
F 0 "#PWR0104" H 8000 5150 50  0001 C CNN
F 1 "GND" H 8005 5227 50  0000 C CNN
F 2 "" H 8000 5400 50  0001 C CNN
F 3 "" H 8000 5400 50  0001 C CNN
	1    8000 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 60C4E41D
P 8250 850
F 0 "#PWR0105" H 8250 700 50  0001 C CNN
F 1 "+5V" H 8265 1023 50  0000 C CNN
F 2 "" H 8250 850 50  0001 C CNN
F 3 "" H 8250 850 50  0001 C CNN
	1    8250 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 60C4E83D
P 8700 1300
F 0 "C5" H 8818 1346 50  0000 L CNN
F 1 "1u" H 8818 1255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 8738 1150 50  0001 C CNN
F 3 "~" H 8700 1300 50  0001 C CNN
	1    8700 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60C4ECA0
P 8700 1550
F 0 "#PWR0106" H 8700 1300 50  0001 C CNN
F 1 "GND" H 8850 1550 50  0000 C CNN
F 2 "" H 8700 1550 50  0001 C CNN
F 3 "" H 8700 1550 50  0001 C CNN
	1    8700 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 850  8250 1000
Wire Wire Line
	8250 1000 8700 1000
Connection ~ 8250 1000
Wire Wire Line
	8250 1000 8250 1750
Wire Wire Line
	8700 1450 8700 1550
Wire Wire Line
	8700 1000 8700 1150
Wire Wire Line
	6250 3850 6250 3950
Wire Wire Line
	6250 3950 6500 3950
Wire Wire Line
	6500 4050 6250 4050
Wire Wire Line
	6250 4050 6250 4150
Wire Wire Line
	6250 4150 6050 4150
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 60C53EF0
P 6700 3950
F 0 "J3" H 6779 3942 50  0000 L CNN
F 1 "LEDs" H 6779 3851 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6700 3950 50  0001 C CNN
F 3 "~" H 6700 3950 50  0001 C CNN
	1    6700 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60C5409B
P 5900 3850
F 0 "R1" V 5800 3750 50  0000 C CNN
F 1 "82" V 5800 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5830 3850 50  0001 C CNN
F 3 "~" H 5900 3850 50  0001 C CNN
	1    5900 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 3850 6250 3850
$Comp
L Device:R R2
U 1 1 60C540F1
P 5900 4150
F 0 "R2" V 5800 4050 50  0000 C CNN
F 1 "68" V 5800 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5830 4150 50  0001 C CNN
F 3 "~" H 5900 4150 50  0001 C CNN
	1    5900 4150
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 60C5470D
P 4950 1400
F 0 "J1" H 5030 1392 50  0000 L CNN
F 1 "Conn_01x02" H 5030 1301 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4950 1400 50  0001 C CNN
F 3 "~" H 4950 1400 50  0001 C CNN
	1    4950 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0107
U 1 1 60C54EC2
P 4450 1300
F 0 "#PWR0107" H 4450 1150 50  0001 C CNN
F 1 "+3V3" H 4465 1473 50  0000 C CNN
F 2 "" H 4450 1300 50  0001 C CNN
F 3 "" H 4450 1300 50  0001 C CNN
	1    4450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1300 4450 1400
Wire Wire Line
	4450 1400 4750 1400
Wire Wire Line
	4750 1500 4450 1500
Wire Wire Line
	4450 1500 4450 1650
$Comp
L power:GND #PWR0108
U 1 1 60C568AC
P 4450 1650
F 0 "#PWR0108" H 4450 1400 50  0001 C CNN
F 1 "GND" H 4455 1477 50  0000 C CNN
F 2 "" H 4450 1650 50  0001 C CNN
F 3 "" H 4450 1650 50  0001 C CNN
	1    4450 1650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 60C574C6
P 3000 3250
F 0 "J4" H 2920 3467 50  0000 C CNN
F 1 "Switches" H 2920 3376 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3000 3250 50  0001 C CNN
F 3 "~" H 3000 3250 50  0001 C CNN
	1    3000 3250
	-1   0    0    -1  
$EndComp
NoConn ~ 4050 3050
NoConn ~ 4050 3150
NoConn ~ 4050 3650
NoConn ~ 4050 3750
NoConn ~ 4050 4950
NoConn ~ 4050 4650
NoConn ~ 4050 4550
NoConn ~ 4050 4450
NoConn ~ 4050 4350
NoConn ~ 4050 4150
NoConn ~ 4050 4250
NoConn ~ 4050 4050
NoConn ~ 4050 3950
NoConn ~ 4050 3850
Wire Wire Line
	3200 3250 4050 3250
Wire Wire Line
	3200 3350 4050 3350
Text Label 3750 3250 0    50   ~ 0
PB14
Text Label 3750 3350 0    50   ~ 0
PB15
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 60C63AA5
P 1050 3850
F 0 "J5" H 970 4067 50  0000 C CNN
F 1 "Outputs" H 970 3976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1050 3850 50  0001 C CNN
F 3 "~" H 1050 3850 50  0001 C CNN
	1    1050 3850
	-1   0    0    -1  
$EndComp
Text Label 3750 3450 0    50   ~ 0
PA8
Text Label 3750 3550 0    50   ~ 0
PA9
Wire Wire Line
	3400 3450 3400 3850
Wire Wire Line
	3400 3850 3250 3850
Wire Wire Line
	3400 3450 4050 3450
Wire Wire Line
	3650 4550 3250 4550
Wire Wire Line
	3650 3550 4050 3550
$Comp
L Device:R R3
U 1 1 60C6F52D
P 3100 3850
F 0 "R3" V 2893 3850 50  0000 C CNN
F 1 "270" V 2984 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3030 3850 50  0001 C CNN
F 3 "~" H 3100 3850 50  0001 C CNN
	1    3100 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 60C6F635
P 3100 4550
F 0 "R4" V 2893 4550 50  0000 C CNN
F 1 "270" V 2984 4550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3030 4550 50  0001 C CNN
F 3 "~" H 3100 4550 50  0001 C CNN
	1    3100 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 4850 3850 4850
$Comp
L power:GND #PWR0109
U 1 1 60C80ED1
P 3850 5400
F 0 "#PWR0109" H 3850 5150 50  0001 C CNN
F 1 "GND" H 3855 5227 50  0000 C CNN
F 2 "" H 3850 5400 50  0001 C CNN
F 3 "" H 3850 5400 50  0001 C CNN
	1    3850 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4750 3850 4750
$Comp
L power:+5V #PWR0110
U 1 1 60C82BDD
P 3850 4400
F 0 "#PWR0110" H 3850 4250 50  0001 C CNN
F 1 "+5V" H 3865 4573 50  0000 C CNN
F 2 "" H 3850 4400 50  0001 C CNN
F 3 "" H 3850 4400 50  0001 C CNN
	1    3850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4850 3850 5400
Wire Wire Line
	3850 4400 3850 4750
Wire Wire Line
	5250 4150 5750 4150
Text Label 5400 3850 0    50   ~ 0
PA7
Text Label 5400 4150 0    50   ~ 0
PA4
Wire Wire Line
	5250 3850 5750 3850
NoConn ~ 5250 3950
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 60C97537
P 9250 5200
F 0 "J6" H 9170 5417 50  0000 C CNN
F 1 "Inputs" H 9170 5326 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9250 5200 50  0001 C CNN
F 3 "~" H 9250 5200 50  0001 C CNN
	1    9250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4450 5800 4450
Wire Wire Line
	5250 4550 5700 4550
Text Label 5400 4450 0    50   ~ 0
PA1
Text Label 5400 4550 0    50   ~ 0
PA0
Wire Wire Line
	2550 3850 2950 3850
Wire Wire Line
	2550 4550 2950 4550
$Comp
L Isolator:ILD74 U2
U 1 1 60C74D7D
P 2250 3950
F 0 "U2" H 2250 4275 50  0000 C CNN
F 1 "ILD615" H 2250 4184 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 2050 3750 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 2250 3950 50  0001 L CNN
	1    2250 3950
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:ILD74 U2
U 2 1 60C76FC2
P 2250 4650
F 0 "U2" H 2250 4975 50  0000 C CNN
F 1 "ILD615" H 2250 4884 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 2050 4450 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 2250 4650 50  0001 L CNN
	2    2250 4650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2550 4050 2700 4050
Wire Wire Line
	2700 4750 2550 4750
$Comp
L power:GND #PWR0111
U 1 1 60C7B5E7
P 2700 4850
F 0 "#PWR0111" H 2700 4600 50  0001 C CNN
F 1 "GND" H 2705 4677 50  0000 C CNN
F 2 "" H 2700 4850 50  0001 C CNN
F 3 "" H 2700 4850 50  0001 C CNN
	1    2700 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0112
U 1 1 60C823DA
P 1800 3300
F 0 "#PWR0112" H 1800 3150 50  0001 C CNN
F 1 "+3V3" H 1815 3473 50  0000 C CNN
F 2 "" H 1800 3300 50  0001 C CNN
F 3 "" H 1800 3300 50  0001 C CNN
	1    1800 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 60C82433
P 1800 3550
F 0 "R5" H 1870 3596 50  0000 L CNN
F 1 "1k" H 1870 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1730 3550 50  0001 C CNN
F 3 "~" H 1800 3550 50  0001 C CNN
	1    1800 3550
	1    0    0    -1  
$EndComp
$Comp
L Isolator:ILD74 U3
U 1 1 60CA659A
P 6550 4850
F 0 "U3" H 6550 5175 50  0000 C CNN
F 1 "ILD615" H 6550 5084 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6350 4650 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 6550 4850 50  0001 L CNN
	1    6550 4850
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:ILD74 U3
U 2 1 60CA65A1
P 6550 5600
F 0 "U3" H 6550 5925 50  0000 C CNN
F 1 "ILD615" H 6550 5834 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6350 5400 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 6550 5600 50  0001 L CNN
	2    6550 5600
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 60CA929B
P 7100 4750
F 0 "R7" V 6893 4750 50  0000 C CNN
F 1 "470" V 6984 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7030 4750 50  0001 C CNN
F 3 "~" H 7100 4750 50  0001 C CNN
	1    7100 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 60CA92A2
P 7100 5500
F 0 "R8" V 6893 5500 50  0000 C CNN
F 1 "470" V 6984 5500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7030 5500 50  0001 C CNN
F 3 "~" H 7100 5500 50  0001 C CNN
	1    7100 5500
	0    1    1    0   
$EndComp
$Sheet
S 1300 1000 1100 1550
U 60CE5BD0
F0 "Sheet60CE5BCF" 50
F1 "Panel.sch" 50
$EndSheet
Wire Wire Line
	5250 4250 7350 4250
Wire Wire Line
	7350 4250 7350 3650
Wire Wire Line
	7350 3650 7450 3650
Wire Wire Line
	5250 4350 7250 4350
Wire Wire Line
	7250 4350 7250 3250
Wire Wire Line
	7250 3250 7450 3250
Text Label 5400 4250 0    50   ~ 0
PA3
Text Label 5400 4350 0    50   ~ 0
PA2
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 60CA79CE
P 8100 5200
F 0 "Q1" H 8291 5246 50  0000 L CNN
F 1 "2N3904" H 8291 5155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8300 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 8100 5200 50  0001 L CNN
	1    8100 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7250 4750 7350 4750
Wire Wire Line
	7250 5500 7350 5500
$Comp
L power:+3V3 #PWR0113
U 1 1 60CFEBE2
P 7350 4650
F 0 "#PWR0113" H 7350 4500 50  0001 C CNN
F 1 "+3V3" H 7365 4823 50  0000 C CNN
F 2 "" H 7350 4650 50  0001 C CNN
F 3 "" H 7350 4650 50  0001 C CNN
	1    7350 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4650 7350 4750
$Comp
L power:+3V3 #PWR0114
U 1 1 60D3CEA5
P 7350 5400
F 0 "#PWR0114" H 7350 5250 50  0001 C CNN
F 1 "+3V3" H 7365 5573 50  0000 C CNN
F 2 "" H 7350 5400 50  0001 C CNN
F 3 "" H 7350 5400 50  0001 C CNN
	1    7350 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 5400 7350 5500
Wire Wire Line
	6850 4750 6950 4750
Wire Wire Line
	6850 5500 6950 5500
Wire Wire Line
	8000 4950 8000 5000
Wire Wire Line
	6850 4950 8000 4950
$Comp
L power:GND #PWR0115
U 1 1 60D5D869
P 8000 6100
F 0 "#PWR0115" H 8000 5850 50  0001 C CNN
F 1 "GND" H 8005 5927 50  0000 C CNN
F 2 "" H 8000 6100 50  0001 C CNN
F 3 "" H 8000 6100 50  0001 C CNN
	1    8000 6100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 60D5D86F
P 8100 5900
F 0 "Q2" H 8291 5946 50  0000 L CNN
F 1 "2N3904" H 8291 5855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8300 5825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 8100 5900 50  0001 L CNN
	1    8100 5900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6850 5700 8000 5700
Wire Wire Line
	1250 4550 1500 4550
Wire Wire Line
	3650 3550 3650 4550
Wire Wire Line
	2700 4750 2700 4850
$Comp
L power:GND #PWR0116
U 1 1 60DA5A7A
P 2700 4150
F 0 "#PWR0116" H 2700 3900 50  0001 C CNN
F 1 "GND" H 2705 3977 50  0000 C CNN
F 2 "" H 2700 4150 50  0001 C CNN
F 3 "" H 2700 4150 50  0001 C CNN
	1    2700 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4050 2700 4150
Wire Wire Line
	1250 3950 1250 4550
Wire Wire Line
	1250 3850 1800 3850
Wire Wire Line
	1800 3700 1800 3850
Connection ~ 1800 3850
Wire Wire Line
	1800 3850 1950 3850
Wire Wire Line
	1800 3300 1800 3400
$Comp
L power:+3V3 #PWR0117
U 1 1 60DD5CD9
P 1500 3300
F 0 "#PWR0117" H 1500 3150 50  0001 C CNN
F 1 "+3V3" H 1515 3473 50  0000 C CNN
F 2 "" H 1500 3300 50  0001 C CNN
F 3 "" H 1500 3300 50  0001 C CNN
	1    1500 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 60DD5CDF
P 1500 3550
F 0 "R6" H 1570 3596 50  0000 L CNN
F 1 "1k" H 1570 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1430 3550 50  0001 C CNN
F 3 "~" H 1500 3550 50  0001 C CNN
	1    1500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3300 1500 3400
Wire Wire Line
	1500 3700 1500 4550
Connection ~ 1500 4550
Wire Wire Line
	1500 4550 1950 4550
$Comp
L power:GND #PWR0118
U 1 1 60DE4BAC
P 1800 4150
F 0 "#PWR0118" H 1800 3900 50  0001 C CNN
F 1 "GND" H 1805 3977 50  0000 C CNN
F 2 "" H 1800 4150 50  0001 C CNN
F 3 "" H 1800 4150 50  0001 C CNN
	1    1800 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4050 1800 4150
Wire Wire Line
	1800 4050 1950 4050
$Comp
L power:GND #PWR0119
U 1 1 60DEC972
P 1800 4850
F 0 "#PWR0119" H 1800 4600 50  0001 C CNN
F 1 "GND" H 1805 4677 50  0000 C CNN
F 2 "" H 1800 4850 50  0001 C CNN
F 3 "" H 1800 4850 50  0001 C CNN
	1    1800 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4750 1800 4850
Wire Wire Line
	1800 4750 1950 4750
$Comp
L Device:R R10
U 1 1 60CA7C5E
P 8600 5900
F 0 "R10" V 8393 5900 50  0000 C CNN
F 1 "1k" V 8484 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8530 5900 50  0001 C CNN
F 3 "~" H 8600 5900 50  0001 C CNN
	1    8600 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 5900 8900 5300
Wire Wire Line
	8900 5300 9050 5300
Wire Wire Line
	8300 5900 8450 5900
Wire Wire Line
	8750 5900 8900 5900
$Comp
L Device:R R9
U 1 1 60CC280A
P 8600 5200
F 0 "R9" V 8393 5200 50  0000 C CNN
F 1 "1k" V 8484 5200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8530 5200 50  0001 C CNN
F 3 "~" H 8600 5200 50  0001 C CNN
	1    8600 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 5200 9050 5200
Wire Wire Line
	8300 5200 8450 5200
Wire Wire Line
	5800 4950 6250 4950
Wire Wire Line
	5700 5700 6250 5700
Wire Wire Line
	5700 4550 5700 5700
Wire Wire Line
	5800 4450 5800 4950
$Comp
L power:+3V3 #PWR?
U 1 1 60CB66A4
P 6100 4650
F 0 "#PWR?" H 6100 4500 50  0001 C CNN
F 1 "+3V3" H 6115 4823 50  0000 C CNN
F 2 "" H 6100 4650 50  0001 C CNN
F 3 "" H 6100 4650 50  0001 C CNN
	1    6100 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4650 6100 4750
Wire Wire Line
	6100 4750 6250 4750
$Comp
L power:+3V3 #PWR?
U 1 1 60CBE08A
P 6100 5400
F 0 "#PWR?" H 6100 5250 50  0001 C CNN
F 1 "+3V3" H 6115 5573 50  0000 C CNN
F 2 "" H 6100 5400 50  0001 C CNN
F 3 "" H 6100 5400 50  0001 C CNN
	1    6100 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5400 6100 5500
Wire Wire Line
	6100 5500 6250 5500
$EndSCHEMATC
