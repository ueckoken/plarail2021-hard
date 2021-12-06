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
L Isolator:TLP785 U3
U 1 1 61876EAC
P 3400 3050
F 0 "U3" H 3400 3375 50  0000 C CNN
F 1 "TLP785" H 3400 3284 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 3200 2850 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=10569&prodName=TLP785" H 3400 3050 50  0001 L CNN
	1    3400 3050
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6187EC3E
P 3550 5950
F 0 "#PWR0101" H 3550 5700 50  0001 C CNN
F 1 "GND" H 3555 5777 50  0000 C CNN
F 2 "" H 3550 5950 50  0001 C CNN
F 3 "" H 3550 5950 50  0001 C CNN
	1    3550 5950
	1    0    0    -1  
$EndComp
Text GLabel 3800 2950 2    50   BiDi ~ 0
DRIVER_RIN
Wire Wire Line
	3700 2950 3800 2950
$Comp
L bd6231f:BD6231F-E2 U2
U 1 1 61877E3D
P 2550 1800
F 0 "U2" H 3350 2187 60  0000 C CNN
F 1 "BD6211F-E2" H 3350 2081 60  0000 C CNN
F 2 "bd6231f:BD6231F-E2" H 3350 2040 60  0001 C CNN
F 3 "" H 2550 1800 60  0000 C CNN
	1    2550 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 6187B2B9
P 3850 3400
F 0 "R4" H 3920 3446 50  0000 L CNN
F 1 "120" H 3920 3355 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 3780 3400 50  0001 C CNN
F 3 "~" H 3850 3400 50  0001 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3150 3850 3150
Wire Wire Line
	3850 3150 3850 3250
$Comp
L Isolator:TLP785 U4
U 1 1 6187D7CB
P 3600 4850
F 0 "U4" H 3600 5175 50  0000 C CNN
F 1 "TLP785" H 3600 5084 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 3400 4650 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=10569&prodName=TLP785" H 3600 4850 50  0001 L CNN
	1    3600 4850
	-1   0    0    -1  
$EndComp
Text GLabel 4100 4750 2    50   BiDi ~ 0
DRIVER_FIN
Wire Wire Line
	3900 4750 4100 4750
$Comp
L Device:R R5
U 1 1 6187F733
P 4000 5200
F 0 "R5" H 4070 5246 50  0000 L CNN
F 1 "120" H 4070 5155 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 3930 5200 50  0001 C CNN
F 3 "~" H 4000 5200 50  0001 C CNN
	1    4000 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4950 4000 4950
Wire Wire Line
	4000 4950 4000 5050
Text Notes 3850 4450 2    50   ~ 0
PWM Control
$Comp
L Regulator_Linear:LM78L05_SO8 U1
U 1 1 618814B3
P 1250 2850
F 0 "U1" H 1250 3092 50  0000 C CNN
F 1 "M78AR05" H 1250 3001 50  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_RECOM_R-78E-0.5_THT" H 1350 3050 50  0001 C CIN
F 3 "https://www.onsemi.com/pub/Collateral/MC78L06A-D.pdf" H 1450 2850 50  0001 C CNN
	1    1250 2850
	1    0    0    -1  
$EndComp
Text Notes 3450 1250 2    50   ~ 0
BD6211F
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 6188BACB
P 5100 1450
F 0 "J3" H 5128 1426 50  0000 L CNN
F 1 "CON_TO_MOTOR" H 5128 1335 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B2B-XH-AM_1x02_P2.50mm_Vertical" H 5100 1450 50  0001 C CNN
F 3 "~" H 5100 1450 50  0001 C CNN
	1    5100 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 6188C600
