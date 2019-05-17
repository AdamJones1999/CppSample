#!/bin/bash

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

INSTALL_DIR=$SRC_DIR/install

info="----- CppSample: Test ----- \n"
info+=" + Envs:\n"
info+="   - SRC_DIR: $SRC_DIR\n"
info+="   - BUILD_TYPE: $BUILD_TYPE\n"
info+="   - BUILD_VERBOSITY: $BUILD_VERBOSITY\n"
info+="   - CMAKE_VERBOSITY: $CMAKE_VERBOSITY\n"
info+="   - CUDA_SM: $CUDA_SM\n"
info+="   - INSTALL_DIR: $INSTALL_DIR\n"
info+="   - COMPILER_DIR: $COMPILER_DIR\n"
info+="   - PROC_COUNT: $PROC_COUNT\n"
info+="   - CMAKE_MT: $CMAKE_MT\n"
info+="   - CMAKE_GENERATOR: $CMAKE_GENERATOR\n"
printf "%b" "$info"

$INSTALL_DIR/bin/CppSample
