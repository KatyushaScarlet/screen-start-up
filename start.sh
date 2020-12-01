#!/bin/bash

screen_name_array=()
screen_path_array=()
screen_cmd_array=()

# mc1
screen_name="mc1"
screen_path="/home/mc1/server"
screen_cmd="./start.sh"
# append to array
screen_name_array+=("$screen_name")
screen_path_array+=("$screen_path")
screen_cmd_array+=("$screen_cmd")

# mc2
screen_name="mc2"
screen_path="/home/mc2/server"
screen_cmd="./start.sh"
# append to array
screen_name_array+=("$screen_name")
screen_path_array+=("$screen_path")
screen_cmd_array+=("$screen_cmd")

# mcpe1
screen_name="mcpe1"
screen_path="/home/mcpe1/server"
screen_cmd="./start.sh"
# append to array
screen_name_array+=("$screen_name")
screen_path_array+=("$screen_path")
screen_cmd_array+=("$screen_cmd")

# mcpe2
screen_name="mcpe2"
screen_path="/home/mcpe2/server"
screen_cmd="./start.sh"
# append to array
screen_name_array+=("$screen_name")
screen_path_array+=("$screen_path")
screen_cmd_array+=("$screen_cmd")

# get array length
array_length=${#screen_name_array[@]}

# exec
count=0
while (($count < $array_length))
do
    # get parameter
    screen_name="${screen_name_array[$count]}"
    screen_path="${screen_path_array[$count]}"
    screen_cmd="${screen_cmd_array[$count]}"

    # create screen
    screen -dmS $screen_name
    screen -x -S $screen_name -p 0 -X stuff "cd $screen_path"
    screen -x -S $screen_name -p 0 -X stuff $'\n'
    screen -x -S $screen_name -p 0 -X stuff "$screen_cmd"
    screen -x -S $screen_name -p 0 -X stuff $'\n'

    ((count+=1))
done