EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:smart_psu-cache
EELAYER 25 0
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
L MAX1555 U1
U 1 1 569BA542
P 4150 2000
F 0 "U1" H 4150 1600 60  0000 C CNN
F 1 "MAX1555" H 4150 2300 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 4150 2300 60  0001 C CNN
F 3 "" H 4150 2300 60  0000 C CNN
	1    4150 2000
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 569BA54F
P 3500 2400
F 0 "R5" V 3580 2400 50  0000 C CNN
F 1 "100K" V 3500 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3430 2400 50  0001 C CNN
F 3 "" H 3500 2400 50  0000 C CNN
	1    3500 2400
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 569BA550
P 3100 2000
F 0 "C1" H 3125 2100 50  0000 L CNN
F 1 "1uF" H 3125 1900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3138 1850 50  0001 C CNN
F 3 "" H 3100 2000 50  0000 C CNN
	1    3100 2000
	-1   0    0    1   
$EndComp
$Comp
L C C3
U 1 1 569BA551
P 5300 2100
F 0 "C3" H 5325 2200 50  0000 L CNN
F 1 "1uF" H 5325 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5338 1950 50  0001 C CNN
F 3 "" H 5300 2100 50  0000 C CNN
	1    5300 2100
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 569BA552
P 4800 2500
F 0 "C2" H 4825 2600 50  0000 L CNN
F 1 "1uF" H 4825 2400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4838 2350 50  0001 C CNN
F 3 "" H 4800 2500 50  0000 C CNN
	1    4800 2500
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 569BAA48
P 8300 4550
F 0 "C5" H 8325 4650 50  0000 L CNN
F 1 "10uF" H 8325 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 8338 4400 50  0001 C CNN
F 3 "" H 8300 4550 50  0000 C CNN
	1    8300 4550
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 569BAA4A
P 10500 4550
F 0 "C6" H 10525 4650 50  0000 L CNN
F 1 "1uF" H 10525 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10538 4400 50  0001 C CNN
F 3 "" H 10500 4550 50  0000 C CNN
	1    10500 4550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR01
U 1 1 569BAA4C
P 7650 4250
F 0 "#PWR01" H 7650 4100 50  0001 C CNN
F 1 "+5V" H 7650 4390 50  0000 C CNN
F 2 "" H 7650 4250 50  0000 C CNN
F 3 "" H 7650 4250 50  0000 C CNN
	1    7650 4250
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 569BAA4E
P 7800 4550
F 0 "C4" H 7825 4650 50  0000 L CNN
F 1 "10uF" H 7825 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7838 4400 50  0001 C CNN
F 3 "" H 7800 4550 50  0000 C CNN
	1    7800 4550
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 569BAA51
P 10650 4250
F 0 "R6" V 10730 4250 50  0000 C CNN
F 1 "100K" V 10650 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10580 4250 50  0001 C CNN
F 3 "" H 10650 4250 50  0000 C CNN
	1    10650 4250
	0    -1   -1   0   
$EndComp
$Comp
L ATTINY85-P IC1
U 1 1 569BAC68
P 4200 4850
F 0 "IC1" H 3050 5250 50  0000 C CNN
F 1 "ATTINY85-P" H 5200 4450 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 5200 4850 50  0000 C CIN
F 3 "" H 4200 4850 50  0000 C CNN
	1    4200 4850
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 569BAC6B
P 1700 4600
F 0 "D1" H 1700 4700 50  0000 C CNN
F 1 "GREEN_LED" H 1700 4500 50  0000 C CNN
F 2 "LEDs:LED_1206" H 1700 4600 50  0001 C CNN
F 3 "" H 1700 4600 50  0000 C CNN
	1    1700 4600
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 569BAC6C
P 1700 4900
F 0 "D2" H 1700 5000 50  0000 C CNN
F 1 "RED_LED" H 1700 4800 50  0000 C CNN
F 2 "LEDs:LED_1206" H 1700 4900 50  0001 C CNN
F 3 "" H 1700 4900 50  0000 C CNN
	1    1700 4900
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 569BAC6D
P 1150 4600
F 0 "R1" V 1230 4600 50  0000 C CNN
F 1 "3.3K" V 1150 4600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1080 4600 50  0001 C CNN
F 3 "" H 1150 4600 50  0000 C CNN
	1    1150 4600
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 569BAC6E
P 1150 4900
F 0 "R2" V 1230 4900 50  0000 C CNN
F 1 "3.3K" V 1150 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1080 4900 50  0001 C CNN
F 3 "" H 1150 4900 50  0000 C CNN
	1    1150 4900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 569BAC6F
