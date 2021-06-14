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
P 3850 4600
F 0 "J7" H 3800 3450 50  0000 L CNN
F 1 "Conn_01x20" H 3800 3350 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 3850 4600 50  0001 C CNN
F 3 "~" H 3850 4600 50  0001 C CNN
	1    3850 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x20 J8
U 1 1 60C48902
P 4850 4600
F 0 "J8" H 4850 3450 50  0000 L CNN
F 1 "Conn_01x20" H 4500 3350 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 4850 4600 50  0001 C CNN
F 3 "~" H 4850 4600 50  0001 C CNN
	1    4850 4600
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0101
U 1 1 60C48B4D
P 5400 3300
F 0 "#PWR0101" H 5400 3150 50  0001 C CNN
F 1 "+3V3" H 5415 3473 50  0000 C CNN
F 2 "" H 5400 3300 50  0001 C CNN
F 3 "" H 5400 3300 50  0001 C CNN
	1    5400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3900 5400 3900
Wire Wire Line
	5400 3900 5400 3300
Wire Wire Line
	5050 3800 5150 3800
Wire Wire Line
	5150 3800 5150 3700
Wire Wire Line
	5150 3700 5050 3700
Wire Wire Line
	5150 3700 6150 3700
Connection ~ 5150 3700
$Comp
L power:GND #PWR0102
U 1 1 60C48C0F
P 6150 3750
F 0 "#PWR0102" H 6150 3500 50  0001 C CNN
F 1 "GND" H 6155 3577 50  0000 C CNN
F 2 "" H 6150 3750 50  0001 C CNN
F 3 "" H 6150 3750 50  0001 C CNN
	1    6150 3750
	1    0    0    -1  
$EndComp
NoConn ~ 5050 4000
NoConn ~ 5050 4300
NoConn ~ 5050 4400
NoConn ~ 5050 4700
NoConn ~ 5050 5300
NoConn ~ 5050 5400
NoConn ~ 5050 5500
NoConn ~ 5050 5600
$Comp
L Interface_UART:MAX232 U1
U 1 1 60C48E67
P 8050 3600
F 0 "U1" H 7550 4900 50  0000 C CNN
F 1 "MAX232" H 7650 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 8100 2550 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8050 3700 50  0001 C CNN
	1    8050 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3700 6150 3750
Wire Wire Line
	7250 4100 5050 4100
Wire Wire Line
	5050 4200 6600 4200
Wire Wire Line
	6600 4200 6600 3700
Wire Wire Line
	6600 3700 7250 3700
Text Label 5200 4100 0    50   ~ 0
PB11
Text Label 5200 4200 0    50   ~ 0
PB10
NoConn ~ 8850 3900
NoConn ~ 8850 4300
$Comp
L Device:CP C1
U 1 1 60C491F5
P 7000 2850
F 0 "C1" H 7118 2896 50  0000 L CNN
F 1 "1u" H 7118 2805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 7038 2700 50  0001 C CNN
F 3 "~" H 7000 2850 50  0001 C CNN
	1    7000 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 60C4923D
P 9050 2850
F 0 "C2" H 9168 2896 50  0000 L CNN
F 1 "1u" H 9168 2805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 9088 2700 50  0001 C CNN
F 3 "~" H 9050 2850 50  0001 C CNN
	1    9050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2700 7250 2700
Wire Wire Line
	7000 3000 7250 3000
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 60C4B47A
P 9650 3850
F 0 "J2" H 9730 3842 50  0000 L CNN
F 1 "Serial" H 9730 3751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9650 3850 50  0001 C CNN
F 3 "~" H 9650 3850 50  0001 C CNN
	1    9650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3700 9150 3700
Wire Wire Line
	9150 3850 9450 3850
Wire Wire Line
	9450 3950 9150 3950
Wire Wire Line
	9150 4100 8850 4100
Wire Wire Line
	9150 3950 9150 4100
Wire Wire Line
	9150 3700 9150 3850
