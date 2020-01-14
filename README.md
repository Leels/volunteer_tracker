# volunteer_tracker
## By: Lela Smith

### Description
#### Volunteer and project tracker for fictional non-profit using SQL database. This project allows non-profit employees to add projects to a database where they can view, add, update and delete projects. They also will be able to add volunteers to the database and can add them to projects. The database will also keep track of how many hours volunteers work on a project.

### Specs
|HTTP verb|Route|CRUD Action|Description|
|---|---|---|---|
|GET|/projects|READ|Get list of projects|
|GET|/projects/:id|READ|Look at detail page for a single project|
|POST|/projects|CREATE|Add new project to the list of projects|
|PATCH|/projects/:id|UPDATE|Update a single project|
|DELETE|/projects/:id|DELETE|Delete a project from the list|
|GET|/projects/new|READ|Go to the form page for adding a new project to the list|
|GET|/projects/:id/edit|READ|Go to the form page for editing a project


|HTTP verb|Route|CRUD Action|Description|
|---|---|---|---|
|GET|/projects/:id/volunteers/:volunteer_id|READ|Look at detail page for a single volunteer|
|POST|/projects/:id/volunteers/:volunteer_id|CREATE|Add new volunteer to the list of volunteers|
|PATCH|/projects/:id/volunteers/:volunteer_id|UPDATE|Update a single volunteer|
|DELETE|/projects/:id/volunteers/:volunteer_id|DELETE|Delete a volunteer from the list|

### Known Bugs
#### None

### Setup
* Download Postgres
* Clone this repository:
* from  _C:\Users\exampleUser\exampleCloneLocation\example-project-title>_
1. $ bundle install
2. $ createdb volunteer_tracker
3. $ psql volunteer_tracker < database_backup.sql
4. $ createdb -T volunteer_tracker volunteer_tracker_test
2. $ ruby app.rb

### Technologies Used
* HTML
* CSS
* Bootstrap
* Ruby
* Bootstrap
* Sinatra
* PostgreSQL

### License
#### This software is licensed under the MIT license.

#### Copyright (c) 2019 Lela Smith
