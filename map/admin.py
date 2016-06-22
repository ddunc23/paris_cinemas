from django.contrib import admin
from map.models import Cinema
from leaflet.admin import LeafletGeoAdmin

# Register your models here.

class CinemaAdmin(LeafletGeoAdmin):
	model = Cinema

admin.site.register(Cinema, CinemaAdmin)
