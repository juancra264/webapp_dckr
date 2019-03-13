Containerize This: Apache-PHP and mariaDB
===================================

### Intro
Webapp using docker container one for Apache-PHP and other with MariaDB service.

Project Structure:

```
webapp_dckr
├── apache
├── mariaDB
├── public_html
├── sql
└── webapp
    ├── css
    │   └── dataTables
    ├── fonts
    ├── js
    │   ├── dataTables
    │   └── flot
    └── pages

12 directories
```

Once this structure is replicated or cloned with these structure and Docker installed locally, 
you can simply run "docker-compose up" 

### Docker Compose 
Running the compose:
```    
 docker-compose up       (for debug)
 docker-compose up -d    (Dettached from console)
```

Checking the status:  (see what is currently running)
```
 docker-compose ps
```

Stopping compose:
```
 docker-compose stop
```
