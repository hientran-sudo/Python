from flask import Flask
from flask import request, jsonify
from flask_httpauth import HTTPBasicAuth

app = Flask(__name__)
app.config["DEBUG"] = True
auth = HTTPBasicAuth()

# our data: a list of books that can be retrieved through REST APIs
books = [
    {
        'id': 0,
        'title': 'Hacking: The Art of Exploitation',
        'author': 'Jon Erickson',
        'year': '2003'
    },
    {
        'id': 1,
        'title': 'The Art of Software Security Assessment',
        'author': 'Mark Dowd, John McDonald, Justin Schuh',
        'year': '2006'
     },
    {
        'id': 2,
        'title': 'The Web Application Hacker’s Handbook',
        'author': 'Dafydd Stuttard',
        'year': '2007'
     },
    {
        'id': 3,
        'title': 'Practical Malware Analysis',
        'author': 'Michael Sikorski',
        'year': '2012'
        }
]


# function to validate username/password
@auth.verify_password
def authenticate(username, password):
    if username and password:
        if username == 'qwerty' and password == '654321':
            return True
        else:
            return False
    return False


# REST API endpoint to list all the books  
@app.route('/api/v1/resources/books/all', methods=['GET'])
@auth.login_required
def api_all():
    return jsonify(books)

# REST API endpoint to list a book with the ID specified by the user as query parameter 
# e.g. /api/v1/resources/books?id=1
@app.route('/api/v1/resources/books', methods=['GET'])
@auth.login_required
def api_id():
    if 'id' in request.args:
        id = int(request.args['id'])
    else:
        return "Please provide a query id"

    # preparing the results
    results = []

    # find all the books with the ID provided by the user
    for book in books:
        if book['id'] == id:
            results.append(book)

    # transform the list into JSON format
    return jsonify(results)


if __name__ == "__main__":
    app.run()

