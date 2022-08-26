# How to use:
- Create an account on [macaddress.io](https://macaddress.io/)
- Copy your API key, it should be in the format at_xxxxxxxx
- Build the docker image
  ```
  docker build -t <image-tag> .
  ```
- Run the image with your API key and pass the MAC address as a parameter
  ```
  docker run --rm -ti -e API_KEY=at_xxxxxxxx <image-tag> xx:xx:xx:xx:xx:xx
  ```

# On Security
Passing the API key as an environment variable is risky if this would be used publicly like in pipelines. In such cases, the container should be run like so: `docker run --rm -ti -e API_KEY=$API_KEY <image-tag> xx:xx:xx:xx:xx:xx` where the API_KEY environment variable has been exported to the machine running the container from a secret.