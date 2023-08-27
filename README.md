
## NOBI - DevOps Techincal-test

Deploy simple "hello-world" nodejs apps on docker swarm on AWS EC2 Instance (t2.micro)

### server env

- EC2 instance-a [54.87.157.121]
- EC2 instance-b [3.89.147.193]


### deploy step
- Provision 2 EC2 instance
- Create new github project
- Install Docker Engine

- Init docker swarm on instance-a
```bash
  docker swarm init
```
- Join swarm cluster on instance-b
```bash
  docker swarm join <TOKEN> address-intance-a:2377
```
- promote instance-b to swarm manager
```bash
  docker node promote instance-b
```

- list cluster nodes
```bash
  docker node ls
```

- Deploy local registry service on instance-a
```bash
  docker service create --name nobi-registry --publish published=5000,target=5000 registry
```

- Build docker image for nodejs on instance-a
```bash
  docker build . -t 127.0.0.1:5000/hello-nobi
```

- Push docker image to local registry
```bash
  docker image push 127.0.0.1:5000/hello-nobi
```

- Deploy nodejs app on instance-a
```bash
  docker stack deploy --compose-file docker-compose.yml hello-nobi
```

- Build docker image for nginx on instance-b
```bash
  docker build . -t 127.0.0.1:5000/nginx-proxy
```

- Push docker image to local registry
```bash
  docker image push 127.0.0.1:5000/nginx-proxy
```

- Deploy nodejs app on instance-a
```bash
  docker stack deploy --compose-file docker-compose.yml nginx-proxy
```

- list deployed stacks and serivces
```bash
  docker stack ls
```
```bash
  docker service ls
```


