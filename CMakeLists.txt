# Minimum CMake version required
cmake_minimum_required(VERSION 3.16)

# Project name and version
project(Artillery_shells VERSION 1.0 LANGUAGES CXX)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable AUTOMOC for automatic Qt meta-object compilation
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(SOURCES
    main.cpp
    database.cpp
)

set(HEADERS
    database.h
)

# Find required Qt 6 components
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Sql)

# Add the executable
add_executable(Artillery_shells ${SOURCES})

# Add QML resources
qt_add_resources(Artillery_shells "qml_resources"
    PREFIX "/"
    FILES
        qml/Main.qml
        qml/Add_shells_window.qml
        qml/Remove_shells_window.qml
        qml/History_window.qml
	resources/images/logo.jpg
)

# Link Qt 6 libraries
target_link_libraries(Artillery_shells PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::Sql)

# Suppress the Qt policy warning by setting the policy
qt_policy(SET QTP0001 NEW)

# Install target for deployment
install(TARGETS Artillery_shells
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

