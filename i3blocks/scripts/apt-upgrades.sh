#!/usr/bin/env bash

# FontAwesome refresh symbol, change if you do not want to install FontAwesome
PENDING_SYMBOL=${PENDING_SYMBOL:-"\uf021 "}

# By default, show both the symbol and the numbers
SYMBOL_ONLY=${SYMBOL_ONLY:-0}

# By default, show something when no upgrades are pending
ALWAYS_PRINT=${ALWAYS_PRINT:-1}

# Handle the options passed to the script
while getopts s:oNh opt; do
    case "$opt" in
        s) PENDING_SYMBOL="$OPTARG" ;;
        o) SYMBOL_ONLY=1 ;;
        N) ALWAYS_PRINT=0 ;;
        h) printf \
"Usage: apt-upgrades [-s pending_symbol] [-o] [-N] [-h]
Options:
-s\tSpecify a refresh symbol. Default: \"\\\\uf021 \"
-o\tShow refresh symbol only, but no numbers.
-N\tOnly display text if upgrade is pending.
-h\tShow this help text\n" && exit 0;;
    esac
done

# Get the list of upgradable packages
upgrade_count=$(apt list --upgradable 2>/dev/null | grep -c 'upgradable')

# Adjust the count (subtracting 1 for the header line)
if [[ $upgrade_count -gt 1 ]]; then
    upgrades=$((upgrade_count - 1))
else
    upgrades=0
fi

# If there are upgrades pending
if [[ $upgrades -gt 0 ]]; then
    if [[ $SYMBOL_ONLY == 1 ]]; then
        echo -e "$PENDING_SYMBOL"
        echo -e "$PENDING_SYMBOL"
    else
        echo -e "$PENDING_SYMBOL $upgrades upgrade(s)"
        echo -e "$PENDING_SYMBOL $upgrades upgrade(s)"
    fi
elif [[ $ALWAYS_PRINT == 1 ]]; then
    if [[ $SYMBOL_ONLY == 1 ]]; then
        echo -e "$PENDING_SYMBOL"
        echo -e "$PENDING_SYMBOL"
    else
        echo -e "$PENDING_SYMBOL 0 upgrades"
        echo -e "$PENDING_SYMBOL 0 upgrades"
    fi
fi
