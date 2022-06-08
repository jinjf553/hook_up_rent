import time
from datetime import timedelta
from random import choice
from typing import List, Optional

from fastapi import Depends, FastAPI, File, UploadFile
from fastapi.staticfiles import StaticFiles
from passlib.context import CryptContext
from pydantic import BaseModel
from sqlalchemy.orm import Session

from config import ACCESS_TOKEN_EXPIRE_MINUTES, HEADERS, STATIC_DIR
from orm import DBSession, DBUser
from utils import create_access_token, get_current_user

app = FastAPI()
''' 运行命令： uvicorn main:app --reload --host 0.0.0.0 --port 8000'''

app.mount("/static", StaticFiles(directory=STATIC_DIR), name="static")


class User(BaseModel):
    # id: int
    username: str
    password: str
    status: Optional[int] = 0
    description: Optional[str] = ''
    body: Optional[dict] = {'token': ''}

    class Config:
        orm_mode = True


class Houses(BaseModel):
    title: str
    description: str
    price: str
    size: str
    oriented: str
    roomType: str
    floor: str
    community: str
    houseImg: str
    supporting: str

    class Config:
        orm_mode = True


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/user/registered", response_model=User)
async def user_register(user: User, db: Session = Depends(DBSession)):
    # 密码加密
    password = CryptContext(schemes=["bcrypt"],
                            deprecated="auto").hash(user.password)
    db_user = DBUser(username=user.username, password=password)
    DBUser.add(db, db_user)
    db_user.status, db_user.description = 200, '注册陈功!'
    return db_user


@app.post("/user/login", response_model=User)
async def register(user: User, db: Session = Depends(DBSession)):
    db_user = DBUser.get_by_username(db, user.username)
    # 密码加密
    verify = CryptContext(schemes=["bcrypt"], deprecated="auto")
    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": user.username}, expires_delta=access_token_expires
    )
    if not db_user:
        db_user = User(username='', password='')
        db_user.status = 300
        db_user.description = '用户不存在!'
        return db_user
    elif not verify.verify(user.password, db_user.password):
        db_user.status = 300
        db_user.description = '你的账号或密码错误!'
        return db_user
    else:
        db_user.status, db_user.description = 200, '账号登录成功!'
        db_user.body['token'] = access_token
        print(db_user.status)
        return db_user


@app.get("/user", response_model=User)
async def read_users_me(username: User = Depends(get_current_user), db: Session = Depends(DBSession)):
    print('login_username: ', username, time.strftime('%M%S'))
    db_user: User = DBUser.get_by_username(db, username)
    if not db_user or not username:
        db_user = User(username='', password='', status=400, description='登录信息失效，请重新登录!')
        return db_user
    db_user.description, db_user.status = '成功', 200
    if 'token' in db_user.body:
        db_user.body.pop('token')
    db_user.body.update({'avatar': choice(HEADERS),
                         'nickname': f'好客_{str(db_user.id).rjust(6, "0")}',
                         'gender': choice(['男', '女']),
                         'phone': '小米', 'id': db_user.id})
    return db_user


@app.get("/houses/condition")
async def get_houses_condition(id: str, db: Session = Depends(DBSession)):
    response_json = {'status': 200, 'description': '请求成功', 'body': {
        'area': {'label': '区域', 'value': 'area', 'children': [{'label': '不限', 'value': 'null'}, {'label': '朝阳', 'value': 'AREA|zhaoyang'}]},
        'characteristic': [{'label': '集中供暖', 'value': 'CHAR|jizhonggongnuan'}],
        'floor': [{'label': '高楼层', 'value': 'FLOOR|1'}],
        'rentType': [{'label': '不限', 'value': 'null'}],
        'oriented': [{'label': '东', 'value': 'ORIEN|1'}],
        'price': [{'label': '不限', 'value': 'null'}],
        'roomType': [{'label': '一室', 'value': 'ROOM|1'}],
        'subway': {'label': '地铁', 'value': 'subway', 'children': [{'label': '不限', 'value': 'null'}]}
    }}

    if id == 'AREA|1111':
        return response_json
    else:
        response_json['body']['area']['children'] = [{'label': '不限', 'value': 'null'}, {'label': '宝山', 'value': 'AREA|baoshan'}]
        return response_json


