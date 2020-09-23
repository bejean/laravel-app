# Initialisation d'une application Laravel dockerisée


## Cloner le repo et retirer remote origin
    git clone https://github.com/bejean/laravel-app.git
    git remote remove origin


## Clompléter la structure de répertoires le repo
    cd laravel-app/src
    mkdir laravel-app


## Démarrer les containers
    cd docker
    docker-compose up -d --build


## Créer une application
    ./de.sh -c laravel-app
    cd  /var/www/html
    laravel new myapp
    mv myapp/* .
    mv myapp/.* .
    rmdir myapp
    exit


## Modifier propriétaire et droits des sources
    cd ..
    sudo chown -R dom: laravel-app
    sudo chmod -R go+r laravel-app


## Mettre à jour le fichier laravel-app/.env de l'application laravel


## Accéder à l'application
    http://localhost:88/