P 700 4600
F 0 "#PWR02" H 700 4350 50  0001 C CNN
F 1 "GND" H 700 4450 50  0000 C CNN
F 2 "" H 700 4600 50  0000 C CNN
F 3 "" H 700 4600 50  0000 C CNN
	1    700  4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 569BAC70
P 700 4900
F 0 "#PWR03" H 700 4650 50  0001 C CNN
F 1 "GND" H 700 4750 50  0000 C CNN
F 2 "" H 700 4900 50  0000 C CNN
F 3 "" H 700 4900 50  0000 C CNN
	1    700  4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 569BAC72
P 700 5250
F 0 "#PWR04" H 700 5000 50  0001 C CNN
F 1 "GND" H 700 5100 50  0000 C CNN
F 2 "" H 700 5250 50  0000 C CNN
F 3 "" H 700 5250 50  0000 C CNN
	1    700  5250
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q1
U 1 1 569BAC73
P 3350 6000
F 0 "Q1" H 3650 6050 50  0000 R CNN
F 1 "Q_NMOS_DGS" H 4000 5950 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3550 6100 50  0001 C CNN
F 3 "" H 3350 6000 50  0000 C CNN
	1    3350 6000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 569BAC74
P 3450 6450
F 0 "#PWR05" H 3450 6200 50  0001 C CNN
F 1 "GND" H 3450 6300 50  0000 C CNN
F 2 "" H 3450 6450 50  0000 C CNN
F 3 "" H 3450 6450 50  0000 C CNN
	1    3450 6450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 569BAC75
P 2750 6000
F 0 "R3" V 2830 6000 50  0000 C CNN
F 1 "1K" V 2750 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2680 6000 50  0001 C CNN
F 3 "" H 2750 6000 50  0000 C CNN
	1    2750 6000
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 569BAC76
P 3050 6300
F 0 "R4" V 3130 6300 50  0000 C CNN
F 1 "1K" V 3050 6300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2980 6300 50  0001 C CNN
F 3 "" H 3050 6300 50  0000 C CNN
	1    3050 6300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 569BC66C
P 7100 5300
F 0 "#PWR06" H 7100 5050 50  0001 C CNN
F 1 "GND" H 7100 5150 50  0000 C CNN
F 2 "" H 7100 5300 50  0000 C CNN
F 3 "" H 7100 5300 50  0000 C CNN
	1    7100 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 569BCD12
P 5650 5300
F 0 "#PWR07" H 5650 5050 50  0001 C CNN
F 1 "GND" H 5650 5150 50  0000 C CNN
F 2 "" H 5650 5300 50  0000 C CNN
F 3 "" H 5650 5300 50  0000 C CNN
	1    5650 5300
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR08
U 1 1 569BD0FD
P 3650 5550
F 0 "#PWR08" H 3650 5300 50  0001 C CNN
F 1 "GNDA" H 3650 5400 50  0000 C CNN
F 2 "" H 3650 5550 50  0000 C CNN
F 3 "" H 3650 5550 50  0000 C CNN
	1    3650 5550
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 569BB69E
P 5650 4100
F 0 "#PWR09" H 5650 3950 50  0001 C CNN
F 1 "VCC" H 5650 4250 50  0000 C CNN
F 2 "" H 5650 4100 50  0000 C CNN
F 3 "" H 5650 4100 50  0000 C CNN
	1    5650 4100
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 569BB868
P 7300 5200
F 0 "#FLG010" H 7300 5295 50  0001 C CNN
F 1 "PWR_FLAG" H 7300 5380 50  0000 C CNN
F 2 "" H 7300 5200 50  0000 C CNN
F 3 "" H 7300 5200 50  0000 C CNN
	1    7300 5200
	0    1    1    0   
$EndComp
$Comp
L GNDA #PWR011
U 1 1 569BBE22
P 8300 4850
F 0 "#PWR011" H 8300 4600 50  0001 C CNN
F 1 "GNDA" H 8300 4700 50  0000 C CNN
F 2 "" H 8300 4850 50  0000 C CNN
F 3 "" H 8300 4850 50  0000 C CNN
	1    8300 4850
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR012
U 1 1 569BBE94
P 8900 4850
F 0 "#PWR012" H 8900 4600 50  0001 C CNN
F 1 "GNDA" H 8900 4700 50  0000 C CNN
F 2 "" H 8900 4850 50  0000 C CNN
F 3 "" H 8900 4850 50  0000 C CNN
	1    8900 4850
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR013
U 1 1 569BC765
P 7800 4850
F 0 "#PWR013" H 7800 4600 50  0001 C CNN
F 1 "GNDA" H 7800 4700 50  0000 C CNN
F 2 "" H 7800 4850 50  0000 C CNN
F 3 "" H 7800 4850 50  0000 C CNN
	1    7800 4850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR014
