FROM ubuntu
RUN apt-get update -y
RUN apt-get install git vim -y
RUN mkdir -p /opt/opensim-libs
RUN cd /opt/ && git clone https://bitbucket.org/opensimulator/opensim-libs.git

RUN apt-get install vim libtool m4 automake build-essential -y --no-install-recommends

# LibODE
WORKDIR /opt/opensim-libs/trunk/unmanaged/OpenDynamicsEngine-0.13.1mod
RUN ./bootstrap && \
	./configure --with-trimesh=opcode --disable-asserts --enable-shared --disable-demos --without-x --disable-threading-intf
RUN make install-strip
RUN echo OUTPUT in /usr/local/lib


