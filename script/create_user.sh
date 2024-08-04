#!/bin/bash

# Keycloak 서버 정보
KEYCLOAK_SERVER="http://host.docker.internal:18080"
REALM_NAME="myrealm"
ADMIN_USERNAME="admin"
ADMIN_PASSWORD="admin"

# 사용자 정보 (스크립트 인자로 받음)
USERNAME=$1
PASSWORD=$2

# 스크립트 사용법 확인
if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Usage: $0 <username> <password>"
  exit 1
fi

# Docker 컨테이너 이름
CONTAINER_NAME="keycloak"

# Keycloak 로그인
docker exec -it $CONTAINER_NAME /opt/keycloak/bin/kcadm.sh config credentials --server $KEYCLOAK_SERVER --realm master --user $ADMIN_USERNAME --password $ADMIN_PASSWORD

# 사용자 생성
docker exec -it $CONTAINER_NAME /opt/keycloak/bin/kcadm.sh create users -r $REALM_NAME -s username=$USERNAME -s enabled=true
# 사용자 비밀번호 설정
docker exec -it $CONTAINER_NAME /opt/keycloak/bin/kcadm.sh set-password -r $REALM_NAME --username $USERNAME --new-password $PASSWORD --temporary
echo "User $USERNAME created and password set."
