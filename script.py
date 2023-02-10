import random
import time
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

driver_status = ["Active", "Retired", "Deceased"]
team_status = ["Active", "Inactive"]
circuit_type = ["Street", "Oval", "Circuit"]

def random_time_between_1_to_119_minutes():
    random_seconds = random.randint(60, 7140)
    random_time = time.strftime('%H:%M:%S', time.gmtime(random_seconds))
    return random_time


# for i in range(1950, 2023):
#   query = "INSERT INTO season (during_year) VALUES (%s)"
#   values = (i,)
#   cursor.execute(query, values)
#   cnx.commit()

# for i in range(20):
#   # Insert data into the nationality table
#   query = "INSERT INTO nationality (contry) VALUES (%s)"
#   values = (fake.country(),)
#   cursor.execute(query, values)
#   cnx.commit()

for i in range(100):
  # Insert data into the driver table
  query = "INSERT INTO driver (firstname, lastname, dob, id_nationality, status) VALUES (%s, %s, %s, %s, %s)"
  values = (fake.first_name(), fake.last_name(), fake.date(), fake.random_int(min=1, max=19), fake.random_element(driver_status))
  cursor.execute(query, values)
  cnx.commit()


for i in range(30):
  # Insert data into the team table
  query = "INSERT INTO team (name, status) VALUES (%s, %s)"
  values = (fake.company(), fake.random_element(team_status))
  cursor.execute(query, values)
  cnx.commit()



for i in range(100):
  # Insert data into the circuit table
  query = "INSERT INTO circuit (name, type) VALUES (%s, %s)"
  values = (fake.company(), fake.random_element(circuit_type))
  cursor.execute(query, values)
  cnx.commit()
  
  
for i in range(650):
  # Insert data into race
  query = "INSERT INTO race (name, id_season) VALUES (%s, %s)"
  values = (fake.company(), fake.random_int(min=1, max=72))
  cursor.execute(query, values)
  cnx.commit()

for i in range(1, 650):
  # insert data into  qualification
  query = "INSERT INTO qualification (q1, q2, q3, id_race)"
  
  # generate random time between 1:00 and 1:59
  q1 = random_time_between_1_to_119_minutes()
  q2 = random_time_between_1_to_119_minutes()
  q3 = random_time_between_1_to_119_minutes()
  
  values = (q1, q2, q3, i)
  
  cursor.execute(query, values)
  cnx.commit()
  
# Create races relationship table between race and circuit
for i in range(1, 650):
  query = "INSERT INTO races (id_race, id_circuit) VALUES (%s, %s)"
  values = (i, fake.random_int(min=1, max=99))
  cursor.execute(query, values)
  cnx.commit()
  
  
# Create drive relationship table between driver and team
for i in range(1, 100):
  query = "INSERT INTO drive (id_driver, id_team) VALUES (%s, %s)"
  values = (i, fake.random_int(min=1, max=29))
  cursor.execute(query, values)
  cnx.commit()

# Create qualifies relationship bewteen qualification and driver
for i in range(1, 650):
  query = "INSERT INTO qualifies (id_qualification, id_driver) VALUES (%s, %s)"
  values = (i, fake.random_int(min=1, max=99))
  cursor.execute(query, values)
  cnx.commit()


# create ranks relationship between driver and race
for i in range(1, 650):
  query = "INSERT INTO ranks (id_driver, id_race, place) VALUES (%s, %s, %s)"
  values = (fake.random_int(min=1, max=99), i, fake.random_int(min=1, max=20))
  cursor.execute(query, values)
  cnx.commit()