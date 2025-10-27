# Port Checker 💻

## Descrizione
Questo script Bash permette di verificare se una porta TCP specifica è in uso su un sistema e, in caso affermativo, offre la possibilità di terminare il processo che la sta occupando.  
**Funziona solo su sistemi Unix e Unix-like (come macOS e Linux)**, dove è disponibile il comando `lsof` con le opzioni usate.

---

### 🚀 Utilizzo
Salva lo script in un file (es. `check_port.sh`).

* Rendi lo script eseguibile: ```chmod +x check_port.sh```
* Sostituisci `8080` con il numero di porta desiderato.

---

### 💡 Utilizzo
- **Validazione Input:** Controlla se viene fornito un numero di porta (`$1`).
- **Ricerca PID:** Utilizza `lsof` (liSt Open Files) con le opzioni:
  - `-t`: Restituisce solo il Process ID (PID).
  - `-iTCP:$PORT`: Filtra per la porta TCP specificata.
  - `-sTCP:LISTEN`: Assicura che venga trovato solo il processo in ascolto (non una connessione stabilita).
- **Terminazione:** Se viene trovato un PID, chiede conferma e usa `kill -9` per terminare il processo forzatamente (SIGKILL).
