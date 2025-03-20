#!/bin/bash

############################################################
# Help                                                     #
############################################################
help()
{
   # Display Help
   echo "Train."
   echo
   echo "Syntax: $(basename $0) [-m|h]"
   echo "options:"
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
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

# train
export PYTORCH_MPS_HIGH_WATERMARK_RATIO=0.0
source ./venv/bin/activate
echo "Started at $(date)"
ilab model train --pipeline full --device=mps --data-path ~/.local/share/instructlab/datasets/2025-03-19_194042/knowledge_train_msgs_2025-03-19T19_40_44.jsonl
echo "Done at $(date)"
