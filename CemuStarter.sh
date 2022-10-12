#!/bin/sh
clear
PS3='-----Please chose an option-----'
options=("Start" "Update" "Exit")
select menu in "${options[@]}"; do
    case $menu in
        #Used for launching Cemu
        "Start")
            echo "Starting Cemu..."
            echo "Finished!!"
            echo "Following warnings are from Cemu, not this script"
	    #Change this if your cemu folder is not on home
	    cd ~/Cemu/bin
	    ./Cemu_release
            echo "----------Cemu closed----------"
	    exit
            ;;
        #Used for Updating Cemu
        "Update")
            echo "Updating..."
        #please chang these paths according where you store Cemu
	    cd ~/
	    git clone --recursive https://github.com/cemu-project/Cemu
	    cd Cemu
	    cmake -S . -B build -DCMAKE_BUILD_TYPE=release -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -G Ninja
	    cmake --build build
            echo "Finished!!"
        exit
            ;;
        #Exit the script
        "Exit")
            echo "Exiting..."
        exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