$Comp
L Device:CP C3
U 1 1 60C4BDE0
P 9450 3200
F 0 "C3" V 9600 3100 50  0000 C CNN
F 1 "1u" V 9500 3100 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 9488 3050 50  0001 C CNN
F 3 "~" H 9450 3200 50  0001 C CNN
	1    9450 3200
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C4
U 1 1 60C4C53B
P 9450 3500
F 0 "C4" V 9500 3400 50  0000 C CNN
F 1 "1u" V 9600 3400 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 9488 3350 50  0001 C CNN
F 3 "~" H 9450 3500 50  0001 C CNN
	1    9450 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 2700 9050 2700
Wire Wire Line
	8850 3000 9050 3000
Wire Wire Line
	8850 3200 9300 3200
Wire Wire Line
	9300 3500 8850 3500
Wire Wire Line
	9600 3200 9700 3200
Wire Wire Line
	9700 3200 9700 3500
Wire Wire Line
	9700 3500 9600 3500
Wire Wire Line
	9700 3200 10050 3200
Wire Wire Line
	10050 3200 10050 3400
Connection ~ 9700 3200
$Comp
L power:GND #PWR0103
U 1 1 60C4D837
P 10050 3400
F 0 "#PWR0103" H 10050 3150 50  0001 C CNN
F 1 "GND" H 10055 3227 50  0000 C CNN
F 2 "" H 10050 3400 50  0001 C CNN
F 3 "" H 10050 3400 50  0001 C CNN
	1    10050 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4800 8050 5000
$Comp
L power:GND #PWR0104
U 1 1 60C4DEDC
P 8050 5000
F 0 "#PWR0104" H 8050 4750 50  0001 C CNN
F 1 "GND" H 8055 4827 50  0000 C CNN
F 2 "" H 8050 5000 50  0001 C CNN
F 3 "" H 8050 5000 50  0001 C CNN
	1    8050 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 60C4E41D
P 8050 1500
F 0 "#PWR0105" H 8050 1350 50  0001 C CNN
F 1 "+5V" H 8065 1673 50  0000 C CNN
F 2 "" H 8050 1500 50  0001 C CNN
F 3 "" H 8050 1500 50  0001 C CNN
	1    8050 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 60C4E83D
P 8500 1950
F 0 "C5" H 8618 1996 50  0000 L CNN
F 1 "1u" H 8618 1905 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 8538 1800 50  0001 C CNN
F 3 "~" H 8500 1950 50  0001 C CNN
	1    8500 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60C4ECA0
P 8500 2200
F 0 "#PWR0106" H 8500 1950 50  0001 C CNN
F 1 "GND" H 8650 2200 50  0000 C CNN
F 2 "" H 8500 2200 50  0001 C CNN
F 3 "" H 8500 2200 50  0001 C CNN
	1    8500 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1500 8050 1650
Wire Wire Line
	8050 1650 8500 1650
Connection ~ 8050 1650
Wire Wire Line
	8050 1650 8050 2400
Wire Wire Line
	8500 2100 8500 2200
Wire Wire Line
	8500 1650 8500 1800
Wire Wire Line
	6050 4500 6050 4600
Wire Wire Line
	6050 4600 6300 4600
Wire Wire Line
	6300 4700 6050 4700
Wire Wire Line
	6050 4700 6050 4800
Wire Wire Line
	6050 4800 5850 4800
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 60C53EF0
P 6500 4600
F 0 "J3" H 6579 4592 50  0000 L CNN
F 1 "LEDs" H 6579 4501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6500 4600 50  0001 C CNN
F 3 "~" H 6500 4600 50  0001 C CNN
	1    6500 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60C5409B
P 5700 4500
F 0 "R1" V 5600 4400 50  0000 C CNN
F 1 "150" V 5600 4600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5630 4500 50  0001 C CNN
F 3 "~" H 5700 4500 50  0001 C CNN
	1    5700 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 4500 6050 4500
$Comp
L Device:R R2
U 1 1 60C540F1
P 5700 4800
F 0 "R2" V 5600 4700 50  0000 C CNN
F 1 "100" V 5600 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5630 4800 50  0001 C CNN
F 3 "~" H 5700 4800 50  0001 C CNN
	1    5700 4800
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 60C5470D
P 3900 2300
F 0 "J1" H 3980 2292 50  0000 L CNN
F 1 "Conn_01x02" H 3980 2201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3900 2300 50  0001 C CNN
F 3 "~" H 3900 2300 50  0001 C CNN
	1    3900 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0107
