#!/bin/bash

#bash install/install.sh
if [[ $? -ne 0 ]]; then
	exit 0
fi


#import des configs et fonctions
source config.sh
source fonction.sh


#echo $serveur
echo -e "\033[35mBienvenue dans \033[35m"
afficheTitre "MyGest IOn ' R"
quitter=1
while [[ $quitter -ne 0 ]]
do
echo ""
afficheTitre "Menu principal"
echo ""
echo -e "\033[40mBienvenue $nom \033[0m"
echo -e "\033[33m1) Gestion du parc \033[0m"
echo -e "\033[32m2) Outils reseau \033[0m"
echo -e "\033[31m0) Quitter \033[0m"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		bash gestParc/menuParc.sh
		;;
	2 )
		bash outilsRx/menuOutils.sh
		;;
	0 )
		quitter=0
                echo -e "\033[34m ....\033[34m"
		afficheTitre "Au revoir"
                echo -e "\033[34m ....\033[0m"
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done
