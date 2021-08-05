from django.urls import path
from .views import UserRetrieveApiView

urlpatterns = [
    path('', UserRetrieveApiView.as_view(), name='retrieve_user'),
    # path('<int:pk>/', views.singleUserView),
]
