from rest_framework import serializers
from .models import Settings, Videos, Notifications, CapturedImages, Log


class SettingsSerializer(serializers.ModelSerializer):
    # id = serializers.IntegerField(required=True)
    # name = serializers.CharField(max_length=255)
    # state = serializers.CharField(max_length=50)

    class Meta:
        model = Settings
        fields = '__all__'
        read_only_fields = ('id',)

    def create(self, validated_data):
        instance = self.Meta.model(**validated_data)
        instance.save()
        return instance

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.state = validated_data.get('state', instance.state)
        instance.save()

        return instance


class VideosSerializer(serializers.ModelSerializer):
    # name = serializers.CharField(max_length=255)
    # date_time = serializers.DateTimeField()
    # watched = serializers.BooleanField(default=False)

    class Meta:
        model = Videos
        fields = '__all__'
        read_only_fields = ('id', 'date_time', 'watched',)


class NotificationsSerializer(serializers.ModelSerializer):
    # title = serializers.CharField(max_length=255)
    # content = serializers.CharField()
    # datetime = serializers.DateTimeField()
    # seen = serializers.BooleanField()
    # link_to_video = serializers.CharField(max_length=255)

    class Meta:
        model = Notifications
        fields = '__all_'
        read_only_fields = ('id', 'title', 'content', 'datetime', 'seen', 'link_to_video')


class CapturedImagesSerializer(serializers.ModelSerializer):
    # name = serializers.CharField(max_length=255)
    # date_time = serializers.DateTimeField()
    # seen = serializers.BooleanField(default=False)

    class Meta:
        model = CapturedImages
        fields = '__all__'


class LogsSerializer(serializers.ModelSerializer):
    # date_time = serializers.DateTimeField()
    # event = serializers.CharField(max_length=50)

    class Meta:
        model = Log
        fields = '__all__'
