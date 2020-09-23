# Initialisation d'une application Laravel dockerisée

<project_root> -> le répertoire de travail du projet  
<nom_de_mon_projet> -> le petit nom du projet  
<mon_compte> -> votre login


## Cloner le repo et retirer remote origin
    cd <project_root>
    git clone https://github.com/bejean/laravel-app.git
    git remote remove origin


## Configuration stack docker-compose
Editer le fichier .env de docker-compose pour donner un vrai nom au projet ("foo" par defaut)


## Démarrer les containers
    cd /<project_root>/laravel-app/src/docker
    docker-compose up -d --build

    $ docker ps
    CONTAINER ID    IMAGE              COMMAND                   CREATED          STATUS          PORTS                 NAMES
    1ee03a83bc60    foo_laravel-app    "docker-php-entrypoi…"    5 minutes ago    Up 5 minutes    0.0.0.0:88->80/tcp    <nom_de_mon_projet>_laravel_app


## Créer une application dans le container "laravel-app"
    cd /<project_root>/laravel-app/src/docker
    ./de.sh -c <nom_de_mon_projet>_laravel-app
    cd  /var/www/html
    laravel new myapp
    mv myapp/* .
    mv myapp/.* .
    rmdir myapp
    exit


## Modifier propriétaire et droits des sources
    cd /<project_root>/laravel-app/src
    sudo chown -R <mon_compte>: <repertoire_au_nom_de_mon_projet>
    sudo chmod -R go+r <repertoire_au_nom_de_mon_projet>


## Configuration de l'application Laravel
Mettre à jour le fichier /<project_root>/laravel-app/src/<repertoire_au_nom_de_mon_projet>/.env de l'application laravel


## Accéder à l'application
    http://localhost:88/



