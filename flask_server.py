from flask import Flask, request, send_file
import os, csv

app = Flask(__name__)

@app.route('/', methods=["POST"])
def write_csv():
    filepath = '/tmp/breakfast.csv'
    with open(filepath, 'w+', newline='') as csvfile:
        request_body = request.json
        fieldnames = request_body['fieldnames']
        data = request_body['data']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for entry in data:
            writer.writerow(entry)
    return send_file(filepath)

if __name__ == '__main__':
    import multiprocessing
    multiprocessing.set_start_method('spawn', True)
    app.run()
