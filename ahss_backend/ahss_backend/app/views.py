import io
from django.http import HttpResponse
from rest_framework import generics
import random
from sense_emu import SenseHat
from .serializers import (
    SettingsSerializer,
    VideosSerializer,
    NotificationsSerializer,
    CapturedImagesSerializer,
    LogsSerializer,
)

from rest_framework import status
from rest_framework import permissions
from .models import Settings, Videos, Notifications, CapturedImages, Log
from rest_framework.views import APIView
# TODO: Implement all the authorisation rules

import json


class SettingsListCreateAPIView(generics.ListCreateAPIView):
    queryset = Settings.objects.all()
    serializer_class = SettingsSerializer

    permission_classes = (permissions.AllowAny,)
    # TODO: sort settings alphabetically


class SettingsRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    queryset = Settings.objects.all()
    serializer_class = SettingsSerializer

    permission_classes = (permissions.AllowAny,)


class SettingsRetrieveAPIView(generics.RetrieveAPIView):
    pass


class VideosListAPIView(generics.ListAPIView):
    queryset = Videos.objects.all()
    serializer_class = VideosSerializer
    # TODO: I believe this is enough, and change Log model to logs or the other models to their singular form

    permission_classes = (permissions.AllowAny,)


class NotificationsListAPIView(generics.ListAPIView):
    queryset = Notifications.objects.all()
    serializer_class = NotificationsSerializer

    permission_classes = (permissions.AllowAny,)


class CapturedImagesListAPIView(generics.ListAPIView):
    queryset = CapturedImages.objects.all()
    serializer_class = CapturedImagesSerializer

    permission_classes = (permissions.AllowAny,)


class LogsListAPIView(generics.ListAPIView):
    queryset = Log.objects.all()
    serializer_class = LogsSerializer

    permission_classes = (permissions.AllowAny,)


sense = SenseHat()



def sensorsListView(request):
    data = {
        'temps':
            [
                {
                    'room': 'Living Room',
                    'temp': round(sense.temperature, 1),
                },
                {
                    'room': 'Kitchen',
                    'temp': round(sense.temperature + random.random() * 5, 1),
                },
                {
                    'room': 'Master Bedroom',
                    'temp': round(sense.temperature + random.random() * 5, 1),
                },
                {
                    'room': 'Garage',
                    'temp': round(sense.temperature + random.random() * 5, 1),
                }
            ],
        'hum':
            [
                {
                    'room': 'Living Room',
                    'hum': round(sense.humidity, 1),
                },
                {
                    'room': 'Kitchen',
                    'hum': round(sense.humidity + random.random() * 3, 1),
                },
                {
                    'room': 'Master Bedroom',
                    'hum': round(sense.humidity + random.random() * 3, 1),
                },
                {
                    'room': 'Garage',
                    'hum': round(sense.humidity + random.random() * 3, 1),
                }
            ],
        'pressure':
            [
                {
                    'room': 'Living Room',
                    'pre': round(sense.pressure, 1),
                },
                {
                    'room': 'Kitchen',
                    'pre': round(sense.pressure + random.random() * 30, 1),
                },
                {
                    'room': 'Master Bedroom',
                    'pre': round(sense.pressure + random.random() * 30, 1),
                },
                {
                    'room': 'Garage',
                    'pre': round(sense.pressure + random.random() * 30, 1),
                }
            ],
    }

    return HttpResponse(json.dumps(data), status=status.HTTP_200_OK, content_type='Application/json')


def updateSetting():
    return response(data=json.dumps({'data': 'Sens Data'}), status=status.HTTP_200_OK, content_type='Application/json' )


def temperatureListView(request):
    # TODO: generate different humidity here : RPi
    pass


def humidityListView(request):
    # TODO: generate different humidity here : RPi
    pass


def infraredListView(request):
    # TODO: generate different infrared here : RPi
    pass


def is_raspberrypi():
    try:
        with io.open('/sys/firmware/devicetree/base/model', 'r') as m:
            if 'raspberry pi' in m.read().lower():
                return True
    except Exception:
        pass
    return False

# TODO: RPi IP- 10.0.2.15
# TODO: RPi Password: raspberry
