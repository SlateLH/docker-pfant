FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y gfortran git make wget

# Set working directory to /var
WORKDIR /var

# Clone and make PFANT and download grid.moo
RUN git clone --depth 1 https://github.com/trevisanj/PFANT.git && \
    cd PFANT/fortran && ./make-linux.sh

# Add environment variables
ENV PFANT_HOME /var/PFANT
ENV PATH="${PATH}:${PFANT_HOME}/fortran/bin"

# Copy grid.moo to $PFANT_HOME
COPY grid.moo ${PFANT_HOME}/data/common/grid.moo