U 1 1 569BCAB6
P 8100 5050
F 0 "#PWR014" H 8100 4900 50  0001 C CNN
F 1 "VCC" H 8100 5200 50  0000 C CNN
F 2 "" H 8100 5050 50  0000 C CNN
F 3 "" H 8100 5050 50  0000 C CNN
	1    8100 5050
	-1   0    0    1   
$EndComp
$Comp
L SWITCH_INV SW3
U 1 1 569BCBC5
P 10350 3550
F 0 "SW3" H 10150 3700 50  0000 C CNN
F 1 "SWITCH_INV" H 10200 3400 50  0000 C CNN
F 2 "" H 10350 3550 50  0001 C CNN
F 3 "" H 10350 3550 50  0000 C CNN
	1    10350 3550
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR015
U 1 1 569BCC6E
P 10950 3650
F 0 "#PWR015" H 10950 3400 50  0001 C CNN
F 1 "GNDA" H 10950 3500 50  0000 C CNN
F 2 "" H 10950 3650 50  0000 C CNN
F 3 "" H 10950 3650 50  0000 C CNN
	1    10950 3650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 569BE366
P 4650 3100
F 0 "P2" H 4650 3250 50  0000 C CNN
F 1 "CONN_01X02" V 4750 3100 50  0000 C CNN
F 2 "Connect:PINHEAD1-2" H 4650 3100 50  0001 C CNN
F 3 "" H 4650 3100 50  0000 C CNN
	1    4650 3100
	-1   0    0    1   
$EndComp
$Comp
L USB_OTG P1
U 1 1 569BE3F7
P 2600 1650
F 0 "P1" H 2925 1525 50  0000 C CNN
F 1 "USB_OTG" H 2600 1850 50  0000 C CNN
F 2 "Connect:USB_Micro-B" V 2550 1550 50  0001 C CNN
F 3 "" V 2550 1550 50  0000 C CNN
	1    2600 1650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR016
U 1 1 569BF782
P 5300 2350
F 0 "#PWR016" H 5300 2100 50  0001 C CNN
F 1 "GND" H 5300 2200 50  0000 C CNN
F 2 "" H 5300 2350 50  0000 C CNN
F 3 "" H 5300 2350 50  0000 C CNN
	1    5300 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 569BFC19
P 3300 2200
F 0 "#PWR017" H 3300 1950 50  0001 C CNN
F 1 "GND" H 3300 2050 50  0000 C CNN
F 2 "" H 3300 2200 50  0000 C CNN
F 3 "" H 3300 2200 50  0000 C CNN
	1    3300 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 569BFD7D
P 4800 2750
F 0 "#PWR018" H 4800 2500 50  0001 C CNN
F 1 "GND" H 4800 2600 50  0000 C CNN
F 2 "" H 4800 2750 50  0000 C CNN
F 3 "" H 4800 2750 50  0000 C CNN
	1    4800 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 569BFF44
P 4850 3250
F 0 "#PWR019" H 4850 3000 50  0001 C CNN
F 1 "GND" H 4850 3100 50  0000 C CNN
F 2 "" H 4850 3250 50  0000 C CNN
F 3 "" H 4850 3250 50  0000 C CNN
	1    4850 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 569C04BD
P 3100 2200
F 0 "#PWR020" H 3100 1950 50  0001 C CNN
F 1 "GND" H 3100 2050 50  0000 C CNN
F 2 "" H 3100 2200 50  0000 C CNN
F 3 "" H 3100 2200 50  0000 C CNN
	1    3100 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 569C05AE
P 3100 1450
F 0 "#PWR021" H 3100 1200 50  0001 C CNN
F 1 "GND" H 3100 1300 50  0000 C CNN
F 2 "" H 3100 1450 50  0000 C CNN
F 3 "" H 3100 1450 50  0000 C CNN
	1    3100 1450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 569C1690
