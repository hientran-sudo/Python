import hashlib

with open('upsw.txt') as f:
  lines = f.readlines()

users = []
for line in lines:
  users.append(line.strip().split(','))

for user in users:
  print(user[0])


username = "username1"
password = "qwerty1"
encoded = password.encode()
result = hashlib.sha256()
result.update( password.encode() )
print(result.hexdigest())

for i in range( len(users) ):
  if users[i][0] == username and users[i][1] == result.hexdigest():
    print( "You are logged in!" )
