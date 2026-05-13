# AI Lab status

## Huidige MVP

Het AI Lab draait online als technische proof-of-concept.

Publieke URL:
- https://ai.the101game.io

Serverpad:
- /srv/the101game/apps/ai-lab

GitHub repo:
- https://github.com/meneer-van-informatica/the101game-ai-lab

## Componenten

- OpenWebUI draait in Docker
- Ollama draait op de host
- Plesk verzorgt HTTPS en reverse proxy
- OpenWebUI luistert lokaal op 127.0.0.1:3000
- Ollama luistert veilig op de Docker-gateway 172.17.0.1:11434

## Modellen

Geinstalleerd:
- qwen3:0.6b
- qwen3:4b

## Conclusie snelheid

qwen3:4b is te traag op deze VPS zonder GPU.

Gemeten:
- korte chat: ongeveer 17 seconden
- langere chat: meer dan 2 minuten
- compute: CPU
- GPU offload: 0 lagen

qwen3:0.6b is bruikbaar voor een snelle technische demo.

Gemeten:
- simpele generate: ongeveer 2,5 seconden

## Gebruik nu

Geschikt voor:
- technische demo
- OpenWebUI testen
- Ollama koppeling testen
- proof-of-concept voor lokale AI

Nog niet geschikt voor:
- klasgebruik
- natuurkunde-coach voor leerlingen
- fotoanalyse
- meerdere gelijktijdige gebruikers
- zware didactische redenering

## Volgende stap

De huidige VPS gebruiken als frontend en regieserver.

Voor serieuze AI-inferentie is later nodig:
- GPU-server
- externe modelbackend
- of een hybride opzet
