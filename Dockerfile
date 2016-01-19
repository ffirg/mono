FROM centos
MAINTAINER Phil Griffiths phil@redhat.com
LABEL Description="Test install of Mono on CentOS and runs a sample app"
RUN cd /etc/yum.repos.d && yum -y install epel-release wget && wget https://copr.fedoraproject.org/coprs/tpokorra/mono-opt/repo/epel-6/tpokorra-mono-opt-epel-6.repo
RUN yum -y install mono-opt mono-xsp-opt mod_mono-opt mono-basic-opt mono-nant-opt nuget-opt monodevelop-opt nunit-opt
#RUN . /opt/mono/env.sh && /opt/mono/bin/mono --version
#COPY index.aspx /
WORKDIR /opt/mono/lib/xsp/test
EXPOSE 9000
ENTRYPOINT ["/opt/mono/bin/xsp4", "--port 9000", "--nonstop"]
