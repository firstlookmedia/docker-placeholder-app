
## Docker Placeholder App

HTTP app intended to be used as a placeholder when spinning up an ECS cluster with `terraform`.

In our architecture, canonical task definitions live in the application repositories.

Using a placeholder app such as this in the `terraform` configs prevents duplication \
of that task def and provides clear indication that further setup needs to be done.

Published to Docker Hub here: [https://hub.docker.com/r/firstlookmedia/placeholder-app/](https://hub.docker.com/r/firstlookmedia/placeholder-app/)

## Build and Test

```
docker build -t firstlookmedia/placeholder-app .
```

```
docker run -ti --rm -p 80:80 \
  -e "PLACEHOLDER_APPNAME=YAMS" \
  firstlookmedia/placeholder-app
```

```
curl -Li http://127.0.0.1:80
```

## Index Template

The index page is generated by running `index.html.tmpl` through the `envsubst` command on startup.

Only environment variables of the form `PLACEHOLDER_*` will be passed to `envsubst`.

You can add variables to the template in the form `${PLACEHOLDER_MYVAR}` and then passing
them to docker runtime using `-e "PLACEHOLDER_MYVAR=awesome"` or


## Sample ECS Task Definition

```
[
    {
        "name": "yams",
        "image": "firstlookmedia/placeholder-app",
        "essential": true,
        "cpu" : 100,
        "memory": 512,
        "portMappings": [
            { "containerPort": 4242 }
        ],
        "environment" : [
            { "name" : "PLACEHOLDER_APPNAME", "value" : "Yet Another Micro Service" }
        ],
        "logConfiguration" : {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "ecs-yams",
                "awslogs-region": "us-east-1"
            }
        }
    }
]
```




