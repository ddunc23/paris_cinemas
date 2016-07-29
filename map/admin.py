from django.contrib import admin
from map.models import Cinema, Theme
from map.forms import ThemeActionForm, CinemaForm
from leaflet.admin import LeafletGeoAdmin
from django.contrib import messages
from django.shortcuts import render

class CinemaAdmin(LeafletGeoAdmin):
	model = Cinema
	form = CinemaForm
	actions = ['set_theme_action']
	filter_horizontal = ['themes']
	list_display = ('name', 'o_address', 'postcode', 'arrondisement', 'get_themes')
	list_editable = ('arrondisement',)
	search_fields = ('name',)

	def set_theme_action(self, request, queryset):
		if 'do_action' in request.POST:
			form = ThemeActionForm(request.POST)
			if form.is_valid():
				themes = form.cleaned_data['themes']
				for cinema in queryset:
					for theme in themes:
						cinema.themes.add(theme.id)
				updated = len(queryset)
				messages.success(request, '{0} cinemas were updated'.format(updated))
				return
		else:
			form = ThemeActionForm()

		return render(request, 'admin/map/action_theme.html', {'title': 'Choose Theme', 'objects': queryset, 'form': form})

	set_theme_action.short_description = 'Add a theme to selected cinemas'


class ThemeAdmin(admin.ModelAdmin):
	prepopulated_fields = {
		'slug': ('title',),
	}

admin.site.register(Cinema, CinemaAdmin)
admin.site.register(Theme, ThemeAdmin)