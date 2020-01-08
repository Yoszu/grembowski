#!/bin/bash

#menu skryptu

#definicja funkcji

function f1() {
    echo -n "Podaj nazwę użytkownika: "
    read username
}

function f2() {
    echo "${username}"
}

function f3() {
    echo "f3 zostało uruchomione"
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
