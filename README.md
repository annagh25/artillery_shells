Introduction
    This is the README file of Artillery Shells Inventory Application.

CONTENTS
    1. Getting Started
    2. Prerequisites
    3. Directory Structure
    4. Build the project
    5. Maintainer

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
├── CMakeLists.txt	     # CMake configuration file
├── qml.qrc		     # Qt resource file for bundling QML files
├── main.cpp                 # Entry point of the application
├── qml                      # All .qml files directory
│   ├── Main.qml		 # Main window
│   ├── Add_shells_window.qml    # Add shells window
│   ├── Remove_shells_window.qml # Remove shells window
│   └── History_window.qml	 # History window
├── database.cpp             # C++ class for database interactions
├── database.h               # Header file for database management
├── resources/               # Directory for resources(e.g., images)
│   └── images/              # Images used in the application
├── sql/                     # Directory for SQL scripts
│   └── create_tables.sql    # SQL script to create database table
└── docs/                    # Directory for documentation
    └── dev_spec.odt         # Development specification file

4. Build the project
    To build the project, follow these steps:
	- Create a Build Directory:
	    Navigate to your project's root directory,
	    where the CMakeLists.txt file is located.
	    Create a new directory named build.
		mkdir build
		cd build

	- Generate the Build Files with CMake:
		cmake ..

	- Compile the Project:
		make

	- Run the Application:
	    ./Artillery_shells

5. Maintainer
    Anna Ghazaryan
