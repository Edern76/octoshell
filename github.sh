#!/bin/bash

download()
{
git init .
git remote add -t \* -f origin https://github.com/Edern76/Memor-I.git
git checkout master
setPersistentCredentials
askAccountInfo
}

setPersistentCredentials()
{
git config --global credential.helper "cache --timeout=7200"

}

askAccountInfo()
{
read -p "Veuillez entrer l'adresse email de votre compte GitHub : " mailAddr
git config --global user.email "$mailAddr"
read -p "Veuillez entrer le pseudo de votre compte GitHub : " pseud
git config --global user.name "$pseud"
}
getLatestChanges()
{
git pull
echo 'Pull reussi'
}

commitChanges()
{
read -p 'Veuillez entrer un court message decrivant vos modifications : ' message
git add --all
git commit -m "$message"
git add --all
}

doPush()
{
git remote -v
git checkout master
git push origin HEAD:master
echo 'Push reussi'
}

synchronize()
{
doPush
getLatestChanges
}

sendChanges()
{
commitChanges
synchronize
}

setPersistentCredentials
echo 'Interface GitHub de la mort qui tue, par Gawein LE GOFF'
echo 'Veuillez effectuer votre choix en tapant le nombre correspondant. Pour quitter le programme appuyez sur CTRL+C'
echo ''
echo "L'usage des commandes précédées de la mention AVANCE est déconseillé, les commandes de base devraient suffire à vos besoins. Si le programme râle à cause d'un conflit, appelez OSKUUUUR dans la salle ou sur la convo Facebook."
echo ''

echo "Si c'est la première fois que vous utilisez cette interface génialissime sur ce compte INSA (ou ordinateur si vous êtes chez vous), veuillez commencer par sélectionner l'option permettant de télécharger la base du projet (la première)"


select choix in "Telecharger la base du projet (à faire une seule fois par ordinateur/compte)" "Obtenir les modifications du projet (à faire à chaque fois que vous commencez à travailler sur le projet)" "Confirmer et envoyer vos modifications (à faire quand vous avez fini d'implémenter un truc et que ça marche à peu près)" "Synchroniser le projet" "AVANCE : Seulement confirmer les modifications effectuées" "AVANCE : Réactiver le système de cache des identifiants GitHub" "AVANCE : Afficher le statut du repository git"; do

case $REPLY in 
	1) download;;
	2) getLatestChanges;;
	3) sendChanges;;
	4) synchronize;;
	5) commitChanges;;
	6) setPersistentCredentials;;
	7) git status;;
esac
done


