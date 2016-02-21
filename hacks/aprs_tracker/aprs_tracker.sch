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
LIBS:arduino
LIBS:JACK_STEREO
LIBS:aprs_tracker-cache
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
Text Label 1350 1000 0    60   ~ 0
D3
$Comp
L R R2
U 1 1 56C9C66B
P 1950 1200
F 0 "R2" V 2030 1200 50  0000 C CNN
F 1 "1K" V 1950 1200 50  0000 C CNN
F 2 "" V 1880 1200 50  0000 C CNN
F 3 "" H 1950 1200 50  0000 C CNN
	1    1950 1200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 56C9C692
P 2350 1300
F 0 "#PWR01" H 2350 1050 50  0001 C CNN
F 1 "GND" H 2350 1150 50  0000 C CNN
F 2 "" H 2350 1300 50  0000 C CNN
F 3 "" H 2350 1300 50  0000 C CNN
	1    2350 1300
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q1
U 1 1 56C9C6A9
P 2700 1000
F 0 "Q1" H 3000 1050 50  0000 R CNN
F 1 "2N7000" H 3200 950 50  0000 R CNN
F 2 "" H 2900 1100 50  0000 C CNN
F 3 "" H 2700 1000 50  0000 C CNN
	1    2700 1000
	1    0    0    -1  
$EndComp
Text Label 3650 800  0    60   ~ 0
PTT_V+
Text Label 1350 2400 0    60   ~ 0
A0
$Comp
L R R3
U 1 1 56C9C70D
P 1950 2100
F 0 "R3" V 2050 2100 50  0000 C CNN
F 1 "100K" V 1950 2100 50  0000 C CNN
F 2 "" V 1880 2100 50  0000 C CNN
F 3 "" H 1950 2100 50  0000 C CNN
	1    1950 2100
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 56C9C734
P 2350 1850
F 0 "C1" H 2375 1950 50  0000 L CNN
F 1 "1uF" H 2375 1750 50  0000 L CNN
F 2 "" H 2388 1700 50  0000 C CNN
F 3 "" H 2350 1850 50  0000 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 56C9C78B
P 2350 2350
F 0 "R8" V 2430 2350 50  0000 C CNN
F 1 "100K" V 2350 2350 50  0000 C CNN
F 2 "" V 2280 2350 50  0000 C CNN
F 3 "" H 2350 2350 50  0000 C CNN
	1    2350 2350
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 56C9C7DE
P 1950 1000
F 0 "R1" V 2030 1000 50  0000 C CNN
F 1 "1K" V 1950 1000 50  0000 C CNN
F 2 "" V 1880 1000 50  0000 C CNN
F 3 "" H 1950 1000 50  0000 C CNN
	1    1950 1000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 56C9C824
P 2350 2750
F 0 "#PWR02" H 2350 2500 50  0001 C CNN
F 1 "GND" H 2350 2600 50  0000 C CNN
F 2 "" H 2350 2750 50  0000 C CNN
F 3 "" H 2350 2750 50  0000 C CNN
	1    2350 2750
	1    0    0    -1  
$EndComp
Text Label 1350 3500 0    60   ~ 0
D7
Text Label 1350 3800 0    60   ~ 0
D6
Text Label 1350 4100 0    60   ~ 0
D5
Text Label 1350 4400 0    60   ~ 0
D4
Text Label 1350 5200 0    60   ~ 0
D9
Text Label 1350 5500 0    60   ~ 0
D10
$Comp
L R R4
U 1 1 56C9DA36
P 1950 3500
F 0 "R4" V 2030 3500 50  0000 C CNN
F 1 "1K 1%" V 1850 3500 50  0000 C CNN
F 2 "" V 1880 3500 50  0000 C CNN
F 3 "" H 1950 3500 50  0000 C CNN
	1    1950 3500
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 56C9DA6A
P 1950 3800
F 0 "R5" V 2030 3800 50  0000 C CNN
F 1 "2K2 1%" V 1850 3800 50  0000 C CNN
F 2 "" V 1880 3800 50  0000 C CNN
F 3 "" H 1950 3800 50  0000 C CNN
	1    1950 3800
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 56C9DAC8
P 1950 4100
F 0 "R6" V 2030 4100 50  0000 C CNN
F 1 "3K9 1%" V 1850 4100 50  0000 C CNN
F 2 "" V 1880 4100 50  0000 C CNN
F 3 "" H 1950 4100 50  0000 C CNN
	1    1950 4100
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 56C9DAFD
P 1950 4400
F 0 "R7" V 2030 4400 50  0000 C CNN
F 1 "8K2 1%" V 1850 4400 50  0000 C CNN
F 2 "" V 1880 4400 50  0000 C CNN
F 3 "" H 1950 4400 50  0000 C CNN
	1    1950 4400
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 56C9DB34
P 2000 5200
F 0 "D1" H 2000 5300 50  0000 C CNN
F 1 "TX (GREEN)" H 2000 5100 50  0000 C CNN
F 2 "" H 2000 5200 50  0000 C CNN
F 3 "" H 2000 5200 50  0000 C CNN
	1    2000 5200
	-1   0    0    1   
