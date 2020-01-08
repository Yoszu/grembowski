#!/bin/bash

#menu skryptu

#definicja funckji f1

function f1() {

    echo -n "Podaj nazwe uzytkownika: "
    read username
}

function f2() {
    echo "${username}"
}

function f3() {
    echo "f3 zostalo uruchomione"
}


select opcja in f1 f2 f3 Quit
do

    case ${opcja} in
	"f1") f1 ;;
        "f2") f2 ;;
	"f3") f3 ;;
	"Quit") exit 0 ;;
	*) echo "Podaj opcje z menu."
    esac

done
