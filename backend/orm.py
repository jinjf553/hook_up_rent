"""mysql数据库访问模块.

   重要设置: 通过mysql_insert_ignore修改Sqlalchemy ORM, insert时, 相同ID的对象将被忽略.
"""
import os
from contextlib import contextmanager
from functools import lru_cache
from typing import Iterator

from sqlalchemy import Column, DateTime, Integer, String, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import (DeclarativeMeta, Session, scoped_session,
                            sessionmaker)
from sqlalchemy.sql import func
from sqlalchemy_utils import create_database, database_exists

db: DeclarativeMeta = declarative_base()
db.__name__ = 'db'
db.id = Column(Integer, nullable=False, primary_key=True, autoincrement=True)
db.create_time = Column(DateTime(timezone=True),
                        server_default=func.now(),
                        comment='创建时间')
db.update_time = Column(DateTime(timezone=True),
                        server_default=func.now(),
                        onupdate=func.now(),
                        comment='更新时间')


@lru_cache()
def _create_engine(database):
    db_file = 'sqlite:///' + os.path.join(os.path.dirname(__file__),
                                          'database.db')
    engine = create_engine(db_file,
                           echo=False,
                           pool_recycle=3600,
                           pool_pre_ping=True,
                           connect_args={'check_same_thread': False})
    if not database_exists(engine.url):
        create_database(engine.url)
    database.metadata.create_all(engine)  # 创建表
    return engine


# @contextmanager
def DBSession() -> Iterator[scoped_session]:  # noqa: N802
    session = scoped_session(sessionmaker(bind=_create_engine(db)))()
    try:
        yield session
        session.commit()
    except Exception as e:
        session.rollback()
        raise e
    finally:
        session.close()


@contextmanager
def WithSession() -> Iterator[scoped_session]:  # noqa: N802
    session = scoped_session(sessionmaker(bind=_create_engine(db)))()
    try:
        yield session
        session.commit()
    except Exception as e:
        session.rollback()
        raise e
    finally:
        session.close()


def get_db() -> Session:
    session = scoped_session(sessionmaker(bind=_create_engine(db)))()
    try:
        yield session
        session.commit()
    except Exception as e:
        session.rollback()
        raise e
    finally:
        session.close()


class DBUser(db):
    status = 0
    description = ''
    body = {'token': ''}
    __tablename__ = 'tb_user'
    id = Column(Integer, nullable=False, primary_key=True, autoincrement=True)
    username = Column(String(255), comment='用户名')
    password = Column(String(255), comment='密码')

    @classmethod
    def add(cls, db: Session, data):
        db.add(data)
        db.commit()
        db.refresh(data)

    @classmethod
    def get_by_username(cls, db: Session, username):
        data: DBUser = db.query(cls).filter_by(username=username).first()
        return data

    @classmethod
    def update(cls, db: Session, username, sex):
        db.query(cls).filter_by(username=username).update({cls.sex: sex})
        db.commit()


if __name__ == '__main__':
    with WithSession() as s:
        res = s.query(DBUser).all()
        print(len(res))