P 650 1500
F 0 "J2" H 542 1685 50  0000 C CNN
F 1 "BATTERY1" H 542 1594 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-AM_1x02_P2.50mm_Vertical" H 650 1500 50  0001 C CNN
F 3 "~" H 650 1500 50  0001 C CNN
	1    650  1500
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 6188EC23
P 650 1150
F 0 "J1" H 542 1335 50  0000 C CNN
F 1 "BATTERY2" H 542 1244 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-AM_1x02_P2.50mm_Vertical" H 650 1150 50  0001 C CNN
F 3 "~" H 650 1150 50  0001 C CNN
	1    650  1150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 1150 1050 1150
Wire Wire Line
	850  1250 1100 1250
Wire Wire Line
	950  2500 950  2850
Wire Wire Line
	850  1500 1100 1500
$Comp
L power:GND #PWR0102
U 1 1 618930C0
P 1250 4150
F 0 "#PWR0102" H 1250 3900 50  0001 C CNN
F 1 "GND" H 1255 3977 50  0000 C CNN
F 2 "" H 1250 4150 50  0001 C CNN
F 3 "" H 1250 4150 50  0001 C CNN
	1    1250 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2850 1600 2850
Wire Wire Line
	2400 2850 2400 2000
Wire Wire Line
	2400 1900 2550 1900
Wire Wire Line
	2550 2000 2400 2000
Connection ~ 2400 2000
Wire Wire Line
	2400 2000 2400 1900
Wire Wire Line
	2400 1900 2400 1000
Wire Wire Line
	2400 1000 4550 1000
Wire Wire Line
	4550 1000 4550 1300
Wire Wire Line
	4550 2000 4150 2000
Connection ~ 2400 1900
$Comp
L power:GND #PWR0103
U 1 1 6189551D
P 4900 1950
F 0 "#PWR0103" H 4900 1700 50  0001 C CNN
F 1 "GND" H 4905 1777 50  0000 C CNN
F 2 "" H 4900 1950 50  0001 C CNN
F 3 "" H 4900 1950 50  0001 C CNN
	1    4900 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1800 4900 1800
Wire Wire Line
	2550 4950 3300 4950
$Comp
L Device:R R3
U 1 1 61897BB4
P 3300 5300
F 0 "R3" H 3370 5346 50  0000 L CNN
F 1 "10k" H 3370 5255 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 3230 5300 50  0001 C CNN
F 3 "~" H 3300 5300 50  0001 C CNN
	1    3300 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4950 3300 5150
Wire Wire Line
	3300 5450 3300 5950
Wire Wire Line
	3300 5950 3550 5950
$Comp
L Device:R R6
U 1 1 6189933B
P 4550 1450
F 0 "R6" H 4620 1496 50  0000 L CNN
F 1 "10k" H 4620 1405 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 4480 1450 50  0001 C CNN
F 3 "~" H 4550 1450 50  0001 C CNN
	1    4550 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1600 4550 2000
Wire Wire Line
	4900 1800 4900 1950
Wire Wire Line
	4150 1900 4750 1900
Wire Wire Line
	4750 1900 4750 1550
Wire Wire Line
	4750 1550 4900 1550
Wire Wire Line
	4900 1450 4900 850 
Wire Wire Line
	4900 850  2550 850 
Wire Wire Line
	2550 850  2550 1800
Text GLabel 6300 2500 0    50   BiDi ~ 0
DRIVER_RIN
Text GLabel 6300 2600 0    50   BiDi ~ 0
DRIVER_FIN
Wire Wire Line
	4000 5350 4000 5950
Wire Wire Line
	4000 5950 3550 5950
Connection ~ 3550 5950
Wire Wire Line
	4150 2100 4150 2700
$Comp
L Connector:Conn_01x06_Female J4
U 1 1 618ACA44
P 6500 2600
F 0 "J4" H 6528 2576 50  0000 L CNN
F 1 "Raspberry_Pi_GPIOs" H 6528 2485 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 6500 2600 50  0001 C CNN
F 3 "~" H 6500 2600 50  0001 C CNN
	1    6500 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2900 5550 2900
