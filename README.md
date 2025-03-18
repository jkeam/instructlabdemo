# Instructlab Demo

Repo to use Instructlab.

## Prerequisite

For me, these setup instructions align with my computer, a Macbook Pro.

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
