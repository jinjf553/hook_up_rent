from datetime import datetime, timedelta
from typing import Optional

import jwt
from config import ALGORITHM, SECRET_KEY
from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jwt.exceptions import PyJWKError, PyJWTError
from mysqlx import Session

from orm import DBSession, DBUser, WithSession, get_db

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/token")


# 生成token，带有过期时间
def create_access_token(data: dict, expires_delta: Optional[timedelta] = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


async def get_current_user(token: str = Depends(oauth2_scheme)):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
    except PyJWTError:
        username = None
    return username

if __name__ == "__main__":
    user = get_current_user('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0MiIsImV4cCI6MTY0ODUzNzM2MX0.s9bP6yOLg6msC2L0StsnjWEoujoxbWTU5OOBRrA4--0')
    print(user)
