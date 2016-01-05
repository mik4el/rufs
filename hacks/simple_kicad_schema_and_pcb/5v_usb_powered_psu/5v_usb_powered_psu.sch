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
Text Notes 7000 6750 0    60   ~ 0
PSU supplying 5v from Li-ion battery with Li-ion charger TP4056 accepting charge\nthrough pin header or usb.
$Comp
L CONN_01X02 P?
U 1 1 568B86B7
P 1850 950
F 0 "P?" H 1850 1100 50  0000 C CNN
F 1 "CONN_01X02" V 1950 950 50  0000 C CNN
F 2 "" H 1850 950 50  0000 C CNN
F 3 "" H 1850 950 50  0000 C CNN
	1    1850 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 900  1050 900 
Wire Wire Line
	1650 1000 1050 1000
Text Label 1050 900  2    60   ~ 0
VCC_OUT
Text Label 1050 1000 2    60   ~ 0
GND_OUT
$Comp
L CONN_01X02 P?
U 1 1 568B8786
P 1850 1550
F 0 "P?" H 1850 1700 50  0000 C CNN
F 1 "CONN_01X02" V 1950 1550 50  0000 C CNN
F 2 "" H 1850 1550 50  0000 C CNN
F 3 "" H 1850 1550 50  0000 C CNN
	1    1850 1550
	1    0    0    -1  
$EndComp
$Comp
L USB_OTG P?
U 1 1 568B87AF
P 1800 2150
F 0 "P?" H 2125 2025 50  0000 C CNN
F 1 "USB_OTG" H 1800 2350 50  0000 C CNN
F 2 "" V 1750 2050 50  0000 C CNN
F 3 "" V 1750 2050 50  0000 C CNN
	1    1800 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 1500 1050 1500
Wire Wire Line
	1650 1600 1050 1600
Wire Wire Line
	1500 1950 1300 1950
Wire Wire Line
	1300 1950 1300 1600
Connection ~ 1300 1600
Wire Wire Line
	1500 2350 1200 2350
Wire Wire Line
	1200 2350 1200 1500
Connection ~ 1200 1500
$EndSCHEMATC
