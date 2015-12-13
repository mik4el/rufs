import serial
from time import strftime
from datetime import datetime, time

ser = serial.Serial('/dev/cu.wchusbserialfd130', 9600, timeout=10)

startTime = datetime.now()
try:
	while 1:
		line=ser.readline().rstrip()
		now = datetime.now()
		print("%s %s"%(now.strftime("%Y-%m-%d %H:%M:%S"),line))
		f=open('temp_sensor_log.txt','a')
		print >> f, ("%s %s"%(now.strftime("%Y-%m-%d %H:%M:%S"),line))
		f.close()
except KeyboardInterrupt:
	print "\ndone"