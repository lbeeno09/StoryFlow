#!/bin/bash

checkO() {
    case "$(uname -s)" in
        Darwin)
            echo "macos"
            ;;
        Linux)
            echo "linux"
            ;;
        CYGWIN*|MINGW*|MSYS*)
            echo "windows"
            ;;
        *)
            echo "other"
            ;;
    esac
}

# TODO: change vs build depending on the version of VS the user installed
buildApp() {
    local type=$1, platform=$2

    case "$platform" in
        make)
            echo "Building with Makefile in $type mode"
            premake5 gmake2; cd build/Make; make config="$type"; cd-;
            ;;
        vs)
            premake5 vs2022; cd build/VS; ./StoryFlow.xcodeproj; cd-;
            ;;
        xcode)
            premake5 xcode4; cd build/Xcode; ./StoryFlow.sln; cd-;
            ;;
        *)
            echo "Invalid command; 'build' accepts 'make', 'vs', 'xcode'."
            exit 1
            ;;
    esac
}

runApp() {
    local type=$1

    case "$type" in
        debug)
            cd build/bin/Debug/StoryFlow; ./StoryFlow; cd -;
            ;;
        release)
            cd build/bin/Release/StoryFlow; ./StoryFlow; cd -;
            ;;
        *)
            echo "Invalid command; 'run' accepts 'debug' or 'release'."
            exit 1
            ;;
    esac
}

main() {
    # TODO: Find out why this happens after 3 argument is entered
    if [ "$#" -lt 3 ]; then
        echo "Usage: [type of command] [build type] [build platform]"
        echo "type of command: build, run"
        echo "build type: debug, release"
        echo "build platform: make, vs, xcode"
        echo "if vs, append 2005, 2008, 2010, 2012, 2013, 2015, 2017, 2019, or 2022 behind vs. default is 2022"
        exit 1
    fi

    read command type platform

    os=$(checkOS)

    case "$(command)" in
        build)
            echo "Building project"
            buildApp "$type" "$platform"
            ;;
        run)
            echo "Running application"
            runApp "$type"
            ;;
        *)
            echo "Invalid type of command. Please enter 'build' or 'run'."
            exit 1
            ;; 
    esac
}

main "$@"
