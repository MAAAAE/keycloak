# keycloak

- Identity Provider (IdP) open source project


## how to start


### 1. run docker compose separately
```shell
docker compose -f docker-compose-local.yml up -d --build
```

## 2. run create_user.sh script

```shell
cd script
./create_user.sh <username> <password>
```

- if you try to login with created username and password, keycloak will force you to change temporary password
- If the script does not run correctly, please ensure that the Docker container name is "keycloak".




## 3. how to test login feature

1. http://localhost:18080/realms/myrealm/account

