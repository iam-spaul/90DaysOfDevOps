#!/bin/bash


<<info


this script is checking for the user managemnt system like ,user creation deletion
info


function user_creation (){


read -p "enter username that you want to create :" username

#check if user already exist or not
check_user=$( cat /etc/passwd | grep $username | wc | awk '{print $1}' )

if [ $check_user != 0 ];
then 
     echo "user exist"
else 
     read -p "enter your password" password
     sudo useradd -s /bin/bash -m $username
     #create password for user
     echo -e "$password\n$password" | sudo passwd "$username"

     echo "user created copleted"
fi

}

# ===============here user delete functiom================

#user_creation

function user_delete(){

read -p "enter username which you want :" username
check_user=$( cat /etc/passwd | grep $username | wc | awk '{print $1}' )
if [ $check_user != 0 ];
then
     sudo userdel $username
     echo "====User deleted===="

else
     echo "User not Exist"
     exit 1
    
fi
    
}

#user password reset



# Reset Password

function reset_password(){

read -p "enter username for resting password :" username

check_user=$( cat /etc/passwd | grep $username | wc | awk '{print $1}' )


if [ $check_user == 0 ];
then 
     echo "User Not Present"
     exit 1
fi

read -p "Enter password for Reset :" password

echo -e "$password\n$password" | sudo passwd "$username"


}

# List All User
#
list_users() {
    echo "📜 List of User Accounts (Username - UID):"
    awk -F: '{ if ($3 >= 1000 && $3 != 65534) print $1, "-", $3 }' /etc/passwd
}

#help
#
show_help() {
    echo "🔹 Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -c, --create     Create a new user account"
    echo "  -d, --delete     Delete an existing user account"
    echo "  -r, --reset      Reset a user's password"
    echo "  -l, --list       List all user accounts with their UIDs"
    echo "  -h, --help       Show this help message"
    exit 0
}



if [[ $1 == "--c" || $1 == "--create" ]];
then
	user_creation

elif [[ $1 == "--r" || $1 == "--reset" ]]; then
	reset_password
elif [[ $1 == "--l" || $1 == "--list" ]]; then
        list_users

elif [[ $1 == "--d" || $1 == "--delete" ]]; then
        user_delete

elif [[ $1 == "--h" || $1 == "--help" ]]; then
        show_help
fi






