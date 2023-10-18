# Place Manager - A Simple CRUD Application Server

## Overview

This is a straightforward CRUD (Create, Read, Update, Delete) application server designed to help you manage a database of places. Whether you want to add new places, read existing ones, update details, or delete entries, this server has you covered. It's powered by Node.js and MongoDB.

## Installation

Before you can get started, make sure you have Node.js and npm installed on your system. To install the necessary dependencies, run:

```bash
npm install

Database Configuration
You need to provide your MongoDB cluster password as an environment variable named dbPassword.
You can also specify the port for the server to listen on by setting the PORT environment variable. By default, the server will listen on port 3000.
Example:

bash

dbPassword=yourMongoDBClusterPassword PORT=4000 npm start


Routes
Reading Places
GET - /places: Retrieves all places from the MongoDB database.
GET - /place/:id: Retrieves a specific place by its unique ID from the database.
Creating Places
POST - /create: To add a new place, you need to provide the following details in the request body:
json

{
    "name": "string",
    "description": "string",
    "contact": "string",
    "location": "string",
    "category": "string"
}
All these details are mandatory for inserting a new place into the database.

Updating Places
PUT - /update: You can update a place's details using the same fields as the creation route. However, you must always include an id field to specify the product you want to update. The request should look like this:
json

{
    "id": "yourPlaceID",
    "name": "string",
    "description": "string",
    "contact": "string",
    "location": "string",
    "category": "string"
}
Deleting Places
DELETE - /delete/:id: Removes a place with the specified ID from the database.
Starting the Application
To launch the application, run:

bash

npm start
The server will start, and you can begin accessing the API routes to manage your places.

```
