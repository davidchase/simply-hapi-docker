# using specific lts version
# instead of float ie: boron
# includes npm v3.10.10
FROM node:6.9.4

# create a user + group for docker builds without
# root priviledges and ability to login as user
RUN useradd --user-group -ms /bin/false hapi

# set HOME
ENV HOME=/home/hapi

# copy over package.json and shrinkwrap 1st
# this builds up cache layer for faster docker rebuilds
COPY package.json npm-shrinkwrap.json $HOME/

# switch to the hapi user: set WORKDIR and install packages + rm tarballs
USER hapi
WORKDIR $HOME
RUN npm install && npm cache clean

# finally copy remaining local files to docker container
COPY . $HOME
