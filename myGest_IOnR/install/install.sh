#!/bin/bash

user=$(whoami)
if [[ $user != 'root' ]]; then
    echo "Vous devez être root pour continuer l'installation."
    exit 2
fi



echo "
+++++++++++++++++++++  Installation de myGest_IOnR  ++++++++++++++++++
"
read -p "Comment vous appelez-vous ? : " name
read -p "Installation sur client: 0; server: 1 : " mode
while [ $mode -ne 0 -a $mode -ne 1 ]; do
    echo "Saisie incorrecte."
    read -p "Installation sur client: 0; server: 1 : " mode
done

echo "
#!/bin/bash

#permet de determiner si le programme est sur un serveur (1) ou une machine (0). Utile pour IHM
serveur=$mode

#permet d'afficher le nom de l'utilisateur
nom="$name"" > config.sh
echo "
+++++++++++++++++++ Installation des Paquets ++++++++++++++++++++++++

"
apt update && apt install -y mariadb-server figlet 

if [[ $mode -eq 0 ]]; then
    apt install -y lolcat 
fi
echo "
++++++++++++++  Installation de la base de donnnées +++++++++++++++++

mysql -e "
CREATE DATABASE MyGest;
CREATE USER 'LinH'@'localhost';
GRANT ALL PRIVILEGES ON MyGest.* TO 'Gest'@'localhost';
FLUSH PRIVILEGES;
"
mysql -u LinH MyGest < install/myGestIOnR.sql

echo "
+++++++++++++++++++  Sauvegarde de l'installation +++++++++++++++++++

"
sed -i '/^bash/ c\#bash install/install.sh' myGestIOnR.sh