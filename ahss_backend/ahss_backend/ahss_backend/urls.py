from django.contrib import admin
from django.urls import path, include
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from django.conf.urls import url
from rest_framework import permissions

schema_view = get_schema_view(
   openapi.Info(
      title="AIHS API",
      default_version='v1',
      description="For the development of AIHS Backend capabilities",
      terms_of_service="https://www.google.com/policies/terms/",
      contact=openapi.Contact(email="contact@snippets.local"),
      license=openapi.License(name="BSD License"),
   ),
   public=True,
   permission_classes=(permissions.AllowAny,),
)
urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('users/', include('core.urls')),
    path('auth/', include('core.auth_urls')),
    path('app/', include('app.urls')),

    # API Documentations

    url(r'^docs/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),

]

