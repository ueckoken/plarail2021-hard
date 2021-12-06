EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Battery_Management:MCP73832-5-OT U1
U 1 1 61944817
P 2700 1450
F 0 "U1" H 2700 1931 50  0000 C CNN
F 1 "MCP73832-5-OT" H 2700 1840 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2750 1200 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 2550 1400 50  0001 C CNN
	1    2700 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61945DE8
P 2700 2150
F 0 "#PWR03" H 2700 1900 50  0001 C CNN
F 1 "GND" H 2705 1977 50  0000 C CNN
F 2 "" H 2700 2150 50  0001 C CNN
F 3 "" H 2700 2150 50  0001 C CNN
	1    2700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1750 2700 2100
$Comp
L Device:R R2
U 1 1 6194658C
P 2300 1900
F 0 "R2" H 2370 1946 50  0000 L CNN
F 1 "2k" H 2370 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 2230 1900 50  0001 C CNN
F 3 "~" H 2300 1900 50  0001 C CNN
	1    2300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1550 2300 1750
Wire Wire Line
	2300 2050 2300 2100
Wire Wire Line
	2300 2100 2700 2100
Connection ~ 2700 2100
Wire Wire Line
	2700 2100 2700 2150
$Comp
L Connector:USB_B_Micro J1
U 1 1 61947352
P 1150 1150
F 0 "J1" H 1207 1617 50  0000 C CNN
F 1 "USB_B_Micro" H 1207 1526 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex_47346-0001" H 1300 1100 50  0001 C CNN
F 3 "~" H 1300 1100 50  0001 C CNN
	1    1150 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 61948C2B
P 1150 1600
F 0 "#PWR01" H 1150 1350 50  0001 C CNN
F 1 "GND" H 1155 1427 50  0000 C CNN
F 2 "" H 1150 1600 50  0001 C CNN
F 3 "" H 1150 1600 50  0001 C CNN
	1    1150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1550 1150 1600
NoConn ~ 1450 1350
NoConn ~ 1450 1250
NoConn ~ 1450 1150
NoConn ~ 1050 1550
$Comp
L Device:R R1
U 1 1 6194939A
P 2000 1200
F 0 "R1" H 2070 1246 50  0000 L CNN
F 1 "470" H 2070 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 1930 1200 50  0001 C CNN
F 3 "~" H 2000 1200 50  0001 C CNN
	1    2000 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 61949737
P 2000 1600
F 0 "D1" V 2039 1482 50  0000 R CNN
F 1 "LED" V 1948 1482 50  0000 R CNN
F 2 "LED_THT:LED_D2.0mm_W4.8mm_H2.5mm_FlatTop" H 2000 1600 50  0001 C CNN
F 3 "~" H 2000 1600 50  0001 C CNN
	1    2000 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 950  2000 1050
Wire Wire Line
	2000 1350 2000 1450
Wire Wire Line
	3100 1750 3100 1550
Wire Wire Line
	2000 1750 3100 1750
$Comp
L Device:C C1
U 1 1 6194A638
P 1750 850
F 0 "C1" H 1865 896 50  0000 L CNN
F 1 "4.7u" H 1865 805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 1788 700 50  0001 C CNN
F 3 "~" H 1750 850 50  0001 C CNN
	1    1750 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6194AD3C
P 3500 1600
F 0 "C2" H 3615 1646 50  0000 L CNN
F 1 "4.7u" H 3615 1555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 3538 1450 50  0001 C CNN
F 3 "~" H 3500 1600 50  0001 C CNN
	1    3500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6194BF58
P 1750 1000
F 0 "#PWR02" H 1750 750 50  0001 C CNN
F 1 "GND" H 1755 827 50  0000 C CNN
F 2 "" H 1750 1000 50  0001 C CNN
F 3 "" H 1750 1000 50  0001 C CNN
	1    1750 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 650  1750 700 
Connection ~ 1750 650 
Wire Wire Line
	3100 1350 3500 1350
Wire Wire Line
	3500 1350 3500 1450
$Comp
L power:GND #PWR05
U 1 1 6194C7D5
P 3500 1750
F 0 "#PWR05" H 3500 1500 50  0001 C CNN
F 1 "GND" H 3505 1577 50  0000 C CNN
F 2 "" H 3500 1750 50  0001 C CNN
F 3 "" H 3500 1750 50  0001 C CNN
	1    3500 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 6194D7AC
P 4350 1350
F 0 "J3" H 4378 1326 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4378 1235 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 4350 1350 50  0001 C CNN
F 3 "~" H 4350 1350 50  0001 C CNN
	1    4350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6194E82B
P 4150 1450
F 0 "#PWR06" H 4150 1200 50  0001 C CNN
F 1 "GND" H 4155 1277 50  0000 C CNN
F 2 "" H 4150 1450 50  0001 C CNN
F 3 "" H 4150 1450 50  0001 C CNN
	1    4150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 6195045D
P 2750 600
F 0 "#PWR04" H 2750 350 50  0001 C CNN
F 1 "GND" H 2755 427 50  0000 C CNN
F 2 "" H 2750 600 50  0001 C CNN
F 3 "" H 2750 600 50  0001 C CNN
	1    2750 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 600  3200 600 
Wire Wire Line
	3200 600  3200 700 
Wire Wire Line
	2700 950  2700 1150
$Comp
L Connector:Jack-DC J2
U 1 1 6194F0D4
P 3500 800
F 0 "J2" H 3270 758 50  0000 R CNN
F 1 "Jack-DC" H 3270 849 50  0000 R CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 3550 760 50  0001 C CNN
F 3 "~" H 3550 760 50  0001 C CNN
	1    3500 800 
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 950  2100 950 
Wire Wire Line
	2700 900  2700 950 
Connection ~ 2700 950 
Wire Wire Line
	2700 900  3200 900 
Wire Wire Line
	1550 650  1750 650 
Wire Wire Line
	1750 650  2100 650 
Text GLabel 800  650  0    50   Input ~ 0
VCC
Wire Wire Line
	800  650  1450 650 
Wire Wire Line
	1450 650  1450 950 
Text GLabel 1550 550  0    50   Input ~ 0
VCC
Wire Wire Line
	1550 550  1550 650 
Wire Wire Line
	2100 650  2100 950 
Connection ~ 2100 950 
Wire Wire Line
	2100 950  2700 950 
Text GLabel 3600 1350 2    50   Input ~ 0
VOUT
Wire Wire Line
	3500 1350 3600 1350
Connection ~ 3500 1350
Text GLabel 4150 1150 2    50   Input ~ 0
VOUT
Wire Wire Line
	4150 1150 4150 1350
$EndSCHEMATC
