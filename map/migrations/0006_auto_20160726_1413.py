# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0005_auto_20160623_1332'),
    ]

    operations = [
        migrations.CreateModel(
            name='Theme',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=140)),
                ('slug', models.SlugField()),
                ('body', ckeditor_uploader.fields.RichTextUploadingField()),
            ],
        ),
        migrations.AddField(
            model_name='cinema',
            name='themes',
            field=models.ManyToManyField(to='map.Theme', blank=True),
        ),
        migrations.AddField(
            model_name='letter',
            name='themes',
            field=models.ManyToManyField(to='map.Theme', blank=True),
        ),
    ]
