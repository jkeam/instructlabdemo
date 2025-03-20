#!/bin/bash

############################################################
# Help                                                     #
############################################################
help()
{
   # Display Help
   echo "Generate data."
   echo
   echo "Syntax: $(basename $0) [-m|h]"
   echo "options:"
   echo "m     Model name."
   echo "h     Print this Help."
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
# Get the options
while getopts ":hm:" option; do
   case $option in
      h) # Display help
         help
         exit;;
      m) # Enter a name
         model=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

# validate
source ./venv/bin/activate
ilab taxonomy diff
if [[ "$?" -ne "0" ]]; then
  echo 'Taxonomy is invalid.'
  exit 0
fi

# generate data
if [ "$model" = "mistral" ]; then
  ilab data generate --model ~/.cache/instructlab/models/mistral-7b-instruct-v0.2.Q4_K_M.gguf --pipeline full --gpus 16
elif [ "$model" = "granite" ]; then
  ilab data generate --model ~/.cache/instructlab/models/granite-7b-lab-Q4_K_M.gguf --pipeline full --gpus 16
elif [ "$model" = "merlinite" ]; then
  ilab data generate --model ~/.cache/instructlab/models/merlinite-7b-lab-Q4_K_M.gguf --pipeline full --gpus 16
else
  echo "Please specify model to run '-m [mistral|granite|merlinite]'"
  exit 1
fi

echo "Running ilab data list"
ilab data list
echo "Data can be found here: ~/.local/share/instructlab/datasets"
