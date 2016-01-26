# B1i

## Build
```
docker build --no-cache=true -t b1i:poc .
```

## Run
```
docker run -d --name b1i \
 -e JAVA_OPTS="-Xms256m -Xmx2048m"
 -p 8080:8080 \
 b1i:poc
```
