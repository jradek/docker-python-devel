# Readme

Simple example how to develop/debug a python application inside docker container.

## VS Code workflow

1. Build container

    ```bash
    docker build -t my-py5 .
    ```

1. Start container

    ```bash
    # the $(pwd -W) is required for windows git bash, on unix use $(pwd)
    docker run -p 3000:3000 -v $(pwd -W):/work -it --rm  my-py5 python src/debug-main.py

    # OR:
    docker-compose up -d
    ```

1. Start debugger in Vscode with this launch configuration

    ```json
    {
        "name": "Python: Remote Attach",
        "type": "python",
        "request": "attach",
        "port": 3000,
        "host": "127.0.0.1",
        "localRoot": "${workspaceFolder}",
        "remoteRoot": "/work"
    }
    ```
