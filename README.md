# keycloak
keycloak 임.


## 시작 방법

```shell
docker compose -f docker-compose-local.yml up -d --build
```

## Client secret 적용 방법

1. myrealm > Clients > `maaaae` 클릭
2. `Credentials` 탭 이동
3. Client secret > `Regenerate` 클릭
4. 복사 후 리소스서버의 client secret 환경 변수로 주입

