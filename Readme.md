# BDD Nix

Ce projet à pour objectif de réunir les différents scripts de base de données lié aux projets :
  - Josix (Bot Discord)
  - Monix (Gestion des soldes)

Il permet également, via docker, de fournir un environnement de développement aux équipes travaillant sur ces projets

## Utilisation du docker

Il faut commencer par installer docker à cette adresse : https://docs.docker.com/engine/install/  
Puis faire de même avec Docker Compose : https://docs.docker.com/compose/install/  

Une fois cela fait, il suffit d'avoir un terminal ouvert à la racine du projet et taper la commande `docker-compose up` (il est possible de lancer en mode arrière plan via l'option `-d`).

Une fois les conteneurs lancés, il est possible de voir l'interface adminer à cette adresse: http://localhost:8080/ (permet de voir les données de manière visuelle).  
Les paramètres de connexion sont : 
 - **Système:** PostgreSQL
 - **Serveur:** db (si on essaie de se connecter depuis l'extérieur, l'adresse sera `localhost` ou `127.0.0.1`) 
 - **schemas**: josix, monix

Il est également possible de se connecter via un client externe tel que DBeaver, psql, etc. en utilisant le port 3306 et l'adresse localhost

## Pré-requis
Ajouter dans le dossier un fichier `.env` contenant les valeurs suivantes : 

```
USER = your_user_here
PSSWD = your_password_here 
DB = database_name
IP_AD = ip_adminer
IP_POST = ip_postgre
SUBNET = ip_subnet
GATEWAY = ip_gateway
NETWORK = network_name
DRIVER = driver_name
PARENT = parent_name
```

### Quelques commandes utiles

Docker gère les données de ses conteneurs dans des "Volumes", il peut être parfois intéréssant de faire des actions dessus.

Par exemple: `docker volumes ls` permet de lister les volumes, `docker volume rm <VOLUME>` permet de le supprimer, etc.

Supprimer le volume de la base de données reviens à effacer les données de la bdd (et permet par conséquent de les re-créer au prochain `docker-compose up`)

Il peut être également utile de voir les conteneur entrain de tourner (`docker-compose ps`), les kill (`docker-compose kill`) ou autre.
