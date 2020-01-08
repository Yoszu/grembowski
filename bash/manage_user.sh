#!/bin/bash

function loadUsers() {
    echo "LoadUsers ..."
}
function showUsers() {
    echo "ShowUsers ..."
}
function addUsers() {
    echo "AddUsers ..."
}
function delUsers() {
    echo "DelUsers ..."
}
function acceptRemoteLogin() {
    echo "AcceptRemoteLogin ..."
}
function deniedRemoteLogin() {
    echo "DeniedRemoteLogin ..."
function help() {
cat << EndOfMessage
    Opis opcji skrytpu
    LU - ładowanie użytkownikó z pliku
    Su duddd
EndOfMessage
}
}
function quit() {
    exit 0
}

#menu
select option in LU SU AU DU ARL DRL HELP QUIT
do
    case ${option} in
      "LU") loadUsers ;;
      "SU") showUsers ;;
      "AU") addUsers ;;
      "DU") delUsers ;;
     "ARL") acceptRemoteLogin ;;
     "DRL") deniedRemoteLogin ;;
    "HELP") help ;;
    "QUIT") quit ;;
         *) help
    esac
done