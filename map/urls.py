from django.conf.urls import include, url
import views

urlpatterns = [
    # Map
    url(r'^$', views.map, name='map'),
    url(r'^cinema/(?P<cinema>\d+)/$', views.cinema_page, name='cinema_page'),
    url(r'^letter/(?P<letter>\d+)/$', views.letter_page, name='letter_page'),
    url(r'^cinemas/all/$', views.all_cinemas, name='all_cinemas'),
    url(r'^letters/all/$', views.all_letters, name='all_letters'),
    # API
    url(r'^api/cinemas/$', views.cinemas, name='cinemas'),
    url(r'^api/cinema/(?P<cinema>\d+)/$', views.cinema, name='cinema'),
    url(r'^api/letters/$', views.letters, name='letters'),
]