P 5500 6250
F 0 "P3" H 5500 6400 50  0000 C CNN
F 1 "CONN_01X02" V 5600 6250 50  0000 C CNN
F 2 "Connect:PINHEAD1-2" H 5500 6250 50  0001 C CNN
F 3 "" H 5500 6250 50  0000 C CNN
	1    5500 6250
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR022
U 1 1 569C1782
P 5100 6300
F 0 "#PWR022" H 5100 6050 50  0001 C CNN
F 1 "GNDA" H 5100 6150 50  0000 C CNN
F 2 "" H 5100 6300 50  0000 C CNN
F 3 "" H 5100 6300 50  0000 C CNN
	1    5100 6300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR023
U 1 1 569C17E4
P 5100 6200
F 0 "#PWR023" H 5100 6050 50  0001 C CNN
F 1 "VCC" H 5100 6350 50  0000 C CNN
F 2 "" H 5100 6200 50  0000 C CNN
F 3 "" H 5100 6200 50  0000 C CNN
	1    5100 6200
	1    0    0    -1  
$EndComp
NoConn ~ 2500 1250
NoConn ~ 2900 1550
NoConn ~ 2900 1650
NoConn ~ 2900 1750
$Comp
L PWR_FLAG #FLG024
U 1 1 569C3617
P 3550 5500
F 0 "#FLG024" H 3550 5595 50  0001 C CNN
F 1 "PWR_FLAG" H 3550 5680 50  0000 C CNN
F 2 "" H 3550 5500 50  0000 C CNN
F 3 "" H 3550 5500 50  0000 C CNN
	1    3550 5500
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG025
U 1 1 569CEABB
P 7000 4500
F 0 "#FLG025" H 7000 4595 50  0001 C CNN
F 1 "PWR_FLAG" H 7000 4680 50  0000 C CNN
F 2 "" H 7000 4500 50  0000 C CNN
F 3 "" H 7000 4500 50  0000 C CNN
	1    7000 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1850 3650 1850
Wire Wire Line
	3400 2250 3650 2250
Wire Wire Line
	4650 1850 5800 1850
Wire Wire Line
	10150 4400 10500 4400
Wire Wire Line
	10150 4550 10300 4550
Wire Wire Line
	10300 4550 10300 4700
Wire Wire Line
	10300 4700 10500 4700
Wire Wire Line
	7650 4250 9050 4250
Wire Wire Line
	7800 4400 7800 4250
Connection ~ 7800 4250
Wire Wire Line
	1300 4600 1500 4600
Wire Wire Line
	700  4900 1000 4900
Wire Wire Line
	1300 4900 1500 4900
Wire Wire Line
	1900 4600 2100 4600
Wire Wire Line
	2100 4600 2100 4900
Wire Wire Line
	2100 4900 2850 4900
Wire Wire Line
	1900 4900 2000 4900
Wire Wire Line
	2000 4900 2000 5000
Wire Wire Line
	2000 5000 2850 5000
Wire Wire Line
	700  5250 1000 5250
Wire Wire Line
	1600 5250 2850 5250
Wire Wire Line
	2850 5250 2850 5100
Wire Wire Line
	3050 6450 3450 6450
Wire Wire Line
	2900 6000 3150 6000
Wire Wire Line
	3050 6150 3050 6000
Connection ~ 3050 6000
Wire Wire Line
	3450 6450 3450 6200
Wire Wire Line
	700  4600 1000 4600
Wire Wire Line
	2850 4600 2450 4600
Wire Wire Line
	2450 4600 2450 6000
Wire Wire Line
	2450 6000 2600 6000
Wire Wire Line
	5650 5300 5650 5100
Wire Wire Line
	5650 5100 5550 5100
Wire Wire Line
	3450 5800 3450 5550
Wire Wire Line
	3450 5550 3650 5550
Wire Wire Line
	5650 4100 5650 4600
Connection ~ 5650 4600
Wire Wire Line
	8900 4550 8900 4850
Wire Wire Line
	8900 4550 9050 4550
Wire Wire Line
	10150 4250 10500 4250
Wire Wire Line
	10800 4250 10950 4250
Wire Wire Line
	10950 4250 10950 5150
Wire Wire Line
	10950 5150 8750 5150
Wire Wire Line
	8750 5150 8750 4400
Wire Wire Line
	10150 4100 10300 4100
Wire Wire Line
	10300 4100 10300 3800
Wire Wire Line
	10300 3800 9700 3800
Wire Wire Line
	9700 3800 9700 3550
Wire Wire Line
	9700 3550 9850 3550
Wire Wire Line
	8100 5050 8100 4400