$EndComp
$Comp
L LED D2
U 1 1 56C9DB72
P 2000 5500
F 0 "D2" H 2000 5600 50  0000 C CNN
F 1 "RX (RED)" H 2000 5400 50  0000 C CNN
F 2 "" H 2000 5500 50  0000 C CNN
F 3 "" H 2000 5500 50  0000 C CNN
	1    2000 5500
	-1   0    0    1   
$EndComp
$Comp
L R R10
U 1 1 56C9DBB2
P 2700 4650
F 0 "R10" V 2780 4650 50  0000 C CNN
F 1 "270 1%" V 2600 4650 50  0000 C CNN
F 2 "" V 2630 4650 50  0000 C CNN
F 3 "" H 2700 4650 50  0000 C CNN
	1    2700 4650
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 56C9DC08
P 3000 4650
F 0 "C3" H 3025 4750 50  0000 L CNN
F 1 "100nF" H 3025 4550 50  0000 L CNN
F 2 "" H 3038 4500 50  0000 C CNN
F 3 "" H 3000 4650 50  0000 C CNN
	1    3000 4650
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 56C9DC4C
P 2700 4150
F 0 "C2" H 2725 4250 50  0000 L CNN
F 1 "4.7uF" H 2725 4050 50  0000 L CNN
F 2 "" H 2738 4000 50  0000 C CNN
F 3 "" H 2700 4150 50  0000 C CNN
	1    2700 4150
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 56C9DCE7
P 3000 3800
F 0 "R11" V 3100 3800 50  0000 C CNN
F 1 "100K" V 3000 3800 50  0000 C CNN
F 2 "" V 2930 3800 50  0000 C CNN
F 3 "" H 3000 3800 50  0000 C CNN
	1    3000 3800
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 56C9DD3A
P 3300 4150
F 0 "R12" V 3380 4150 50  0000 C CNN
F 1 "1K" V 3300 4150 50  0000 C CNN
F 2 "" V 3230 4150 50  0000 C CNN
F 3 "" H 3300 4150 50  0000 C CNN
	1    3300 4150
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 56C9DD8B
P 2450 5500
F 0 "R9" V 2530 5500 50  0000 C CNN
F 1 "3K3" V 2350 5500 50  0000 C CNN
F 2 "" V 2380 5500 50  0000 C CNN
F 3 "" H 2450 5500 50  0000 C CNN
	1    2450 5500
	0    1    1    0   
$EndComp
Text Label 3650 3500 0    60   ~ 0
LINE_LEVEL_OUT
Text Label 3650 3800 0    60   ~ 0
MIC_LEVEL_OUT
$Comp
L GND #PWR03
U 1 1 56C9E66C
P 2700 5600
F 0 "#PWR03" H 2700 5350 50  0001 C CNN
F 1 "GND" H 2700 5450 50  0000 C CNN
F 2 "" H 2700 5600 50  0000 C CNN
F 3 "" H 2700 5600 50  0000 C CNN
	1    2700 5600
	1    0    0    -1  
