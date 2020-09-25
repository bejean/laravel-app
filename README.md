# Initialisation d'une application Laravel dockerisée

<project_root> -> le répertoire de travail du projet  
<nom_de_mon_projet> -> le petit nom du projet  
<mon_compte> -> votre login


## Cloner le repo et retirer remote origin
    cd <project_root>
    git clone https://github.com/bejean/laravel-app.git
    git remote remove origin


## Ajouter des services à la stack Docker (optionnel)
Editer "docker-compose-extra.yml"


## Configuration stack Docker
Editer le fichier .env de docker-compose pour : 
* donner un vrai nom au projet ("foo" par defaut) 
* definir le port d'acces http (80 par defaut) 


## Activer et/ou ajouter des scrips d'intialisation de packages
Dans le répertoire "/<project_root>/laravel-app/src/docker/laravel-app/init-scripts"  


## Démarrer les containers
    cd /<project_root>/laravel-app/src/docker
    docker-compose up -d --build

ou  

    docker-compose -f docker-compose.yml -f extra/docker-compose-extra.yml up -d --build
  
Après démarrage de la stack  

    $ docker ps
    CONTAINER ID    IMAGE              COMMAND                   CREATED          STATUS          PORTS                 NAMES
    1ee03a83bc60    foo_laravel-app    "docker-php-entrypoi…"    5 minutes ago    Up 5 minutes    0.0.0.0:88->80/tcp    <nom_de_mon_projet>_laravel_app


## Configuration de l'application Laravel
Mettre à jour le fichier "/<project_root>/laravel-app/src/<repertoire_au_nom_de_mon_projet>/.env" de l'application laravel


## Accéder à l'application
    http://localhost/


## Ajouter une page phpinfo à l'application (optionnel)

Ajouter dans "/<project_root>/laravel-app/src/<repertoire_au_nom_de_mon_projet>/routes/web.php"  

    Route::get('/phpinfo', function () {
        return view('phpinfo');
    });

Créer un fichier "/<project_root>/laravel-app/src/<repertoire_au_nom_de_mon_projet>/resources/views/phpinfo.php"  

    <?php
    phpinfo();

Accéder à la page  

    http://localhost/phpinfo


## Configurer l'IDE de développement

* Les sources sont accessibles localement en edition dans le répertoire "src/<nom_de_mon_projet>" 
* xdebug est installé et utilise le port 9001  
* le mapping xdebug  
![mapping xdebug](PHPStorm-Xdebug.png?raw=true)


## Mise à jour version mineur de Laravel dans le container "laravel-app"

Mettre à jour au besoin le fichier "/<project_root>/laravel-app/src/<repertoire_au_nom_de_mon_projet>/compose.json" (ajout de dépendances).    
Se logguer dans le container et lancer la mise à jour  

    cd /<project_root>/laravel-app/src/docker
    ./de.sh -c <nom_de_mon_projet>_laravel-app _u <mon_compte>
    root@0759bda3a636:/var/www/foo# compose update
    root@0759bda3a636:/var/www/foo# exit