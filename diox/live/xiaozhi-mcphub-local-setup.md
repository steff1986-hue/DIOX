# Setup Locale MCP Bridge (Italiano)

Questa guida usa `xiaozhi-mcphub` o bridge equivalente.

## Prerequisiti
- Docker
- Docker Compose
- Node/npm solo se richiesto da specifici MCP server

## Passi base
1. Clona repository bridge MCP (esempio: `xiaozhi-mcphub`):
   - `git clone <REPO_URL_MCPHUB>`
2. Entra nella cartella del progetto bridge.
3. Avvia stack:
   - `docker compose up -d`
4. Apri UI admin locale (URL definito dal progetto, spesso localhost).
5. Cambia subito password amministratore di default.
6. Aggiungi endpoint MCP XiaoZhi (campo endpoint/agent connection).
7. Configura trasporto e routing secondo progetto bridge.
8. Abilita solo tool necessari (Brave, Fetch, Time) per fase iniziale.
9. Verifica stato connessione: endpoint deve risultare connected/healthy.

## Campo/label UI
Le etichette esatte possono variare tra versioni. Se nome campo non coincide, usa equivalenti funzionali:
- endpoint url
- transport type
- tool routing
- auth/settings
