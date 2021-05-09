from django.contrib import admin

from .models import User, UserManager


class CustomUserAdmin(admin.ModelAdmin):
    model = UserManager


admin.site.register(User, CustomUserAdmin)