$Comp
L Device:R R1
U 1 1 618B1C0F
P 1750 1150
F 0 "R1" H 1820 1196 50  0000 L CNN
F 1 "3.3k" H 1820 1105 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 1680 1150 50  0001 C CNN
F 3 "~" H 1750 1150 50  0001 C CNN
	1    1750 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 618B3574
P 1750 1550
F 0 "R2" H 1820 1596 50  0000 L CNN
F 1 "6.8k" H 1820 1505 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 1680 1550 50  0001 C CNN
F 3 "~" H 1750 1550 50  0001 C CNN
	1    1750 1550
	1    0    0    -1  
$EndComp
Text GLabel 1850 1350 2    50   BiDi ~ 0
VOLT_REF
Wire Wire Line
	1750 1300 1750 1350
Wire Wire Line
	1750 1350 1850 1350
Connection ~ 1750 1350
Wire Wire Line
	1750 1350 1750 1400
Wire Wire Line
	1300 1000 1300 1150
Wire Wire Line
	1750 1700 1750 2000
$Comp
L power:VCC #PWR0104
U 1 1 618BAA83
P 1050 950
F 0 "#PWR0104" H 1050 800 50  0001 C CNN
F 1 "VCC" H 1065 1123 50  0000 C CNN
F 2 "" H 1050 950 50  0001 C CNN
F 3 "" H 1050 950 50  0001 C CNN
	1    1050 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 950  1050 1150
Connection ~ 1050 1150
Wire Wire Line
	1050 1150 850  1150
Wire Wire Line
	1100 1250 1100 1500
Text Notes 1150 1400 0    50   ~ 0
SERIAL
$Comp
L power:GND #PWR0105
U 1 1 618C5C84
P 850 1800
F 0 "#PWR0105" H 850 1550 50  0001 C CNN
F 1 "GND" H 855 1627 50  0000 C CNN
F 2 "" H 850 1800 50  0001 C CNN
F 3 "" H 850 1800 50  0001 C CNN
	1    850  1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 618C60FE
P 1750 2000
F 0 "#PWR0106" H 1750 1750 50  0001 C CNN
F 1 "GND" H 1755 1827 50  0000 C CNN
F 2 "" H 1750 2000 50  0001 C CNN
F 3 "" H 1750 2000 50  0001 C CNN
	1    1750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3150 1250 3350
Wire Wire Line
	850  1600 850  1800
$Comp
L power:GND #PWR0107
U 1 1 618CB5F5
P 3850 3550
F 0 "#PWR0107" H 3850 3300 50  0001 C CNN
F 1 "GND" H 3855 3377 50  0000 C CNN
F 2 "" H 3850 3550 50  0001 C CNN
F 3 "" H 3850 3550 50  0001 C CNN
	1    3850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 618CBE35
P 5550 2900
F 0 "#PWR0108" H 5550 2650 50  0001 C CNN
F 1 "GND" H 5555 2727 50  0000 C CNN
F 2 "" H 5550 2900 50  0001 C CNN
F 3 "" H 5550 2900 50  0001 C CNN
	1    5550 2900
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 618D1F12
P 1300 900
F 0 "#FLG0101" H 1300 975 50  0001 C CNN
F 1 "PWR_FLAG" H 1300 1073 50  0000 C CNN
F 2 "" H 1300 900 50  0001 C CNN
F 3 "~" H 1300 900 50  0001 C CNN
	1    1300 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 900  1050 900 
Wire Wire Line
	1050 900  1050 950 
Connection ~ 1050 950 
Text GLabel 6300 2700 0    50   BiDi ~ 0
VOLT_REF
$Comp
L Device:R R7
U 1 1 618D4917
P 3100 3300
F 0 "R7" H 3170 3346 50  0000 L CNN
F 1 "10k" H 3170 3255 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" V 3030 3300 50  0001 C CNN
F 3 "~" H 3100 3300 50  0001 C CNN
	1    3100 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 618D4F9A
