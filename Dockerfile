FROM centos
MAINTAINER Phil Griffiths phil@redhat.com
LABEL Description="Test install of Mono on CentOS and runs a sample hello-world app"
RUN yum -y install git
RUN git clone https://github.com/mono/mono.git
RUN yum -y install make autoconf libtool which gcc-c++ gettext && yum -y clean all
RUN cd mono && ./autogen.sh && make get-monolite-latest && make && make install
COPY hello.cs /
RUN /usr/local/bin/mcs hello.cs
RUN /usr/local/bin/mono hello.exe