$EndComp
Text Label 7200 2950 0    60   ~ 0
D3
Text Label 5200 2250 0    60   ~ 0
A0
Text Label 7200 2850 0    60   ~ 0
D4
Text Label 7200 2750 0    60   ~ 0
D5
Text Label 7200 2500 0    60   ~ 0
D6
Text Label 7200 2400 0    60   ~ 0
D7
Text Label 7200 2200 0    60   ~ 0
D9
Text Label 7200 2100 0    60   ~ 0
D10
$Comp
L CONN_01X02 P1
U 1 1 56CA0A77
P 6000 5150
F 0 "P1" H 6000 5300 50  0000 C CNN
F 1 "CONN_01X02" V 6100 5150 50  0000 C CNN
F 2 "" H 6000 5150 50  0000 C CNN
F 3 "" H 6000 5150 50  0000 C CNN
	1    6000 5150
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR04
U 1 1 56CA0B96
P 6800 5200
F 0 "#PWR04" H 6800 4950 50  0001 C CNN
F 1 "GND" H 6800 5050 50  0000 C CNN
F 2 "" H 6800 5200 50  0000 C CNN
F 3 "" H 6800 5200 50  0000 C CNN
	1    6800 5200
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 56CA0D50
P 6500 5100
F 0 "#FLG05" H 6500 5195 50  0001 C CNN
F 1 "PWR_FLAG" H 6500 5280 50  0000 C CNN
F 2 "" H 6500 5100 50  0000 C CNN
F 3 "" H 6500 5100 50  0000 C CNN
	1    6500 5100
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG06
U 1 1 56CA0E2C
P 6500 5200
F 0 "#FLG06" H 6500 5295 50  0001 C CNN
F 1 "PWR_FLAG" H 6500 5380 50  0000 C CNN
F 2 "" H 6500 5200 50  0000 C CNN
F 3 "" H 6500 5200 50  0000 C CNN
	1    6500 5200
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR07
U 1 1 56CA0F88
P 6800 5100
F 0 "#PWR07" H 6800 4950 50  0001 C CNN
F 1 "+5V" H 6800 5240 50  0000 C CNN
F 2 "" H 6800 5100 50  0000 C CNN
F 3 "" H 6800 5100 50  0000 C CNN
	1    6800 5100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 56CA1089
P 6200 1000
F 0 "#PWR08" H 6200 850 50  0001 C CNN
F 1 "+5V" H 6200 1140 50  0000 C CNN
F 2 "" H 6200 1000 50  0000 C CNN
F 3 "" H 6200 1000 50  0000 C CNN
	1    6200 1000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR09
U 1 1 56CA1153
P 1350 2100
F 0 "#PWR09" H 1350 1950 50  0001 C CNN
F 1 "+5V" H 1350 2240 50  0000 C CNN
F 2 "" H 1350 2100 50  0000 C CNN
F 3 "" H 1350 2100 50  0000 C CNN
	1    1350 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 56CA1675
P 6200 4300
F 0 "#PWR010" H 6200 4050 50  0001 C CNN
F 1 "GND" H 6200 4150 50  0000 C CNN
F 2 "" H 6200 4300 50  0000 C CNN
F 3 "" H 6200 4300 50  0000 C CNN
	1    6200 4300
	1    0    0    -1  
$EndComp
Text Label 3650 1650 0    60   ~ 0
LINE_LEVEL_IN
NoConn ~ 6900 3050
NoConn ~ 6900 3150
NoConn ~ 6900 3250
NoConn ~ 5500 3750
NoConn ~ 5500 2050
NoConn ~ 6050 1300
NoConn ~ 6350 1300
NoConn ~ 5500 2550
NoConn ~ 5500 2650
NoConn ~ 5500 2750
NoConn ~ 5500 2850
NoConn ~ 5500 2950
NoConn ~ 6900 1800
Text Label 1850 6200 0    60   ~ 0
MIC_LEVEL_OUT
Text Label 1850 6300 0    60   ~ 0
LINE_LEVEL_OUT
Text Label 1850 6400 0    60   ~ 0
PTT_V+
Text Label 1850 6500 0    60   ~ 0
LINE_LEVEL_IN
$Comp
L CONN_01X05 P2
U 1 1 56CA322C
P 1500 6400
F 0 "P2" H 1500 6700 50  0000 C CNN
F 1 "CONN_01X05" V 1600 6400 50  0000 C CNN
F 2 "" H 1500 6400 50  0000 C CNN
F 3 "" H 1500 6400 50  0000 C CNN
	1    1500 6400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR011
U 1 1 56CA3502
P 3650 2750
F 0 "#PWR011" H 3650 2500 50  0001 C CNN
F 1 "GND" H 3650 2600 50  0000 C CNN
F 2 "" H 3650 2750 50  0000 C CNN
F 3 "" H 3650 2750 50  0000 C CNN
	1    3650 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 56CA3666
P 3650 1200
F 0 "#PWR012" H 3650 950 50  0001 C CNN
F 1 "GND" H 3650 1050 50  0000 C CNN
F 2 "" H 3650 1200 50  0000 C CNN
F 3 "" H 3650 1200 50  0000 C CNN
	1    3650 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 56CA3A2B
