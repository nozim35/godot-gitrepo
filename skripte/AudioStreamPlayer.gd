extends AudioStreamPlayer

@export var audio_file: String = "res://pixel-party-218705.mp3"  # Pfad zur Audiodatei anpassen

func _ready():
	# Lade das Audio-Stream
	var audio_stream: AudioStream = load(audio_file)
	if audio_stream and audio_stream is AudioStream:
		audio_stream.loop = true  # Aktiviert die Schleife

		# Setze den Audio-Stream des AudioStreamPlayers
		stream = audio_stream

		# Starte die Wiedergabe
		play()
	else:
		print("Fehler: Konnte Audio-Stream nicht laden.")
