#!/bin/bash
readarray -t PROPS < <(xwinfo -its $1)

INST=${PROPS[0]}
TYPE=${PROPS[1]}
STATE=(${PROPS[2]})

RULE=()

case "$TYPE" in
    dock|desktop|notification)  RULE+=("manage=off")    ;;
    toolbar|utility)            RULE+=("focus=off")     ;;
    desktop)                    RULE+=("lower=on")      ;;
esac

for s in $STATE; do
    case $s in
        sticky)                 RULE+=("sticky=on")     ;;
        fullscreen)             RULE+=("fullscreen=on") ;;
        modal)                  RULE+=("floating=on") ;;
    esac
done

case "$INST" in
    pithos)
        #RULE+=("desktop=$([[ $(bspc query -M | wc -l) -gt 1 ]] && echo '^1' || echo 'next.free')") ;;
        RULE+=("desktop=1/Ten") ;;
    mpv|keepassx)
        RULE+=("floating=on") ;;
    dropterm|crx_nckgahadagoaajjgafhacjanaoiihapd)
        RULE+=("floating=on sticky=on") ;;
esac

echo "${RULE[*]}"
