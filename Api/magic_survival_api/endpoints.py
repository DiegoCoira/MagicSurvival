import json

from django.http import JsonResponse, HttpResponse, HttpResponseBadRequest, HttpResponseNotFound
from django.shortcuts import get_object_or_404
from django.views.decorators.csrf import csrf_exempt

from .models import Dialogue, Player


@csrf_exempt
def change_player_hp(request, ):
    if request.method == 'POST':
        try:
            body_json = json.loads(request.body)
            jugador = get_object_or_404(Player, id=1)

            jugador.hp == int(body_json.get('new_hp_value', 0))

            jugador.save()
            response_data = {'nueva_hp': jugador.hp}
            return JsonResponse(response_data, status=200)
        except Player.DoesNotExist:
            JsonResponse({'error': 'PlayerNotFound'}, status=404)
    elif request.method == 'GET':
        try:
            jugador = get_object_or_404(Player, id=1)
            hp_actual = jugador.hp

            # Crear un diccionario con la salud actual del jugador
            response_data = {'hp_actual': hp_actual}

            return JsonResponse(response_data, status=200)
        except Player.DoesNotExist:
            JsonResponse({'error': 'PlayerNotFound'}, status=404)
    else:
        return JsonResponse({'error': 'Unsupported HTTP method'}, status=405)


def get_dialogues(request):
    if request.method == 'GET':
        try:
            dialogues = Dialogue.objects.all()
            response_data = [dialogue.to_json() for dialogue in dialogues]
            return JsonResponse(response_data, status=200, safe=False)
        except Player.DoesNotExist:
            JsonResponse({'error': 'PlayerNotFound'}, status=404)
    else:
        return JsonResponse({'error': 'Unsupported HTTP method'}, status=405)
