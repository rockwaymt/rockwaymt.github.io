#!/bin/bash
if [ $# -lt 1 ] ; then
	curl -A 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' https://fonts.googleapis.com/css?family=Open+Sans:400italic,800italic,400,300,600,700,800 > css.txt
	curl -A 'Mozilla/5.0 (X11; Linux x86_64; rv:67.0) Gecko/201' https://fonts.googleapis.com/css?family=Open+Sans:400italic,800italic,400,300,600,700,800 >> css.txt
	curl -A 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' https://fonts.googleapis.com/css?family=Courgette >> css.txt
	curl -A 'Mozilla/5.0 (X11; Linux x86_64; rv:67.0) Gecko/201' https://fonts.googleapis.com/css?family=Courgette >> css.txt
	cat css.txt | grep url | sed 's/.*OpenSans-/OpenSans-/; s/.*Courgette-/Courgette-/; s/[)] format.*// ; s/.[)], url[(]/ /' | awk '{print $2 " " $1}' | xargs -l1 $0 
fi
filename=${1##*/}
echo $1 $2 Filename $filename
ext=${filename##*.}
if [ ! -f $2.$ext ] ; then
	echo Rename $1 $filename to $2.$ext
	wget $1
	mv $filename $2.$ext
fi
sed -i "s/$filename/$2.$ext/g" fonts.css
