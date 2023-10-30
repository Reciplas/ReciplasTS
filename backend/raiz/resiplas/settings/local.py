#configuraciones del proyecto que son necesarias para ejecutarlas de forma local
#aca van las configuraciones de fase de desarrollo

from .base import * #esto me importa del archivo base toda la configuracion para el DATABASE

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-$jt2sgn#neuzjma-+a-u85e+-fhiia+4dj^(8kq8q00n6x0_4!'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    # hay que instalar la liberia pip install psycopg2-binary pro consola
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'api',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}