P 1850 6600
F 0 "#PWR013" H 1850 6350 50  0001 C CNN
F 1 "GND" H 1850 6450 50  0000 C CNN
F 2 "" H 1850 6600 50  0000 C CNN
F 3 "" H 1850 6600 50  0000 C CNN
	1    1850 6600
	1    0    0    -1  
$EndComp
$Comp
L JACK_STEREO J1
U 1 1 56CA3E3E
P 3800 6400
F 0 "J1" H 3425 6400 50  0000 R CNN
F 1 "3.5mm Stereo Jack" H 3800 6650 50  0000 C CNN
F 2 "" H 3800 6400 60  0000 C CNN
F 3 "" H 3800 6400 60  0000 C CNN
	1    3800 6400
	1    0    0    -1  
$EndComp
$Comp
L JACK_STEREO J2
U 1 1 56CA3EA0
P 3800 7100
F 0 "J2" H 3425 7100 50  0000 R CNN
F 1 "2.5mm Stereo Jack" H 3800 7350 50  0000 C CNN
F 2 "" H 3800 7100 60  0000 C CNN
F 3 "" H 3800 7100 60  0000 C CNN
	1    3800 7100
	1    0    0    -1  
$EndComp
Text Label 4600 6450 0    60   ~ 0
MIC_LEVEL_OUT
Text Label 4600 6550 0    60   ~ 0
PTT_V+
Text Label 4600 6950 0    60   ~ 0
LINE_LEVEL_IN
$Comp
L GND #PWR014
U 1 1 56CA45F6
P 4600 7250
F 0 "#PWR014" H 4600 7000 50  0001 C CNN
F 1 "GND" H 4600 7100 50  0000 C CNN
F 2 "" H 4600 7250 50  0000 C CNN
F 3 "" H 4600 7250 50  0000 C CNN
	1    4600 7250
	1    0    0    -1  
$EndComp
NoConn ~ 4150 6250
NoConn ~ 13150 5200
NoConn ~ 13450 3750
$Comp
L CONN_01X04 P5
U 1 1 56CA4E8B
P 10500 1550
F 0 "P5" H 10500 1800 50  0000 C CNN
F 1 "GPS" V 10600 1550 50  0000 C CNN
F 2 "" H 10500 1550 50  0000 C CNN
F 3 "" H 10500 1550 50  0000 C CNN
	1    10500 1550
	1    0    0    -1  
$EndComp
Text Label 8700 1600 0    60   ~ 0
GPS_RX
$Comp
L +5V #PWR015
U 1 1 56CA4FE4
P 10300 900
F 0 "#PWR015" H 10300 750 50  0001 C CNN
F 1 "+5V" H 10300 1040 50  0000 C CNN
F 2 "" H 10300 900 50  0000 C CNN
F 3 "" H 10300 900 50  0000 C CNN
	1    10300 900 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 56CA5040
P 8700 1700
F 0 "#PWR016" H 8700 1450 50  0001 C CNN
F 1 "GND" H 8700 1550 50  0000 C CNN
F 2 "" H 8700 1700 50  0000 C CNN
F 3 "" H 8700 1700 50  0000 C CNN
	1    8700 1700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 56CA54CB
P 9700 2350
F 0 "P3" H 9700 2550 50  0000 C CNN
F 1 "TEMPERATURE" V 9800 2350 50  0000 C CNN
F 2 "" H 9700 2350 50  0000 C CNN
F 3 "" H 9700 2350 50  0000 C CNN
	1    9700 2350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR017
U 1 1 56CA56D6
P 8700 2250
F 0 "#PWR017" H 8700 2100 50  0001 C CNN
F 1 "+5V" H 8700 2390 50  0000 C CNN
F 2 "" H 8700 2250 50  0000 C CNN
F 3 "" H 8700 2250 50  0000 C CNN
	1    8700 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 56CA5735
P 8700 2450
F 0 "#PWR018" H 8700 2200 50  0001 C CNN
F 1 "GND" H 8700 2300 50  0000 C CNN
F 2 "" H 8700 2450 50  0000 C CNN
F 3 "" H 8700 2450 50  0000 C CNN
	1    8700 2450
	1    0    0    -1  
$EndComp
Text Label 8700 2350 0    60   ~ 0
TEMP_DATA
$Comp
L arduino_mini U1
U 1 1 56C9F828
P 6200 2450
F 0 "U1" H 6700 1500 70  0000 C CNN
F 1 "arduino_mini" H 6950 1400 70  0000 C CNN
F 2 "DIL20" H 6200 2400 60  0000 C CNN
F 3 "" H 6200 2450 60  0000 C CNN
	1    6200 2450
	1    0    0    -1  
