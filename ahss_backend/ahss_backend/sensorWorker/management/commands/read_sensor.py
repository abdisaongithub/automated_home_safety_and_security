from django.core.management import BaseCommand
import time
import board
import adafruit_dht
import RPi.GPIO as GPIO
import time
import io


def is_raspberry_pi():
    try:
        with io.open('/sys/firmware/devicetree/base/model', 'r') as m:
            if 'raspberry pi' in m.read().lower():
                return True
    except Exception:
        pass
    return False


# TODO: RPi Password: raspberry


def getTemperature():
    try:
        if is_raspberry_pi():
            temperature_c = dhtDevice.temperature
            # temperature_f = temperature_c * (9 / 5) + 32
            return temperature_c
        else:
            return '27'
    except Exception as err:
        raise err
    # TODO: required-> pip3 install adafruit-circuitpython-dht
    # TODO: required-> sudo apt-get install libgpiod2


def getHumidity():
    try:
        if is_raspberry_pi():
            humidity = dhtDevice.humidity
            return humidity
        else:
            return '20'
    except Exception as err:
        raise err


def getGas():
    return 'Temperature ' + 'Good'


def getSmoke():
    return 'Smoke ' + 'Safe'


# TODO: These upper two functions are to be polled together


def getMotion():
    GPIO.setmode(GPIO.BCM)
    PIR_PIN = 7
    GPIO.setup(PIR_PIN, GPIO.IN)

    try:
        print("PIR Module Test(CTRL + C to exit)")
        time.sleep(2)
        print('Ready')
        while True:
            if GPIO.input(PIR_PIN):
                print('Motion Detected!')
                time.sleep(1)

    except KeyboardInterrupt:
        print('Quit')
        GPIO.cleanup()


class Command(BaseCommand):
    help = "Collects data from sensors and pushes them to the group channel"

    def handle(self, *args, **options):
        x = 0
        while True:
            time.sleep(2)
            print(getGas())
            print(getTemperature())
            print(getSmoke())
            print(getMotion())
            print(getHumidity())
            print('\n')

# TODO: Bring all the functions inside the command class
