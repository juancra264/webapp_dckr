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

Once this structure is replicated or cloned with these structure and Docker installed locally, you can simply run "docker-compose up" 


### Docker Compose

This format has been around for a while in Dockerland and is now in version 3.6 at the time of this writing. We'll use 3.2 here to ensure broad compatibility with those who may not be running the latest and greatest versions of Docker (however, you should always upgrade!)

This format allows for defining sets of services which make up an entire application. It allows you to define the dependencies for those services, networks, volumes, etc as code and as you roll into production, you can even specify deployment parameters on services which allow you to replicate, scale, update, and self-heal on Docker Swarm or even Kubernetes on the latest Docker for Mac or Docker Enterprise Edition!
Containers at the core are simply process encapsulation within a shared Linux kernel, to allow for many processes to run inside of their own spaces without interfering or interacting unless we explicitly tell them they can. Thus, it is a long-running best practice to run your primary service within a container as PID 1. This means that no other process should be running inside of your containers. It allows containers to maintain a native linux process lifecycle, respect linux process signals, allow for greater security, and will make your life easier when you schedule these containers on orchestrators such as Docker Swarm or Kubernetes in production.

A perfect example is decoupling Apache and PHP by building them out into separate containers. We see our customers often starting to couple Apache and PHP together early on in a Docker journey by building custom images which include both Apache and PHP in the image. This easily works in development scenarios and is a fast way to get off the ground, but as we want to follow a more modern approach of decoupling, we want to break these apart.

The following simple Dockerfiles are what we're using in this example to build a decoupled Apache and PHP envivonment:

### Networking
Now that we have container images for Apache and PHP that are decoupled, how do we get these to interact with eachother? Notice we're using "PHP FPM" for this. We're going to have Apache proxy connections which require PHP rendering to port 9000 of our PHP container, and then have the PHP container serve those out as rendered HTML. Sound complicated? Don't worry! This is very common in modern applications, Apache and NGINX are very good at this proxying, and there is plenty of documentation out there to support this behavior!

Notice in the above Docker Compose example, we link the containers together with an overlay networks we define as "frontend" and "backend". By specifying these networks in our services, we can leverage some really cool Docker features! Namely, we can refer to the containers/services by their service names in code, so we don't have to worry about messy hard-coding of IP addresses anymore. Phew! Docker handles this for us by managing and updating /etc/hosts files within containers seamlessly to allow for this cross-talk. We can also enforce which containers can talk to eachother. This allows for more secure applications. Notice in this example we have "frontend" and "backend" defined. We can have our php and mysql services live in a network that is more restricted and not exposed to the outside world, and only expose our apache container on the required port. This is great for production environments!

One note: We need an apache vhost configuration file that is set up to proxy these requests for PHP files to the PHP container. You'll notice in the Dockerfile for Apache we have defined above, we add this file and then include it in the base httpd.conf file. This is for the proxying which allows for the decoupling of Apache and PHP. In this example we called it demo.apache.conf and we have the proxying modules defined as well as the VirtualHost. Also notice that we call the php container in the code "php" which, because of the /etc/hosts file integration that Docker handles for us, works flawlessly!
