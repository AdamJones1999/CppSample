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

SRC_DIR=$(pwd)
export SRC_DIR

VS_VERSION=15
BUILD_TYPE=Release

if [ -z "$BUILD_TYPE" ]; then BUILD_TYPE=Release; fi
if [ -z "$PROC_COUNT" ]; then PROC_COUNT="$(nproc)"; fi
if [ -z "$BUILD_VERBOSITY" ]; then BUILD_VERBOSITY="n"; fi

COMPILER_DIR="/usr/bin/gcc"
CMAKE_MT="-j $PROC_COUNT"
CMAKE_GENERATOR="Unix Makefiles"
# https://www.gnu.org/software/make/manual/html_node/Options-Summary.html
CMAKE_VERBOSITY="--debug=$BUILD_VERBOSITY"

if [ "$OSTYPE" == "msys" ]; then
    CMAKE_MT="/maxcpucount:$PROC_COUNT"
    # https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-command-line-reference?view=vs-2015
    CMAKE_VERBOSITY="/verbosity:$BUILD_VERBOSITY"
    if [ "$VS_VERSION" -eq "15" ]; then
        COMPILER_DIR="/c/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/VC/Tools/MSVC/14.15.26726/bin/Hostx64/x64"
		if [ ! -d "$COMPILER_DIR" ]; then
			COMPILER_DIR="/c/Program Files (x86)/Microsoft Visual Studio/2017/Professional/VC/Tools/MSVC/14.15.26726/bin/Hostx64/x64"
		fi
        CMAKE_GENERATOR="Visual Studio 15 2017 Win64"
    else
        COMPILER_DIR="/c/Program Files (x86)/Microsoft Visual Studio 14.0/VC/bin"
        CMAKE_GENERATOR="Visual Studio 14 2015 Win64"
    fi
fi

export BUILD_TYPE
export PROC_COUNT
export BUILD_VERBOSITY
export COMPILER_DIR
export CMAKE_MT
export CMAKE_GENERATOR
export CMAKE_VERBOSITY

info="----- CppSample: Environment variables ----- \n"
info+=" + Envs:\n"
info+="   - BUILD_TYPE: $BUILD_TYPE\n"
info+="   - BUILD_VERBOSITY: $BUILD_VERBOSITY\n"
info+="   - CMAKE_VERBOSITY: $CMAKE_VERBOSITY\n"
info+="   - COMPILER_DIR: $COMPILER_DIR\n"
info+="   - PROC_COUNT: $PROC_COUNT\n"
info+="   - CMAKE_MT: $CMAKE_MT\n"
info+="   - CMAKE_GENERATOR: $CMAKE_GENERATOR\n"
info+="   - VS_VERSION: $VS_VERSION\n"
info+=" + Paths:\n"
info+="   - PATH: $PATH\n"
info+="   - CMAKE_PREFIX_PATH: $CMAKE_PREFIX_PATH\n"
info+="   - CMAKE_LIBRARY_PATH: $CMAKE_LIBRARY_PATH\n"
info+="   - CMAKE_INCLUDE_PATH: $CMAKE_INCLUDE_PATH\n"
printf "%b" "$info"
