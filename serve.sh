#!/bin/bash

# merlinite-7b-lab-Q4_K_M.gguf | 4.1 GB |
# ~/.cache/instructlab/models/merlinite-7b-lab-Q4_K_M.gguf

# ibm-granite/granite-embedding-125m-english | 479.2 MB |
# ~/.cache/instructlab/models/ibm-granite

# mistral-7b-instruct-v0.2.Q4_K_M.gguf | 4.1 GB  |
# ~/.cache/instructlab/models/mistral-7b-instruct-v0.2.Q4_K_M.gguf

# granite-7b-lab-Q4_K_M.gguf | 3.8 GB |
# ~/.cache/instructlab/models/granite-7b-lab-Q4_K_M.gguf

############################################################
# Help                                                     #
############################################################
help()
{
   # Display Help
   echo "Start the model server."
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

# serve the model
source ./venv/bin/activate
if [ "$model" = "mistral" ]; then
  ilab model serve --model-path ~/.cache/instructlab/models/mistral-7b-instruct-v0.2.Q4_K_M.gguf
elif [ "$model" = "granite" ]; then
  ilab model serve --model-path ~/.cache/instructlab/models/granite-7b-lab-Q4_K_M.gguf
elif [ "$model" = "merlinite" ]; then
  ilab model serve --model-path ~/.cache/instructlab/models/merlinite-7b-lab-Q4_K_M.gguf
fi
