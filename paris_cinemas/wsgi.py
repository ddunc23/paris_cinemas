"""
WSGI config for paris_cinemas project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

#os.environ.setdefault("DJANGO_SETTINGS_MODULE", "paris_cinemas.settings")

os.environ['DJANGO_SETTINGS_MODULE'] = 'paris_cinemas.settings.local'

application = get_wsgi_application()
