#!/bin/bash
# Sauvegarde horodatee du projet, conserve les 5 dernieres archives.
PROJET="$HOME/IA_Project"
DEST="$PROJET/backup"
DATE=$(date '+%Y%m%d_%H%M%S')
ARCHIVE="$DEST/IA_Project_$DATE.tar.gz"

mkdir -p "$DEST"
tar -czf "$ARCHIVE" -C "$HOME" --exclude="IA_Project/backup" IA_Project

echo "[$(date '+%F %T')] Sauvegarde : $ARCHIVE ($(du -h "$ARCHIVE" | cut -f1))" \
    >> "$PROJET/scripts/backup.log"

# Rotation : ne garder que les 5 archives les plus recentes
ls -1t "$DEST"/IA_Project_*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm -f
