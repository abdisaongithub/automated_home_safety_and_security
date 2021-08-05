from django.urls import path
from .views import (
    SettingsListCreateAPIView,
    SettingsRetrieveUpdateAPIView,
    VideosListAPIView,
    NotificationsListAPIView,
    CapturedImagesListAPIView,
    LogsListAPIView,
    sensorsListView,
)

urlpatterns = [

    path('settings/', SettingsListCreateAPIView.as_view(), name='app_settings_list'),

    path('settings/<int:pk>/', SettingsRetrieveUpdateAPIView.as_view(), name='app_settings_list'),

    path('videos/', VideosListAPIView.as_view(), name='app_videos_list'),

    path('notifications/', NotificationsListAPIView.as_view(), name='app_notifications_list'),

    path('images/', CapturedImagesListAPIView.as_view(), name='app_images_list'),

    path('logs/', LogsListAPIView.as_view(), name='app_logs_list'),

    path('sensors/', sensorsListView, name='app_temperature_list_view'),

    # TODO: prepare a url to accept incoming sensor updates, preferably use websocket

]
