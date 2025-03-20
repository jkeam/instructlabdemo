# Instructlab Demo

Repo to use Instructlab.
For me, all of these instructions are specific to my computer,
a 2021 M1 Macbook Pro.

## Prerequisite

1. xcode installed and Apple license agreed to

## Setup Instructlab

1. Install Instructlab

    ```shell
    ./setup.sh
    ```

2. Initialize

    ```shell
    ilab config init
    # answer questions in interactive cli wizard
    # ilab config show - to see configs just created
    ```

3. Download granite, merlinite, and mistal models

    ```shell
    export HF_TOKEN=<your-hugging-face-token-here>
    ilab model download
    ```

4. Download granite model to be trained

   ```shell
   ilab model download --repository instructlab/granite-7b-lab
   # don't need this if doing simple or full training
   ilab model download --repository prometheus-eval/prometheus-8x7b-v2.0
   ```

## Running

To run this, we need two terminals.
One to run the server and the other to run the chat client.

### Server

```shell
./serve.sh
```

### Chat Client

```shell
./chat.sh
```

### Training

To train, run the synthetic data generation step
using `./data.sh -m <modelname>` and the training step with `./train.sh`.

## References

1. [InstructLab GitHub Repo](https://github.com/instructlab/instructlab)
2. [InstructLab Taxonomy](https://github.com/instructlab/taxonomy)
