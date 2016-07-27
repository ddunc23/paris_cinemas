from django import forms
from map.models import Theme, Cinema

class ThemeActionForm(forms.Form):
	themes = forms.ModelMultipleChoiceField(queryset=Theme.objects.all())