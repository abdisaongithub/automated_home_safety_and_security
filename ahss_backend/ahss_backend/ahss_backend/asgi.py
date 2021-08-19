import os
import django
from channels.auth import AuthMiddlewareStack
from channels.http import AsgiHandler
from channels.routing import ProtocolTypeRouter, URLRouter
import app.routing

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ahss_backend.settings')
django.setup()

application = ProtocolTypeRouter({
  "http": AsgiHandler(),
  "websocket": AuthMiddlewareStack(
    URLRouter(
      app.routing.websocket_urlpatterns
    )
  )
})
