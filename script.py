import mysql.connector

from faker import Faker
fake = Faker()

cnx = mysql.connector.connect(
  host="localhost",
  user="root",
  password="example",
  database="f1"
)

cursor = cnx.cursor()

print("Connected to MySQL")