$EndComp
Text Label 7200 1900 0    60   ~ 0
GPS_TX
Text Label 7200 2000 0    60   ~ 0
GPS_RX
Text Label 7200 2300 0    60   ~ 0
TEMP_DATA
$Comp
L CONN_01X03 P4
U 1 1 56CA6114
P 10300 3050
F 0 "P4" H 10300 3250 50  0000 C CNN
F 1 "RADIO" V 10400 3050 50  0000 C CNN
F 2 "" H 10300 3050 50  0000 C CNN
F 3 "" H 10300 3050 50  0000 C CNN
	1    10300 3050
	1    0    0    -1  
$EndComp
Text Label 8700 2950 0    60   ~ 0
RADIO_TX
Text Label 8700 3050 0    60   ~ 0
RADIO_RX
$Comp
L GND #PWR019
U 1 1 56CA6279
P 8700 3150
F 0 "#PWR019" H 8700 2900 50  0001 C CNN
F 1 "GND" H 8700 3000 50  0000 C CNN
F 2 "" H 8700 3150 50  0000 C CNN
F 3 "" H 8700 3150 50  0000 C CNN
	1    8700 3150
	1    0    0    -1  
$EndComp
Text Label 4700 2350 0    60   ~ 0
RADIO_TX
Text Label 4700 2450 0    60   ~ 0
RADIO_RX
$Comp
L R R13
U 1 1 56CA6C17
P 9750 1500
F 0 "R13" V 9830 1500 50  0000 C CNN
F 1 "10K" V 9750 1500 50  0000 C CNN
F 2 "" V 9680 1500 50  0000 C CNN
F 3 "" H 9750 1500 50  0000 C CNN
	1    9750 1500
	0    1    1    0   
$EndComp
$Comp
L R R15
U 1 1 56CA6D4F
P 10000 1250
F 0 "R15" V 10080 1250 50  0000 C CNN
F 1 "20K" V 10000 1250 50  0000 C CNN
F 2 "" V 9930 1250 50  0000 C CNN
F 3 "" H 10000 1250 50  0000 C CNN
	1    10000 1250
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 56CA6E81
P 10000 2750
F 0 "R16" V 10080 2750 50  0000 C CNN
F 1 "20K" V 10000 2750 50  0000 C CNN
F 2 "" V 9930 2750 50  0000 C CNN
F 3 "" H 10000 2750 50  0000 C CNN
	1    10000 2750
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 56CA6F5C
P 9750 2950
F 0 "R14" V 9830 2950 50  0000 C CNN
F 1 "10K" V 9750 2950 50  0000 C CNN
F 2 "" V 9680 2950 50  0000 C CNN
F 3 "" H 9750 2950 50  0000 C CNN
	1    9750 2950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR020
U 1 1 56CA71D1
P 10150 2500
F 0 "#PWR020" H 10150 2250 50  0001 C CNN
F 1 "GND" H 10150 2350 50  0000 C CNN
F 2 "" H 10150 2500 50  0000 C CNN
F 3 "" H 10150 2500 50  0000 C CNN
	1    10150 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 56CA7343
P 10150 1000
F 0 "#PWR021" H 10150 750 50  0001 C CNN
F 1 "GND" H 10150 850 50  0000 C CNN
F 2 "" H 10150 1000 50  0000 C CNN
F 3 "" H 10150 1000 50  0000 C CNN
	1    10150 1000
	1    0    0    -1  
$EndComp
Text Label 8700 1500 0    60   ~ 0
GPS_TX
Wire Wire Line
	1350 1000 1800 1000
Wire Wire Line
	1800 1000 1800 1200
Wire Wire Line
	2100 1000 2500 1000
Wire Wire Line
	2100 1200 3650 1200
Wire Wire Line
	2350 1300 2350 1200
Connection ~ 2350 1200
Connection ~ 2800 1200
Wire Wire Line
	2100 2100 2350 2100
Wire Wire Line
	2350 2000 2350 2200
Connection ~ 2350 2100
Wire Wire Line
	1350 2400 2200 2400
Wire Wire Line
	2200 2400 2200 2100
Connection ~ 2200 2100
Wire Wire Line
	2350 2500 2350 2750
Wire Wire Line
	2350 2750 3650 2750
Wire Wire Line
	1350 3500 1800 3500
Wire Wire Line
	2100 3500 2300 3500
Wire Wire Line
	2300 3500 2300 4400
Wire Wire Line
	2300 3800 2100 3800
