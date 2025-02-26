import RPi.GPIO as GPIO



dac = [8, 11, 7, 1, 0, 5, 12, 6]
GPIO.setmode(GPIO.BCM)
GPIO.setup(dac, GPIO.OUT)
def dec2bin(value):
    return [int(element) for element in bin(value)[2:].zfill(8)]
try:

    while True:
        value = input()
        if value == 'q':
            break
        if float(value) % 1 != 0:
            break        
        value = int(value)
        if value < 0:
            break
        if value > 255:
            break
        value = int(value)
        GPIO.output(dac, dec2bin(value))
        a = 3.3*value/255
        print(a)

except ValueError:
    print('Ошибка')

finally:
    GPIO.output(dac, GPIO.LOW)

    GPIO.cleanup()

