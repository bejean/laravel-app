# Initialisation d'une application Laravel dockerisée


## Cloner le repo et retirer remote origin
    cd <project_root>
    git clone https://github.com/bejean/laravel-app.git
    git remote remove origin


## Compléter la structure de répertoires le repo
    cd /<project_root>/laravel-app/src
    mkdir laravel-app


## Démarrer les containers
    cd /<project_root>/laravel-app/src/docker
    docker-compose up -d --build


## Créer une application dans le container "laravel-app"
    cd /<project_root>/laravel-app/src/docker
    ./de.sh -c laravel-app
    cd  /var/www/html
    laravel new myapp
    mv myapp/* .
    mv myapp/.* .
    rmdir myapp
    exit


## Modifier propriétaire et droits des sources
    cd /<project_root>/laravel-app/src
    sudo chown -R dom: laravel-app
    sudo chmod -R go+r laravel-app


## Mettre à jour le fichier /<project_root>/laravel-app/src/laravel-app/.env de l'application laravel


## Accéder à l'application
    http://localhost:88/



