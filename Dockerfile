FROM debian:buster AS build
WORKDIR /src
RUN \
    apt-get -qq update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y -qq install git g++ cmake make && \
    git clone git://github.com/danmar/cppcheck.git cppcheck && \
    cd cppcheck && git checkout edd86c0b0a9eeb7f3d6e73273186e6ecac85dbeb && cd .. && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DUSE_MATCHCOMPILER=ON -DCMAKE_INSTALL_PREFIX=/usr -DFILESDIR=/usr/share/cppcheck ../cppcheck && \
    make -j $(nproc) && make install

FROM debian:buster
COPY --from=build /usr/bin/cppcheck /usr/bin/
COPY --from=build /usr/share/cppcheck/ /usr/share/cppcheck/
VOLUME /src
WORKDIR /src