P 3100 3450
F 0 "#PWR0109" H 3100 3200 50  0001 C CNN
F 1 "GND" H 3105 3277 50  0000 C CNN
F 2 "" H 3100 3450 50  0001 C CNN
F 3 "" H 3100 3450 50  0001 C CNN
	1    3100 3450
	1    0    0    -1  
$EndComp
Connection ~ 3300 4950
Wire Wire Line
	2550 2100 2550 4950
Wire Wire Line
	2850 2700 2850 3150
Wire Wire Line
	2850 3150 3100 3150
Connection ~ 3100 3150
Wire Wire Line
	2850 2700 4150 2700
Text GLabel 1850 2950 3    50   BiDi ~ 0
VCC_5V
Wire Wire Line
	1850 2850 1850 2950
Connection ~ 1850 2850
Wire Wire Line
	1850 2850 2400 2850
Text GLabel 3100 2750 1    50   BiDi ~ 0
VCC_5V
Wire Wire Line
	3100 2750 3100 2950
Text GLabel 3300 4550 1    50   BiDi ~ 0
VCC_5V
Wire Wire Line
	3300 4550 3300 4750
$Comp
L power:VCC #PWR01
U 1 1 618E3E9B
P 950 2500
F 0 "#PWR01" H 950 2350 50  0001 C CNN
F 1 "VCC" H 965 2673 50  0000 C CNN
F 2 "" H 950 2500 50  0001 C CNN
F 3 "" H 950 2500 50  0001 C CNN
	1    950  2500
	1    0    0    -1  
$EndComp
Text GLabel 6250 2400 0    50   BiDi ~ 0
VCC_5V
Wire Wire Line
	6250 2400 6300 2400
NoConn ~ 6300 2800
$Comp
L Device:CP C1
U 1 1 618F609F
P 1450 5950
F 0 "C1" H 1568 5996 50  0000 L CNN
F 1 "0.1uF" H 1568 5905 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P2.54mm_Vertical_AnodeUp" H 1488 5800 50  0001 C CNN
F 3 "~" H 1450 5950 50  0001 C CNN
	1    1450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5700 1450 5800
$Comp
L power:GND #PWR03
U 1 1 618F848B
P 1450 6100
F 0 "#PWR03" H 1450 5850 50  0001 C CNN
F 1 "GND" H 1455 5927 50  0000 C CNN
F 2 "" H 1450 6100 50  0001 C CNN
F 3 "" H 1450 6100 50  0001 C CNN
	1    1450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1000 1750 1000
$Comp
L power:VCC #PWR02
U 1 1 618FBD8F
P 1450 5700
F 0 "#PWR02" H 1450 5550 50  0001 C CNN
F 1 "VCC" H 1465 5873 50  0000 C CNN
F 2 "" H 1450 5700 50  0001 C CNN
F 3 "" H 1450 5700 50  0001 C CNN
	1    1450 5700
	1    0    0    -1  
$EndComp
Text Notes 1500 5750 0    50   ~ 0
bipass
$Comp
L Device:CP C2
U 1 1 61903026
P 950 3200
F 0 "C2" H 1068 3246 50  0000 L CNN
F 1 "0.1uF" H 1068 3155 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P2.54mm_Vertical_AnodeUp" H 988 3050 50  0001 C CNN
F 3 "~" H 950 3200 50  0001 C CNN
	1    950  3200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 61903834
P 1600 3200
F 0 "C3" H 1718 3246 50  0000 L CNN
F 1 "0.1uF" H 1718 3155 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P2.54mm_Vertical_AnodeUp" H 1638 3050 50  0001 C CNN
F 3 "~" H 1600 3200 50  0001 C CNN
	1    1600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2850 1600 3050
Connection ~ 1600 2850
Wire Wire Line
	1600 2850 1850 2850
Wire Wire Line
	1600 3350 1250 3350
Connection ~ 1250 3350
Wire Wire Line
	1250 3350 1250 4150
Wire Wire Line
	950  3350 1250 3350
Wire Wire Line
	950  3050 950  2850
Connection ~ 950  2850
$EndSCHEMATC
