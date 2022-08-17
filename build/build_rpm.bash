#!/bin/bash

# check if spec file is present
cd /rpmbuild
if [ ! -f ./${PACKAGE}.spec ] ; then
 echo Sorry, can not find rpm spec file
 exit 1
fi
cp ${PACKAGE}.spec /rpmbuild/rpmbuild/SPECS

# install dependencies
dnf builddep -y ${PACKAGE}.spec

# execute the rpmbuild command
cd rpmbuild
rpmbuild -ba --define "_topdir `pwd`" ./SPECS/${PACKAGE}.spec

# copy the rpms to the artifact directory.
if [[ -d /artifacts ]] ; then
 cp ./RPMS/x86_64/${PACKAGE}*.rpm /artifacts/
fi