U 1 1 60C54EC2
P 3400 2200
F 0 "#PWR0107" H 3400 2050 50  0001 C CNN
F 1 "+3V3" H 3415 2373 50  0000 C CNN
F 2 "" H 3400 2200 50  0001 C CNN
F 3 "" H 3400 2200 50  0001 C CNN
	1    3400 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2200 3400 2300
Wire Wire Line
	3400 2300 3700 2300
Wire Wire Line
	3700 2400 3400 2400
Wire Wire Line
	3400 2400 3400 2550
$Comp
L power:GND #PWR0108
U 1 1 60C568AC
P 3400 2550
F 0 "#PWR0108" H 3400 2300 50  0001 C CNN
F 1 "GND" H 3405 2377 50  0000 C CNN
F 2 "" H 3400 2550 50  0001 C CNN
F 3 "" H 3400 2550 50  0001 C CNN
	1    3400 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 60C574C6
P 2600 3900
F 0 "J4" H 2520 4117 50  0000 C CNN
F 1 "Switches" H 2520 4026 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2600 3900 50  0001 C CNN
F 3 "~" H 2600 3900 50  0001 C CNN
	1    2600 3900
	-1   0    0    -1  
$EndComp
NoConn ~ 3650 3700
NoConn ~ 3650 3800
NoConn ~ 3650 4300
NoConn ~ 3650 4400
NoConn ~ 3650 5600
NoConn ~ 3650 5300
NoConn ~ 3650 5200
NoConn ~ 3650 5100
NoConn ~ 3650 5000
NoConn ~ 3650 4800
NoConn ~ 3650 4900
NoConn ~ 3650 4700
NoConn ~ 3650 4600
NoConn ~ 3650 4500
Wire Wire Line
	2800 3900 3650 3900
Wire Wire Line
	2800 4000 3650 4000
Text Label 3350 3900 0    50   ~ 0
PB14
Text Label 3350 4000 0    50   ~ 0
PB15
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 60C63AA5
P 700 4700
F 0 "J5" H 620 4917 50  0000 C CNN
F 1 "Outputs" H 620 4826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 700 4700 50  0001 C CNN
F 3 "~" H 700 4700 50  0001 C CNN
	1    700  4700
	-1   0    0    -1  
$EndComp
Text Label 3350 4100 0    50   ~ 0
PA8
Text Label 3350 4200 0    50   ~ 0
PA9
Wire Wire Line
	3000 4100 3000 4500
Wire Wire Line
	3000 4500 2850 4500
Wire Wire Line
	3000 4100 3650 4100
Wire Wire Line
	3250 4200 3250 5050
Wire Wire Line
	3250 5050 2850 5050
Wire Wire Line
	3250 4200 3650 4200
$Comp
L Device:R R3
U 1 1 60C6F52D
P 2700 4500
F 0 "R3" V 2493 4500 50  0000 C CNN
F 1 "270" V 2584 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2630 4500 50  0001 C CNN
F 3 "~" H 2700 4500 50  0001 C CNN
	1    2700 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 60C6F635
P 2700 5050
F 0 "R4" V 2493 5050 50  0000 C CNN
F 1 "270" V 2584 5050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2630 5050 50  0001 C CNN
F 3 "~" H 2700 5050 50  0001 C CNN
	1    2700 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 5500 3450 5500
$Comp
L power:GND #PWR0109
U 1 1 60C80ED1
P 3450 6050
F 0 "#PWR0109" H 3450 5800 50  0001 C CNN
F 1 "GND" H 3455 5877 50  0000 C CNN
F 2 "" H 3450 6050 50  0001 C CNN
F 3 "" H 3450 6050 50  0001 C CNN
	1    3450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5400 3450 5400
$Comp
L power:+5V #PWR0110
U 1 1 60C82BDD
P 3450 5050
F 0 "#PWR0110" H 3450 4900 50  0001 C CNN
F 1 "+5V" H 3465 5223 50  0000 C CNN
F 2 "" H 3450 5050 50  0001 C CNN
F 3 "" H 3450 5050 50  0001 C CNN
	1    3450 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5500 3450 6050
