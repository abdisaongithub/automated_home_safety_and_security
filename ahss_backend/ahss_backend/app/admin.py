from django.contrib import admin

from . import models
# Register your models here.

admin.site.register(models.Settings)
admin.site.register(models.CapturedImages)
admin.site.register(models.Notifications)
admin.site.register(models.Log)
admin.site.register(models.Videos)