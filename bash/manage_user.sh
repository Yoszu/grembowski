
#!/bin/bash


#zmienna globalna
#ładowanie danych z pliku
user_list=(`cat users.txt`)
status="FAIL"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\e[0m'

function checkStatusCode() {
    if [ $? == 0 ]; then
	status="${GREEN} [PASS] ${NC}"
    else
	status="${RED} [FAIL] ${NC}"
    fi
}

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
	    sudo useradd  ${user} -m -s /sbin/nologin -g "users" 2> /dev/null
	    checkStatusCode
	    #echo "Add user: ${user} [${status}]"
	    printf "Add user %13b %25b\n" "${user}" "${status}"
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
	    sudo userdel -r ${user} 2> /dev/null
	    checkStatusCode
	    #echo "Remove user: ${user} [${status}]"
	    printf "Delete user %13b %25b\n" "${user}" "${status}"
	done
    fi 
}

function acceptRemoteLogin() {
    echo "AcceptRemoteLogin ..."
    for user in "${user_list[@]}"
    do
	sudo usermod -s /bin/bash ${user} 2> /dev/null
	checkStatusCode
	#echo "Accept remote login for ${user} [${status}]"
	printf "Accept remote login for %13b %25b\n" "${user}" "${status}"
    done
}

function deniedRemoteLogin() {
    echo "DeniedRemoteLogin ..."
    for user in "${user_list[@]}"
    do
	sudo usermod -s /sbin/noLogin ${user} 2> /dev/null
	checkStatusCode
	#echo "Denied remote Login for ${user} [${status}]"
	printf "Denied remote login for %13b %25b\n" "${user}" "${status}"
    done
}

function help() {
cat << EndOfMessage
    Opis opcji skrytpu:
    .................................
    SU - listowanie użytkowników z pliku
    AU - dodawanie użytkowników
    DU - usuwanie użytkowników
    ARL -
    DRL -

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