#!/usr/bin/python
from flask import Flask
import os
from services import Services

app = Flask(__name__)

@app.route("/")
def serverstatus():
    return "<h1> Server is Running </h1>"



@app.route("/healthchecker")
def healthchecker():

    return "<h1> Server is Up and Healthy </h1>"


@app.route("/conf/env")
def env_var_list():
    return Services.env_var_list()



@app.route("/env/<env_var_name>/<env_var_content>")
def create_env_vars(env_var_name, env_var_content):
    return Services.create_env_vars(env_var_name, env_var_content)



@app.route("/list/software")
def list_running_software():
    return Services.list_running_software()




if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080, debug="False")