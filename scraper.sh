#!/usr/bin/bash

read -p "What would you like to pirate? " IME_TORENTA

URL="https://rarbg.unblockninja.com/search/?search="

for REC in $IME_TORENTA
	do
		URL=$URL$REC+
done

URL=${URL%?}
STRANICA=$(wget --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36 RuxitSynthetic/1.0 v9843529198 t38550 ath9b965f92 altpub cvcv=2' -O - $URL)

for LINE in $STRANICA
	do
		REZULTAT="$(echo $LINE | grep -Eo '/torrent/[a-zA-Z0-9#~.*,/!?=+&_%:-]*')"
		if [ ! -z $REZULTAT ]
			then
				echo https://rarbg.unblockninja.com/$REZULTAT
		fi
done