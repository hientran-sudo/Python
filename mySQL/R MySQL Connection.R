library(RMySQL)

mydb = dbConnect(
  MySQL(), 
  user='python_agent',
  password='python_agent1!',
  dbname='world',
  host='localhost')

dbListTables(mydb)

rs = dbSendQuery(mydb, "SELECT * FROM City WHERE population > 700000")
data = fetch(rs, n=-1)

data
