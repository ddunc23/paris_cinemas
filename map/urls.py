from django.conf.urls import include, url
import views

urlpatterns = [
    # Map
    url(r'^$', views.map, name='map'),
    # API
    url(r'^api/cinemas/$', views.cinemas, name='cinemas'),
]