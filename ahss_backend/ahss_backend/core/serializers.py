from rest_framework import serializers
from rest_framework.authtoken.models import Token
from . import models
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


class SingleUserSerializer(serializers.Serializer):
    pass


class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required=True
    )
    password = serializers.CharField(min_length=8, write_only=True)
    name = serializers.CharField(required=False)
    id = serializers.IntegerField(required=False)

    class Meta:
        model = models.User
        fields = ('id', 'email', 'password', 'name',)
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)

        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance

    def update(self, instance, validated_data):
        instance.password = validated_data.get('password', instance.password)
        instance.set_password(instance.password)
        instance.save()
        return instance


class ObtainTokenSerializer(TokenObtainPairSerializer):

    @classmethod
    def get_token(cls, user):
        token = super(ObtainTokenSerializer, cls).get_token(user)
        print(token)
        return token

