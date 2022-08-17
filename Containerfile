FROM rockylinux:9
RUN dnf install -y epel-release dnf-plugins-core
RUN dnf config-manager --set-enabled crb
RUN dnf install -y rpm-build redhat-rpm-config make gcc nano git tar unzip rpmlint autoconf automake libtool && \
    dnf clean all
RUN mkdir -p /rpmbuild/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
COPY build/build_rpm.bash /rpmbuild/build_rpm.bash
COPY build/msmtp.spec /rpmbuild/msmtp.spec
ADD src /rpmbuild/rpmbuild/SOURCES/