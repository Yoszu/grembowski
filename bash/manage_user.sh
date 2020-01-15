
#!/bin/bash


#zmienna globalna
#ładowanie danych z pliku
user_list=(`cat users.txt`)

function showUsers() {
    echo "showUsers ..."
    for(( i=0; i<=${#user_list[@]}; i++ ))
    do
	echo "	${user_list[i]}"
    done
}

function addUsers() {
    echo "AddUsers ..."
    echo -n "Are you sure? [y/n] "
    read sure
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}"
	do
	    echo "Add user: ${user} [OK]"
	    sudo useradd  ${user} -s /sbin/nologin -g "users"
	done
    fi
}

function delUsers() {
    echo "DelUsers ..."
    echo -n "Are you sure? [y/n] "
    read sure
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}"
	do
	    echo "Remove user: ${user} [OK]"
	    sudo userdel ${user}
	done
    fi 
}

function acceptRemoteLogin() {
    echo "AcceptRemoteLogin ..."
}

function deniedRemoteLogin() {
    echo "DeniedRemoteLogin ..."
}

function help() {
cat << EndOfMessage
    Opis opcji skrytpu:
    .................................
    SU - listowanie użytkowników z pliku
    AU - dodawanie użytkowników

EndOfMessage
}

function quit() {
    exit 0
}

#menu
select option in SU AU DU ARL DRL HELP QUIT
do
    case ${option} in
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