Wire Wire Line
	11100 3450 10850 3450
Wire Wire Line
	11100 5300 11100 3450
Wire Wire Line
	8550 5300 11100 5300
Wire Wire Line
	8550 4400 8550 5300
Wire Wire Line
	8100 4400 9050 4400
Connection ~ 8300 4400
Connection ~ 8550 4400
Connection ~ 8750 4400
Wire Wire Line
	4850 3050 5100 3050
Wire Wire Line
	5100 3050 5100 2250
Wire Wire Line
	5100 2250 4650 2250
Wire Wire Line
	4800 2350 4800 2250
Connection ~ 4800 2250
Wire Wire Line
	5300 1950 5300 1850
Connection ~ 5300 1850
Wire Wire Line
	5300 2250 5300 2350
Wire Wire Line
	3300 2200 3300 2050
Wire Wire Line
	3300 2050 3650 2050
Wire Wire Line
	4800 2650 4800 2750
Wire Wire Line
	4850 3250 4850 3150
Wire Wire Line
	3100 2200 3100 2150
Connection ~ 3100 1850
Wire Wire Line
	2900 1450 3100 1450
Wire Wire Line
	5100 6200 5300 6200
Wire Wire Line
	5100 6300 5300 6300
Wire Wire Line
	10950 3650 10850 3650
Wire Wire Line
	8300 4700 8300 4850
Wire Wire Line
	7800 4850 7800 4700
Wire Wire Line
	3550 5500 3550 5550
Connection ~ 3550 5550
Wire Wire Line
	3500 2550 3500 3600
Wire Wire Line
	3500 3600 5800 3600
Connection ~ 5800 3600
Wire Wire Line
	3400 2250 3400 4400
Wire Wire Line
	3400 4400 2750 4400
Wire Wire Line
	2750 4400 2750 4800
Wire Wire Line
	2750 4800 2850 4800
Connection ~ 3500 2250
$Comp
L TEST_1P W1
U 1 1 569DF752
P 2300 4400
F 0 "W1" H 2300 4670 50  0000 C CNN
F 1 "TEST_1P" H 2300 4600 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Small" H 2500 4400 50  0001 C CNN
F 3 "" H 2500 4400 50  0000 C CNN
	1    2300 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4400 2300 4700
Wire Wire Line
	2300 4700 2850 4700
$Comp
L MCP1253 U2
U 1 1 569BAA44
P 9600 4350
F 0 "U2" H 9600 4000 60  0000 C CNN
F 1 "MCP1253" H 9600 4750 60  0000 C CNN
F 2 "Housings_SSOP:MSOP-8_3x3mm_Pitch0.65mm" H 9600 4750 60  0001 C CNN
F 3 "" H 9600 4750 60  0000 C CNN
	1    9600 4350
	1    0    0    -1  
$EndComp
NoConn ~ 9050 4100
$Comp
L CONN_01X02 P5
U 1 1 569E11A8
P 7300 4750
F 0 "P5" H 7300 4900 50  0000 C CNN
F 1 "CONN_01X02" V 7400 4750 50  0000 C CNN
F 2 "Connect:PINHEAD1-2" H 7300 4750 50  0001 C CNN
F 3 "" H 7300 4750 50  0000 C CNN
	1    7300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4800 7100 5300
Wire Wire Line
	6900 4700 7100 4700
Wire Wire Line
	7000 4500 7000 4700
Connection ~ 7000 4700
Wire Wire Line
	7300 5200 7100 5200
Connection ~ 7100 5200
$Comp
L SWITCH_INV SW2
U 1 1 569E1A5A
P 6400 4600
F 0 "SW2" H 6200 4750 50  0000 C CNN
F 1 "SWITCH_INV" H 6250 4450 50  0000 C CNN
F 2 "" H 6400 4600 50  0001 C CNN
F 3 "" H 6400 4600 50  0000 C CNN
	1    6400 4600
	1    0    0    -1  
$EndComp
NoConn ~ 6900 4500
$Comp
L SW_PUSH SW1
U 1 1 569E23B0
P 1300 5250
F 0 "SW1" H 1450 5360 50  0000 C CNN
F 1 "SW_PUSH" H 1300 5170 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_PUSH-12mm" H 1300 5250 50  0001 C CNN
F 3 "" H 1300 5250 50  0000 C CNN
	1    1300 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4600 5900 4600
Wire Wire Line
	5800 1850 5800 4600
Connection ~ 5800 4600
$EndSCHEMATC
