# Troubleshooting Live

## DIOX risponde ancora con template vecchio
- Verifica che il prompt sia stato salvato in console.
- Riavvia sessione agente/dispositivo.
- Cancella memoria breve e ritesta.

## MCP endpoint offline
- Controlla bridge avviato (`docker compose ps`).
- Verifica endpoint URL e token correnti.
- Premi refresh stato endpoint in console.

## Brave API key mancante
- Inserisci key nel runtime del bridge, non nel repo.
- Riavvia servizio MCP Brave.

## Tool non visibile in XiaoZhi
- Verifica che tool sia registrato nel bridge.
- Controlla policy allowlist e mapping endpoint.

## Risposte troppo lunghe
- Verifica prompt principale e short profile.
- Riduci verbosity modello o imposta output conciso.

## Modello troppo lento
- Prova modello piu rapido in console.
- Riduci numero tool attivi e passaggi superflui.

## Ricerca internet non parte
- Verifica tool Brave/Fetch abilitati e raggiungibili.
- Testa query con dato chiaramente recente.

## Memoria contaminata
- Cancella memoria agente.
- Mantieni short-term finche prompt/modello non sono stabili.

## Workflow GitHub fallito
- Apri run logs e individua step in errore.
- Esegui localmente `bash -n diox/scripts/*.sh` e validator.
