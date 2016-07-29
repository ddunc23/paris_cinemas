from django import forms
from map.models import Theme, Cinema

class ThemeActionForm(forms.Form):
	themes = forms.ModelMultipleChoiceField(queryset=Theme.objects.all())

class CinemaForm(forms.ModelForm):
	class Meta:
		model = Cinema
		fields = ('name', 'other_name', 'open_date', 'date', 'o_address', 'c_address', 'arrondisement', 'postcode', 'short_description', 'themes', 'body', 'thumbnail')