Wire Wire Line
	3450 5050 3450 5400
Wire Wire Line
	5050 4800 5550 4800
Text Label 5200 4500 0    50   ~ 0
PA7
Text Label 5200 4800 0    50   ~ 0
PA4
Wire Wire Line
	5050 4500 5550 4500
NoConn ~ 5050 4600
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 60C97537
P 7800 5800
F 0 "J6" H 7720 6017 50  0000 C CNN
F 1 "Inputs" H 7720 5926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7800 5800 50  0001 C CNN
F 3 "~" H 7800 5800 50  0001 C CNN
	1    7800 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5100 5600 5100
Wire Wire Line
	5050 5200 5500 5200
Text Label 5200 5100 0    50   ~ 0
PA1
Text Label 5200 5200 0    50   ~ 0
PA0
Wire Wire Line
	2150 4500 2550 4500
Wire Wire Line
	2150 5050 2550 5050
$Comp
L Isolator:ILD74 U2
U 1 1 60C74D7D
P 1850 4600
F 0 "U2" H 1850 4925 50  0000 C CNN
F 1 "ILD615" H 1850 4834 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 1650 4400 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 1850 4600 50  0001 L CNN
	1    1850 4600
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:ILD74 U2
U 2 1 60C76FC2
P 1850 5150
F 0 "U2" H 1850 5475 50  0000 C CNN
F 1 "ILD615" H 1850 5384 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 1650 4950 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 1850 5150 50  0001 L CNN
	2    1850 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 4700 2300 4700
Wire Wire Line
	2300 4700 2300 5250
Wire Wire Line
	2300 5250 2150 5250
Wire Wire Line
	2300 5250 2300 5400
Connection ~ 2300 5250
$Comp
L power:GND #PWR0111
U 1 1 60C7B5E7
P 2300 5400
F 0 "#PWR0111" H 2300 5150 50  0001 C CNN
F 1 "GND" H 2305 5227 50  0000 C CNN
F 2 "" H 2300 5400 50  0001 C CNN
F 3 "" H 2300 5400 50  0001 C CNN
	1    2300 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0112
U 1 1 60C823DA
P 1250 3850
F 0 "#PWR0112" H 1250 3700 50  0001 C CNN
F 1 "+3V3" H 1265 4023 50  0000 C CNN
F 2 "" H 1250 3850 50  0001 C CNN
F 3 "" H 1250 3850 50  0001 C CNN
	1    1250 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 60C82433
P 1250 4150
F 0 "R5" H 1320 4196 50  0000 L CNN
F 1 "1k" H 1320 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1180 4150 50  0001 C CNN
F 3 "~" H 1250 4150 50  0001 C CNN
	1    1250 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3850 1250 4000
Wire Wire Line
	1250 4300 1250 4500
Wire Wire Line
	1250 4500 1550 4500
Wire Wire Line
	1250 4500 1250 5050
Wire Wire Line
	1250 5050 1550 5050
Connection ~ 1250 4500
Wire Wire Line
	900  4700 1050 4700
Wire Wire Line
	900  4800 900  5250
Wire Wire Line
	900  5250 1350 5250
Wire Wire Line
	1050 4700 1050 5450
Connection ~ 1050 4700
Wire Wire Line
	1050 4700 1550 4700
Wire Wire Line
	1350 5250 1350 5450
Connection ~ 1350 5250
Wire Wire Line
	1350 5250 1550 5250
$Comp
L Device:R R6
U 1 1 60C97099
P 1050 5600
F 0 "R6" H 1120 5646 50  0000 L CNN
F 1 "10k" H 1120 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 980 5600 50  0001 C CNN
F 3 "~" H 1050 5600 50  0001 C CNN
	1    1050 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 60C97103
P 1350 5600
F 0 "R7" H 1420 5646 50  0000 L CNN
F 1 "10k" H 1420 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1280 5600 50  0001 C CNN
F 3 "~" H 1350 5600 50  0001 C CNN
	1    1350 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5750 1050 6000
