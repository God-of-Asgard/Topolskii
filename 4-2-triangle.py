import RPi.GPIO as GPIO
import time
dac = [8, 11, 7, 1, 0, 5, 12, 6]

GPIO.setmode(GPIO.BCM)
GPIO.setup(dac, GPIO.OUT)


def decimal2binary(value):
    return [int(element) for element in bin(value)[2:].zfill(8)]


try:
    tim = int(input())
   
    while True:
        
        for value in range(255):
            GPIO.output(dac, decimal2binary(value))
            time.sleep(tim/510)
        for value in range(255, -1, -1):
            GPIO.output(dac, decimal2binary(value))
            time.sleep(tim/510)


finally:
    GPIO.output(dac, GPIO.LOW)

    GPIO.cleanup()
