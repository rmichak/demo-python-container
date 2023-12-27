FROM centos:7

# Create User
USER root
RUN useradd -r -u 5001 python

# Initial package install
RUN yum install -y \
    epel-release \
    centos-release-scl

# Yum package install
RUN yum install --nogpgcheck -y \
    python3

RUN yum update -y 

# Compile 3rd party libraries
#######################################################
# Packages must be compiled from source to be scanned
#######################################################

# Copy source code
COPY ./src /opt/python/src

# Copy script that will run a pipdeptree scan displaying the direct python packages
COPY ./ia/pipdeptree.sh /
RUN chmod +x /pipdeptree.sh

# Add entrypoints, commands, or shell
