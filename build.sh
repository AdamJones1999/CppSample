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

BUILD_DIR=$SRC_DIR/CmakeBuild
INSTALL_DIR=$SRC_DIR/install

info="----- HelloWorld: Build ----- \n"
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

mkdir -p $INSTALL_DIR
mkdir -p $BUILD_DIR
cd $BUILD_DIR

cmake $SRC_DIR -G"$CMAKE_GENERATOR" \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR/ \
	-DCMAKE_BUILD_TYPE=$BUILD_TYPE

cmake --build $BUILD_DIR --config $BUILD_TYPE --target install -- $CMAKE_MT $CMAKE_VERBOSITY

cd $SRC_DIR
