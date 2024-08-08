Introduction
    This is the README file of Artillery Shells Inventory Application.

CONTENTS
    1. Getting Started
    2. Prerequisites
    3. Directory Structure
    4. Build the project
    5. Testing
    6. Maintainer

1. Getting Started
    This a Qt/QML based application designed to manage the inventory of
    artillery shells. Application allows users to add, remove, and
    view the current state of artillery shells, as well as track the
    history of inventory action.

2. Prerequisites
    - Qt 6 or higher:
	It's development framework for building the application.
	You can download it from Qt's official website.
	#TODO add command line version

    - SQLite:
	- sudo apt update
	- sudo apt install sqlite3
	- sudo apt-get install libsqlite3-dev

3. Directory Structure
.
├── README.md		     # This file
├── main.cpp                 # Entry point of the application
├── Main.qml                 # Main QML file for inventory window
├── Add_shells_window.qml    # QML file for representing a add view
├── Remove_shells_window.qml # QML file for representing a remove
├── History_window.qml	     # QML file for representing
│			       the history view
├── inventorymodel.cpp       # C++ class for managing inventory data
├── inventorymodel.h         # Header file for inventory management
├── database.cpp             # C++ class for database interactions
├── database.h               # Header file for database management
├── resources/               # Directory for resources(e.g., images)
│   └── images/              # Images used in the application
├── sql/                     # Directory for SQL scripts
│   └── create_tables.sql    # SQL script to create database table
├── docs/                    # Directory for documentation
│   └── dev_spec.odt         # Development specification file
└── build/                   # Directory for build artifacts

4. Build the project
#TODO

5. Testing
#TODO

6. Maintainer
    Anna Ghazaryan
