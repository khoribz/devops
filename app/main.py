import os
from time import sleep

from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, text

db_name = os.getenv('db_name', 'database')
db_user = os.getenv('db_ueser', 'postgres')
db_password = os.getenv('db_password', 'postgres')
db_host = os.getenv('db_host', 'db')
db_port = os.getenv('db_port', '5432')

if __name__ == '__main__':
    print('Application started')
    db_string = 'postgresql+psycopg2://{}:{}@{}:{}/{}'.format(db_user, db_password, db_host, db_port, db_name)
    engine = create_engine(db_string)
    metadata = MetaData()
    books = Table(
        'book', metadata,
        Column('id', Integer, primary_key=True),
        Column('title', String),
        Column('author', String),
    )

    metadata.create_all(engine)

    with engine.connect() as con:
        statement = text("""INSERT INTO book (id, title, author) VALUES (1, 'The Hobbit', 'Tolkien')""")
        con.execute(statement)

        rs = con.execute(text('SELECT * FROM book'))

        for row in rs:
            print(row)
