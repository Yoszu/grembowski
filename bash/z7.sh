#!/bin/bash

x=1

#FUNKCJE inaczej podprogramy

function moja() {

    echo "Hello World"

}

while [ $x -le 10 ]; do

    moja 
    x=$[x + 1]

done

#wyrazenia arytmetyczne

x=$(( 2+2))
echo $[x+3]

y=5
z=10
let mnozenie=${y}*${z}

echo ${mnozenie}

# + : dodawanie
# - : odejmowane
# * : mnozenie
# / : dzielenie
# % : reszta z dzielenia
