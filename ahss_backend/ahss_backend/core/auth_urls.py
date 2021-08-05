from django.urls import path
from .views import UserCreateView, UserChangePasswordAPIView

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView,
)

urlpatterns = [

    path('create_user/', UserCreateView.as_view(), name='create_user'),

    path('change_password/<int:pk>/', UserChangePasswordAPIView.as_view(), name='change_password'),

    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),

    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),

]
