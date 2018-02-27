docker build -t buildmon .
docker run -it -p 5000:5000 --mount type=bind,source="$HOME/.aws",target="/root/.aws" buildmon:latest