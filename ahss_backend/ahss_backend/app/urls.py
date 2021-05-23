from django.urls import path
from .views import (
    SettingsListCreateAPIView,
    SettingsUpdateAPIView,
    VideosListAPIView,
    NotificationsListAPIView,
    CapturedImagesListAPIView,
    LogsListAPIView,
    temperatureListView,
)

urlpatterns = [

    path('settings/', SettingsListCreateAPIView.as_view(), name='app_settings_list'),

    path('settings/update/<int:pk>/', SettingsUpdateAPIView.as_view(), name='app_settings_list'),

    path('videos/', VideosListAPIView.as_view(), name='app_videos_list'),

    path('notifications/', NotificationsListAPIView.as_view(), name='app_notifications_list'),

    path('images/', CapturedImagesListAPIView.as_view(), name='app_images_list'),

    path('logs/', LogsListAPIView.as_view(), name='app_logs_list'),

    path('/temperature', temperatureListView, name='app_temperature_list_view'),

    # TODO: prepare a url to accept incoming temperature updates
]