$Comp
L power:GND #PWR0113
U 1 1 60CA168C
P 1350 6150
F 0 "#PWR0113" H 1350 5900 50  0001 C CNN
F 1 "GND" H 1355 5977 50  0000 C CNN
F 2 "" H 1350 6150 50  0001 C CNN
F 3 "" H 1350 6150 50  0001 C CNN
	1    1350 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5750 1350 6000
Wire Wire Line
	1350 6000 1050 6000
Connection ~ 1350 6000
Wire Wire Line
	1350 6000 1350 6150
$Comp
L Isolator:ILD74 U3
U 1 1 60CA659A
P 6550 5450
F 0 "U3" H 6550 5775 50  0000 C CNN
F 1 "ILD615" H 6550 5684 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6350 5250 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 6550 5450 50  0001 L CNN
	1    6550 5450
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:ILD74 U3
U 2 1 60CA65A1
P 6550 6000
F 0 "U3" H 6550 6325 50  0000 C CNN
F 1 "ILD615" H 6550 6234 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6350 5800 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 6550 6000 50  0001 L CNN
	2    6550 6000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 60CA929B
P 7150 5350
F 0 "R8" V 6943 5350 50  0000 C CNN
F 1 "470" V 7034 5350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7080 5350 50  0001 C CNN
F 3 "~" H 7150 5350 50  0001 C CNN
	1    7150 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 60CA92A2
P 7150 5900
F 0 "R9" V 6943 5900 50  0000 C CNN
F 1 "470" V 7034 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7080 5900 50  0001 C CNN
F 3 "~" H 7150 5900 50  0001 C CNN
	1    7150 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 5350 7000 5350
Wire Wire Line
	6850 5900 7000 5900
Wire Wire Line
	7300 5900 7600 5900
Wire Wire Line
	7300 5350 7450 5350
Wire Wire Line
	7450 5350 7450 5800
Wire Wire Line
	7450 5800 7600 5800
Wire Wire Line
	5600 5550 6250 5550
Wire Wire Line
	5600 5100 5600 5550
Wire Wire Line
	5500 6100 6250 6100
Wire Wire Line
	5500 5200 5500 6100
Wire Wire Line
	6000 5200 6000 5350
Wire Wire Line
	6000 5350 6250 5350
Wire Wire Line
	6000 5350 6000 5900
Wire Wire Line
	6000 5900 6250 5900
Connection ~ 6000 5350
$Comp
L power:+3V3 #PWR0114
U 1 1 60CC7F24
P 6000 5200
F 0 "#PWR0114" H 6000 5050 50  0001 C CNN
F 1 "+3V3" H 6015 5373 50  0000 C CNN
F 2 "" H 6000 5200 50  0001 C CNN
F 3 "" H 6000 5200 50  0001 C CNN
	1    6000 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 5550 6950 5550
Wire Wire Line
	6950 5550 6950 6100
Wire Wire Line
	6950 6100 6850 6100
Wire Wire Line
	6950 6100 6950 6250
Connection ~ 6950 6100
$Comp
L power:GND #PWR0115
U 1 1 60CD1835
P 6950 6250
F 0 "#PWR0115" H 6950 6000 50  0001 C CNN
F 1 "GND" H 6955 6077 50  0000 C CNN
F 2 "" H 6950 6250 50  0001 C CNN
F 3 "" H 6950 6250 50  0001 C CNN
	1    6950 6250
	1    0    0    -1  
$EndComp
$Sheet
S 650  900  2550 2350
U 60CE5BD0
F0 "Sheet60CE5BCF" 50
F1 "Panel.sch" 50
$EndSheet
Wire Wire Line
	5050 4900 7150 4900
Wire Wire Line
	7150 4900 7150 4300
Wire Wire Line
	7150 4300 7250 4300
Wire Wire Line
	5050 5000 7050 5000
Wire Wire Line
	7050 5000 7050 3900
Wire Wire Line
	7050 3900 7250 3900
Text Label 5200 4900 0    50   ~ 0
PA3
Text Label 5200 5000 0    50   ~ 0
PA2
$EndSCHEMATC
