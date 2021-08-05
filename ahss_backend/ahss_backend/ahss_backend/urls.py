from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('users/', include('core.urls')),
    path('auth/', include('core.auth_urls')),
    path('app/', include('app.urls')),
]