Wire Wire Line
	1800 3800 1350 3800
Wire Wire Line
	1350 4100 1800 4100
Wire Wire Line
	2300 4100 2100 4100
Connection ~ 2300 3800
Wire Wire Line
	2100 4400 3000 4400
Connection ~ 2300 4100
Wire Wire Line
	1800 4400 1350 4400
Wire Wire Line
	2700 4300 2700 4500
Connection ~ 2300 4400
Connection ~ 2700 4400
Wire Wire Line
	3000 4400 3000 4500
Wire Wire Line
	2700 4800 2700 5600
Wire Wire Line
	2600 5500 3300 5500
Connection ~ 2700 5500
Wire Wire Line
	2200 5500 2300 5500
Wire Wire Line
	1800 5500 1350 5500
Wire Wire Line
	1350 5200 1800 5200
Wire Wire Line
	2200 5200 2250 5200
Wire Wire Line
	2250 5200 2250 5500
Connection ~ 2250 5500
Wire Wire Line
	2700 3800 2700 4000
Wire Wire Line
	2700 3800 2850 3800
Wire Wire Line
	3150 3800 3650 3800
Wire Wire Line
	3300 3800 3300 4000
Wire Wire Line
	3300 5500 3300 4300
Wire Wire Line
	2700 3850 2700 3500
Wire Wire Line
	2700 3500 3650 3500
Connection ~ 2700 3850
Connection ~ 3300 3800
Wire Wire Line
	3000 4800 3000 4900
Wire Wire Line
	3000 4900 2700 4900
Connection ~ 2700 4900
Wire Wire Line
	6900 2950 7200 2950
Wire Wire Line
	5200 2250 5500 2250
Wire Wire Line
	6900 2100 7200 2100
Wire Wire Line
	6900 2200 7200 2200
Wire Wire Line
	6900 2400 7200 2400
Wire Wire Line
	6900 2500 7200 2500
Wire Wire Line
	6900 2750 7200 2750
Wire Wire Line
	6900 2850 7200 2850
Wire Wire Line
	1350 2100 1800 2100
Wire Wire Line
	6200 5200 6800 5200
Connection ~ 6500 5200
Wire Wire Line
	6200 4300 6200 4000
Wire Wire Line
	2350 1650 3650 1650
Wire Wire Line
	2350 1700 2350 1650
Wire Wire Line
	3650 800  2800 800 
Wire Wire Line
	6200 5100 6800 5100
Connection ~ 6500 5100
Wire Wire Line
	6200 1000 6200 1300
Wire Wire Line
	1850 6600 1700 6600
Wire Wire Line
	1700 6500 1850 6500
Wire Wire Line
	1850 6400 1700 6400
Wire Wire Line
	1700 6300 1850 6300
Wire Wire Line
	1850 6200 1700 6200
Wire Wire Line
	4150 7250 4600 7250
Wire Wire Line
	4150 7150 4400 7150
Wire Wire Line
	4400 7150 4400 7250
Connection ~ 4400 7250
Wire Wire Line
	4150 6950 4600 6950
Wire Wire Line
	4600 6550 4150 6550
Wire Wire Line
	4150 6450 4600 6450
Wire Wire Line
	8700 1600 10300 1600
Wire Wire Line
	8700 1700 10300 1700
Wire Wire Line
	8700 2250 9500 2250
Wire Wire Line
	9500 2350 8700 2350
Wire Wire Line
	8700 2450 9500 2450
Wire Wire Line
	7200 1900 6900 1900
Wire Wire Line
	6900 2000 7200 2000
Wire Wire Line
	7200 2300 6900 2300
Wire Wire Line
	8700 3150 10100 3150
Wire Wire Line
	8700 3050 10100 3050
Wire Wire Line
	8700 2950 9600 2950
Wire Wire Line
	4700 2350 5500 2350
Wire Wire Line
	5500 2450 4700 2450
Wire Wire Line
	9900 2950 10100 2950
Wire Wire Line
	10000 2900 10000 2950
Connection ~ 10000 2950
Wire Wire Line
	9900 1500 10300 1500
Wire Wire Line
	10000 1500 10000 1400
Wire Wire Line
	10000 1100 10000 1000
Wire Wire Line
	10000 1000 10150 1000
Connection ~ 10000 1500
Wire Wire Line
	8700 1500 9600 1500
Wire Wire Line
	10300 900  10300 1400
Wire Wire Line
	10150 2500 10000 2500
Wire Wire Line
	10000 2500 10000 2600
$EndSCHEMATC
