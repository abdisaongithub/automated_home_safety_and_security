from rest_framework import generics
from .serializers import SettingsSerializer, VideosSerializer, NotificationsSerializer, CapturedImagesSerializer, LogsSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework import permissions
from .models import Settings, Videos, Notifications, CapturedImages, Log
from rest_framework.views import APIView
# TODO: Implement all the authorisation rules


class SettingsListCreateAPIView(generics.ListCreateAPIView):
    queryset = Settings.objects.all()
    serializer_class = SettingsSerializer

    permission_classes = (permissions.IsAuthenticated,)


class SettingsUpdateAPIView(generics.UpdateAPIView):
    queryset = Settings.objects.all()
    serializer_class = SettingsSerializer

    permission_classes = (permissions.IsAuthenticated,)


class SettingsRetrieveAPIView(generics.RetrieveAPIView):
    pass


class VideosListAPIView(generics.ListAPIView):
    queryset = Videos.objects.all()
    serializer_class = VideosSerializer
    # TODO: I believe this is enough, and change Log model to logs or the other models to their singular form

    permission_classes = (permissions.IsAuthenticated,)


class NotificationsListAPIView(generics.ListAPIView):
    queryset = Notifications.objects.all()
    serializer_class = NotificationsSerializer

    permission_classes = (permissions.IsAuthenticated,)


class CapturedImagesListAPIView(generics.ListAPIView):
    queryset = CapturedImages.objects.all()
    serializer_class = CapturedImagesSerializer

    permission_classes = (permissions.IsAuthenticated,)


class LogsListAPIView(generics.ListAPIView):
    queryset = Log.objects.all()
    serializer_class = LogsSerializer

    permission_classes = (permissions.IsAuthenticated,)


def temperatureListView(request):
    # TODO: generate different temperatures here : RPi
    pass


def humidityListView(request):
    # TODO: generate different temperatures here : RPi
    pass

def infraredListView(request):
    # TODO: generate different temperatures here : RPi
    pass


# TODO: RPi IP- 10.0.2.15
# TODO: RPi Password: raspberry
