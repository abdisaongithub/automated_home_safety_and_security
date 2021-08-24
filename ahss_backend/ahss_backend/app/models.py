from django.db import models

# TODO: ReImplement all the model structure for validation


class Settings(models.Model):
    name = models.CharField(max_length=255)
    state = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class Videos(models.Model):
    name = models.CharField(max_length=255)
    video = models.CharField(max_length=255, default="/some/default/link/to/a/video/")
    date_time = models.DateTimeField()
    watched = models.BooleanField(default=False)
    # Attributes TODO: Find out what this is

    def __str__(self):
        return self.name


class Notifications(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    datetime = models.DateTimeField()
    seen = models.BooleanField()
    link_to_video = models.CharField(max_length=255, default=None, null=True)

    def __str__(self):
        return self.title


class CapturedImages(models.Model):
    name = models.CharField(max_length=255)
    date_time = models.DateTimeField()
    seen = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class Log(models.Model):
    date_time = models.DateTimeField()
    event = models.CharField(max_length=50)
    # condition TODO: Find out what this is

    def __str__(self):
        return self.event + ' @ ' + str(self.date_time)
