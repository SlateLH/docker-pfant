FROM alpine:latest

# Install dependencies
RUN apk add bash gfortran git make musl-dev

# Set working directory to /var
WORKDIR /var

# Clone and make PFANT and download grid.moo
RUN git clone --depth 1 https://github.com/trevisanj/PFANT.git && \
    cd PFANT/fortran && ./make-linux.sh && \
    cd ../data/common && ./get-grid.moo.sh
