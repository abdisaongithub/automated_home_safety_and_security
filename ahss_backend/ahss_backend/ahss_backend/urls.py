from django.contrib import admin
from django.urls import path, include
from rest_framework_swagger.views import get_swagger_view
from django.conf.urls import url

schema_view = get_swagger_view(title='AIHS Docs')

urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('users/', include('core.urls')),
    path('auth/', include('core.auth_urls')),
    path('app/', include('app.urls')),

    # API Documentations

    url(r'^docs/', schema_view),
]

