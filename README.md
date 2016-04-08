# ProbizmoStudy

## Getting Started

1. Install Vagrant to your host OS.

  https://www.vagrantup.com/

2. Clone this project.

  ```
  git clone https://github.com/m-imaoka/ProbizmoStudy.git
  ```

3. Move current directory to ProbizmoStudy.

  ```
  cd [ProbizmoStudy's path]
  ```
4. Run Vagrant.

  ```
  vagrant up
  ```

5. Start docker containers. (for server application)

  ```
  docker start postgres
  docker start cleaning-duty
  ```

6. Start docker containers. (for client application)
  ```
  docker start cleaning-duty-web-client
  docker start nginx
  ```
  cleaning-duty-web-client container is not required for running client application.
  but it is required for build client application.

7. Attach docker container. (if you need to use shell script in container)

  ```
  docker exec -it cleaning-duty /bin/bash
  docker exec -it cleaning-duty-web-client /bin/bash
  ```
