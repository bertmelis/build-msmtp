#!/bin/bash

PACKAGE_TO_BUILD=msmtp

# directory where the rpm will be stored
if [ -d artifacts ] ; then
 rm -rf artifacts
fi
mkdir artifacts
chmod 777 artifacts

# First build a image that contains the sources and necessary packages for rpmbuild
podman build -t ${PACKAGE_TO_BUILD}-build .

# then run the image
if [ -z $WORKSPACE ] ; then
  WORKSPACE=$(pwd)
fi
podman run --rm -e PACKAGE=${PACKAGE_TO_BUILD} -v ${WORKSPACE}/artifacts:/artifacts:Z ${PACKAGE_TO_BUILD}-build /rpmbuild/build_rpm.bash