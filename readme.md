Todo-backend reference client
=============================

This is a todo app which uses the todo-backend API to store it's todos. 

Provenance
=============================
This app is a slightly-modified version of the [TodoMVC Architecture Example for for backbone.js](https://github.com/tastejs/todomvc/tree/gh-pages/architecture-examples/backbone/js).

Pre-requisites
==============
The following are necessary to run the application:

- Docker Toolbox 1.9, with Docker-machine and Docker-compose
- Node.js (4.x or 5.x recommended)

Building the container
======================

In order to build the container, first install the needed NPM dependencies for the Node.js backend:

```
npm install
```

Then, create a Docker node with docker-machine:

```
docker-machine create -d virtualbox dev
eval $(docker-machine env dev)

Finally, build the container:

```
docker build -t client .
```

Running the container
=====================
Use the following command:

```
docker run -d client
```

Developing the application
==========================
TODO

TODO
====
- Describe the development process, possibly including a compose file to support local development
- Document the components that are part of this container, and how they are used (nginx, consul-template, etc)