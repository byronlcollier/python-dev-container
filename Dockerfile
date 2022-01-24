FROM mcr.microsoft.com/vscode/devcontainers/python:3
WORKDIR /usr/src/requirements
COPY requirements.txt /usr/src/requirements/
RUN pip install -r requirements.txt
RUN apt-get install -y wget curl libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev apt-transport-https 
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-sdk-6.0
RUN dotnet tool install --global GitVersion.Tool