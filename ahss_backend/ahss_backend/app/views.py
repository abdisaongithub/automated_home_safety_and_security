from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework import generics
import random
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


class SettingsRetrieveAPIView(generics.RetrieveUpdateAPIView):
    queryset = Settings.objects.all()
    serializer_class = SettingsSerializer

    permission_classes = (permissions.AllowAny,)


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




def sensorsListView(request):
    data = {
        'temps':
            [
                {
                    'room': 'Living Room',
                    'temp': 20,
                },
                {
                    'room': 'Kitchen',
                    'temp': 20,
                },
                {
                    'room': 'Master Bedroom',
                    'temp': 20,
                },
                {
                    'room': 'Garage',
                    'temp': 20,
                }
            ],
        'hum':
            [
                {
                    'room': 'Living Room',
                    'hum': 20,
                },
                {
                    'room': 'Kitchen',
                    'hum': 20,
                },
                {
                    'room': 'Master Bedroom',
                    'hum': 20,
                },
                {
                    'room': 'Garage',
                    'hum': 20,
                }
            ],
        'pressure':
            [
                {
                    'room': 'Living Room',
                    'pre': 20,
                },
                {
                    'room': 'Kitchen',
                    'pre': 20,
                },
                {
                    'room': 'Master Bedroom',
                    'pre': 20,
                },
                {
                    'room': 'Garage',
                    'pre': 20,
                }
            ],
    }

    return HttpResponse(json.dumps(data), status=status.HTTP_200_OK, content_type='Application/json')


@csrf_exempt
def updateSetting(request, pk, *args, **kwargs):
    if request.method == 'POST':
        setting = Settings.objects.get(pk=pk)
        if request.POST['state']:
            if request.POST['state'] == "True" or request.POST['state'] == "False":
                print('it worked')
                setting.state = request.POST['state']
                setting.save()

                newState = True

                if setting.state == 'True':
                    newState = True
                else:
                    newState = False

                return HttpResponse(
                    json.dumps({
                        'id': setting.id,
                        'name': setting.name,
                        'state': newState,
                    }),
                    status=status.HTTP_200_OK,
                    content_type='application/json',
                )

        return HttpResponse(
            json.dumps({
                'data': 'Error',
                'msg': 'Error',
            }),
            status=status.HTTP_400_BAD_REQUEST,
            content_type='application/json',
        )

    else:
        HttpResponse(
            json.dumps({'data': 'Error', 'msg': 'Method Not Allowed'}),
            status=status.HTTP_405_METHOD_NOT_ALLOWED,
            content_type='Application/json',
        )
