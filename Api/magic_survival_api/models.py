from django.db import models


# Create your models here.

class Dialogue(models.Model):
    name = models.CharField(max_length=30)
    mensaje = models.CharField(max_length=255)

    def __str__(self):
        return self.personaje


class Player(models.Model):
    hp = models.IntegerField(max_length=1)

    def __str__(self):
        return "Player_hp"
