FROM amazonlinux:2

# Install dependencies
RUN yum install -y gcc-gfortran git make

# Clone and make PFANT
RUN git clone --depth 1 https://github.com/trevisanj/PFANT.git && \
    cd PFANT/fortran && ./make-linux.sh

# Add environment variables
ENV PFANT_HOME /PFANT
ENV PATH="$PATH:$PFANT_HOME/fortran/bin"

# Copy grid.moo
COPY grid.moo $PFANT_HOME/data/common/grid.moo
