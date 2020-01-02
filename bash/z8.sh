#!/bin/bash

#definicja funkcji
function f1() {
    echo -n "Podaj nazwę użytkownika: "
    read username
}
function f2() {
    echo -n ""
}
function f3() {
    echo -n "Podaj nazwę użytkownika"
}
#menu skryptu
select opcja in f1 f2 f3 Quit
do
    case ${opcja} in
	"f1") echo "f1" ;;
	"f1") echo "f1" ;;
	"f2") echo "f2" ;;
	"f3") echo "f3" ;;
	"Quit") exit 0 ;;
    esac
done
