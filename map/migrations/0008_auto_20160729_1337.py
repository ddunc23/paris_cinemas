# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0007_theme_theme_type'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cinema',
            name='barrabas',
        ),
        migrations.RemoveField(
            model_name='cinema',
            name='les_deux',
        ),
        migrations.RemoveField(
            model_name='cinema',
            name='meetings',
        ),
        migrations.AddField(
            model_name='cinema',
            name='body',
            field=ckeditor_uploader.fields.RichTextUploadingField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='theme',
            name='body',
            field=ckeditor_uploader.fields.RichTextUploadingField(null=True, blank=True),
        ),
    ]
