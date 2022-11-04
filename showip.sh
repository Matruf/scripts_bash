#!/bin/bash

echo

ListeIP=$(ip -br -4 addr show | sed -r 's/ +/ /' | sed -r 's/\/.+//')

while IFS=' ' read -ra IPadr; do
    if [[ "${IPadr[0]}" == "lo" ]]; then continue; fi
    if [[ "${IPadr[1]}" =~ ^169\.254 ]]; then continue; fi
    echo "${IPadr[0]} : ${IPadr[1]}"
done <<< "$ListeIP"

echo
