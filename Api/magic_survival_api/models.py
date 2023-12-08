from django.db import models


# Create your models here.

class Dialogue(models.Model):
    name = models.CharField(max_length=30)
    message = models.CharField(max_length=2200)

    def __str__(self):
        return self.name

    def to_json(self):
        return {"name": self.name, "message": self.message}


class Player(models.Model):
    hp = models.IntegerField()

    def __str__(self):
        return "Player_hp"

    def to_json(self):
        return {"hp": self.hp}