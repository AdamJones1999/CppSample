#   ________    ________  ______    __  __   ______   ______
#  /_______/\  /_______/\/_____/\  /_/\/_/\ /_____/\ /_____/\     
#  \::: _  \ \ \__.::._\/\:::_ \ \ \ \ \ \ \\:::_:\ \\:::_ \ \    
#   \::(_)  \ \   \::\ \  \:(_) ) )_\:\_\ \ \  /_\:\ \\:\ \ \ \   
#    \:: __  \ \  _\::\ \__\: __ `\ \\::::_\/  \::_:\ \\:\ \ \ \  
#     \:.\ \  \ \/__\::\__/\\ \ `\ \ \ \::\ \  /___\:\ '\:\/.:|| 
#      \__\/\__\/\________\/ \_\/ \_\/  \__\/  \______/  \_____/ 
#                                                                 
# Copyright (c) 2015-18 Airy3D Inc.
# All rights reserved.

cmake_minimum_required(VERSION 3.10.0)

project(CppSample)
set(PROJECT_LONGNAME "CppSample")
set(PROJECT_VERSION "1.0.0")

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/install" CACHE STRING "Install path prefix.")

file(GLOB	SRC "*.cpp" "*.hpp" "*.c" "*.h")

add_executable(CppSample ${SRC})
install(TARGETS CppSample DESTINATION bin)
