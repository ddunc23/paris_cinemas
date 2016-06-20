# Copy your secret key here and rename the file 'secret_settings.py'
# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'elk3z*@2z6e((q=5framwz!pypd!s8@$ih&!8dj=(^!u2^gzm+'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'paris_cinemas',
        'USER': 'paris_cinemas',
        'PASSWORD': 'cinemas',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}