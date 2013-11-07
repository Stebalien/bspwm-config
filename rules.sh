#!/bin/bash

case "$(xwinfo -i $1)" in
    pithos)
        #echo "desktop=$([[ $(bspc query -M | wc -l) -gt 1 ]] && echo '^1' || echo 'next.free')" ;;
        echo "desktop=1/Ten" ;;
    mpv|keepassx)
        echo "floating=on" ;;
    dropterm|crx_nckgahadagoaajjgafhacjanaoiihapd)
        echo "floating=on sticky=on" ;;
esac
