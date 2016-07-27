# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0006_auto_20160726_1413'),
    ]

    operations = [
        migrations.AddField(
            model_name='theme',
            name='theme_type',
            field=models.CharField(default='FILM', max_length=24, choices=[(b'FILM', b'Film')]),
            preserve_default=False,
        ),
    ]