@app.get("/houses")
async def get_houses(cityId, area, mode, price, more, start, end, db: Session = Depends(DBSession)):
    response_json = {'status': 200, 'description': '请求成功', 'body': {
        'list': [{'houseCode': '11', 'title': '线上', 'desc': 'subtitle', 'houseImg': 'static/images/轮播1.jpg', 'tags': ['近地铁'], 'price': 2000}]
    }}

    if area == 'AREA|zhaoyang':
        return response_json
    else:
        response_json['body']['list'][0]['title'] = '线下'
        return response_json


@app.get("/houses/params")
async def get_houses_params():
    response_json = {'status': 200, 'description': '请求成功', 'body': {
        'floor': [{'value': '1', 'label': '高楼层'}, {'value': '2', 'label': '中楼层'}, {'value': '3', 'label': '低楼层'}],
        'roomType': [{'value': '1', 'label': '一室'}, {'value': '2', 'label': '二室'}, {'value': '3', 'label': '三室'}, {'value': '4', 'label': '四室'}],
        'oriented': [{'value': '1', 'label': '东'}, {'value': '2', 'label': '南'}, {'value': '3', 'label': '西'}, {'value': '4', 'label': '北'}]}}

    return response_json


@app.post("/house/image")
async def post_houses_image(file: List[UploadFile] = File(...), username: User = Depends(get_current_user)):
    response_json = {'status': 200, 'description': '请求成功', 'body': []}
    for x in file:
        with open(f'{STATIC_DIR}/{x.filename}', 'wb') as f:
            f.write(await x.read())
        response_json['body'].append(x.filename)
    return response_json


@app.get("/houses/{roomId}")
async def get_houses_room(roomId: int, db: Session = Depends(DBSession)):
    response_json = {'status': 200,
                     'description': '请求成功',
                     'body': {'houseCode': '1111',
                              'title': '整租 中山路 历史最低点',
                              'community': '中山花园',
                              'description':
                              '近地铁，附近有商场！254对数据集跑一下第二版仿真工程。 -- 3月7号demo版本2. 五个城市五个机型对应的TOP5数据标注2.0 （北京只有一条） deviceId的数量大于203. 不care城市五个机型对应的TOP数据标注2.0（ 2和3的deviceId不能重复 ） # 先不做254对数据集跑一下第二版仿真工程。 -- 3月7号demo版本2. 五个城市五个机型对应的TOP5数据标注2.0 （北京只有一条） deviceId的数量大于203. 不care城市五个机型对应的TOP数据标注2.0（ 2和3的deviceId不能重复 ） # 先不做254对数据集跑一下第二版仿真工程。 -- 3月7号demo版本2. 五个城市五个机型对应的TOP5数据标注2.0 （北京只有一条） deviceId的数量大于203. 不care城市五个机型对应的TOP数据标注2.0（ 2和3的deviceId不能重复 ） # 先不做',
                              'size': 100,
                              'floor': '高楼层',
                              'price': 3000,
                              'oriented': ['南'],
                              'roomType': '三室',
                              'supporting': ['衣柜', '洗衣机'],
                              'tags': ['近地铁', '集中供暖', '新上', '随时看房'],
                              'houseImg': [
                                  'static/images/轮播1.jpg',
                                  'static/images/轮播2.jpg',
                                  'static/images/轮播3.jpg'
                              ]}}

    return response_json


@app.get("/user/houses")
async def get_user_houses(username: User = Depends(get_current_user), db: Session = Depends(DBSession)):
    print('username: ', username, time.strftime('%M%S'), type(username))
    response_json = {'status': 200, 'description': '请求成功', 'body': [
        {'houseCode': '1111',
         'title': '整租 中山路 历史最低点',
         'desc':
         '近地铁，附近有商场！254对数据集跑一下第二版仿真工程。',
         'price': 3000,
         'tags': ['近地铁', '集中供暖', '新上', '随时看房'],
         'houseImg': 'static/images/轮播1.jpg'}
    ]}
    if not username:
        response_json = {'status': 400, 'description': 'token已过期', 'body': []}
        print(username)

    return response_json


@app.post("/user/houses")
async def post_user_houses(house: Houses, username: User = Depends(get_current_user), db: Session = Depends(DBSession)):
    response_json = {'status': 200, 'description': '请求成功'}
    if not username:
        response_json = {'status': 400, 'description': 'token已过期'}
    # print(house)
    return response_json


@app.get("/area/community")
async def get_area_community(name: str, id: str):
    response_json = {'status': 200, 'description': '请求成功', 'body': [
        {'community': '123', 'communityName': name}
    ]}

    return response_json


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
