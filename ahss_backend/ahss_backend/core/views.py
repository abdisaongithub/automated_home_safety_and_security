import json

from django.http import HttpResponse
from rest_framework import viewsets, permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import UpdateAPIView, CreateAPIView, RetrieveAPIView, ListAPIView
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import User
from .serializers import UserSerializer, ObtainTokenSerializer


# TODO: change this class to RetrieveApiView
class UserRetrieveApiView(ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.IsAuthenticated,)


class SingleUserView(RetrieveAPIView):
    # queryser = User.objects.
    pass


def singleUserView(request, ):
    if request.user:
        return request.user
    return Response(data=json.dumps({'error': 'error', 'message': 'Unauthorized'}, ),
                    status=status.HTTP_401_UNAUTHORIZED, )


class ObtainTokenView(TokenObtainPairView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = ObtainTokenSerializer


class UserCreateView(APIView):
    permission_classes = (permissions.AllowAny,)
    authentication_classes = ()

    def post(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                json = serializer.data
                return Response(json, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response({'Error': 'Bad Request'}, status=status.HTTP_400_BAD_REQUEST)


class UserChangePasswordAPIView(UpdateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    permission_classes = (permissions.IsAuthenticated,)
