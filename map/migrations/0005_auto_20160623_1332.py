# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0004_letter'),
    ]

    operations = [
        migrations.AlterField(
            model_name='letter',
            name='sex',
            field=models.CharField(blank=True, max_length=16, null=True, choices=[(b'MALE', b'Male'), (b'FEMALE', b'Female')]),
        ),
    ]
