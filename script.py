import mariadb
import sys

#db params
user = "root"
password = "for i in range"
host = "127.0.0.1"
port = 3306
database = "brownbank"


#trying to connect to the mariadb
try:
	connection = mariadb.connect(user = user, password = password, host = host, port = port, database = database)
# handling connection errors
except mariadb.Error as e:
	print("Error: ", e)
	sys.exit(1)

# getting a cursor
cursor = connection.cursor()

# fetching tables
cursor.execute("SHOW TABLES;")

# fetching all the results and storing them in tables
tables = cursor.fetchall();
for i in range(len(tables)):
	# updating tuple to string to store in tables list
	tables[i] = tables[i][0]

# printing tables
print(tables)

# opening a file
f = open("database.txt", "w+")

# iterating through all the tables
for i in tables:
	print(i, end=" ")
	# writing table name to file and a new line
	f.write(i)
	f.write("\n")

	# forming query
	q = "SELECT * FROM " + i
	# executing query and fetching all the results of the query
	cursor.execute(q)
	table_data = cursor.fetchall()
	
	# writing each line of table data to file
	for j in table_data:
		f.write(str(j)[1:-1])
		f.write("\n")
	print("...done")


