import serial
from time import strftime
from datetime import datetime, time

try:
	ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)  # linux address
except:
	try:
		ser = serial.Serial('/dev/cu.wchusbserialfd130', 9600, timeout=1)  # osx address 2
	except:
		ser = serial.Serial('/dev/cu.wchusbserial1410', 9600, timeout=1)  # osx address 1 

try:
	while 1:
		line=ser.readline().rstrip()
		if len(line)>0: 
			now = datetime.now()
			print("%s %s"%(now.strftime("%Y-%m-%d %H:%M:%S"),line))
			f=open('temp_sensor_log.log','a')
			print >> f, ("%s %s"%(now.strftime("%Y-%m-%d %H:%M:%S"),line))
			f.close()
except KeyboardInterrupt:
	print "\ndone"
