#!/bin/bash

case "$3" in
    pithos)
        lastmon=$(bspc query -M | tail -1)
        echo "desktop=$( [[ $lastmon -gt 1 ]] && echo "$lastmon:^1" || echo 'next.free')" ;;
    mpv|keepassx)
        echo "floating=on" ;;
    display)
        echo "center=on floating=on focus=on sticky=on" ;;
    dropterm|crx_nckgahadagoaajjgafhacjanaoiihapd)
        echo "floating=on sticky=on" ;;
esac
