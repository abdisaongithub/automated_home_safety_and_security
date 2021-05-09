from django.urls import path
from rest_framework_simplejwt import views as jwt_views
from . import views

urlpatterns = [
    path('create/', views.UserCreateView.as_view(), name='create_user'),

    path('token/obtain/', views.ObtainTokenView.as_view(), name='token_create'),
    # override sjwt stock token
    path('token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),

    path('change_password/<int:pk>/', views.UserChangePasswordAPIView.as_view(), name='change_password')

]
