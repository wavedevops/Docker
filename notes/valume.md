# Why Docker valumes
>> Container = Ephemeral (Temporary)
>
>> Volume = Persistent (Long-lasting)
>
>> ephemeral =  Temporary
>
>> Eternal = Permanent


* Containers are ephemeral, which means a container's writable filesystem is temporary.
* If the container is deleted, the data stored inside that writable layer is also deleted.

* Docker volumes allow us to store important data outside the container's writable layer, so the data can survive even when the container is removed.


# Docker valumes are two types: 

1. unnamed valume
2. Named valume

### Named Valumes:

* named valumes we use for store a data in docker container 

1. create a valume 

```bash
docker valume create nginx
```
2. to check list of valumes

```bash 
docker valume ls 
```

3. inspect the docker valule

```bash
docker inspect nginx 
```
4. crate container useing docker valume

```bash
docker run -d -p 80:80 -v nginx:/usr/share/nginx/html --name nginx nginx  
``` 
---
Sure. Here is a clean **Docker Compose notes format** with the **syntax + example** for each component.

### 1. `version`

> ⚠️ `version` is used in older Docker Compose files. In modern Docker Compose, it is obsolete and normally omitted.

**Syntax:**

```yaml
version: "3.8"
```

**Example:**

```yaml
version: "3.8"

services:
  nginx:
    image: nginx
```

---

### 2. `name`

Defines the **Docker Compose project name**.

**Syntax:**

```yaml
name: <project-name>
```

**Example:**

```yaml
name: myproject

services:
  nginx:
    image: nginx
```

This will make the Compose project name `myproject`.

---

### 3. `services`

Defines the **containers** that Docker Compose creates and runs.

**Syntax:**

```yaml
services:
  <service-name>:
    image: <image-name>
```

**Example:**

```yaml
services:
  nginx:
    image: nginx
    ports:
      - "80:80"
```

Here:

* `nginx` → service name
* `image: nginx` → Docker image
* `80:80` → host port : container port

---

### 4. `volumes`

Defines **persistent storage** for containers.

**Syntax:**

```yaml
volumes:
  <volume-name>:
```

Then attach it to a service:

```yaml
services:
  <service-name>:
    volumes:
      - <volume-name>:<container-path>
```

**Example:**

```yaml
services:
  nginx:
    image: nginx
    volumes:
      - nginx_data:/usr/share/nginx/html

volumes:
  nginx_data:
```

Here:

* `nginx_data` → Docker volume
* `/usr/share/nginx/html` → location inside the container

---

### 5. `networks`

Defines **custom networks** so containers can communicate with each other.

**Syntax:**

```yaml
networks:
  <network-name>:
```

Attach it to a service:

```yaml
services:
  <service-name>:
    networks:
      - <network-name>
```

**Example:**

```yaml
services:
  nginx:
    image: nginx
    networks:
      - mynetwork

networks:
  mynetwork:
```

---

## Complete Example

```yaml
name: myproject

services:
  nginx:
    image: nginx
    container_name: nginx
    ports:
      - "80:80"
    volumes:
      - nginx_data:/usr/share/nginx/html
    networks:
      - mynetwork

volumes:
  nginx_data:

networks:
  mynetwork:
```

### Easy way to remember

| Component  | Purpose                                                  |
| ---------- | -------------------------------------------------------- |
| `version`  | Compose file format — **old/obsolete in modern Compose** |
| `name`     | Project name                                             |
| `services` | Containers                                               |
| `volumes`  | Persistent storage                                       |
| `networks` | Container communication                                  |
