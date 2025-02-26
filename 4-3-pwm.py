import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(24, GPIO.OUT)

pwm =GPIO.PWM(24, 1000)
try:
    pwm.start(0)
    while True:
        duty = input()
        try:
            duty = float(duty)
            if 0<=duty<=100:

            
                pwm.ChangeDutyCycle(duty)
                voltage = 3.3 * (duty / 100)
                print(voltage)
            else:
                continue
        except:
            continue

finally: 
    GPIO.PWM(24, 1000).stop()
    GPIO.cleanup()

