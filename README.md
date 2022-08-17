Build script for msmtp on Rocky Linux 9

### Usage

Run `build.bash` to build msmtp in a RL9 container (using Podman). You can find the resulting rpm in a directory `artifacts`.

### Updates

To test/build a new version, download the new source into `src` and update the `msmtp.spec` file accordingly.

### Sources

- https://packages.fedoraproject.org/pkgs/msmtp/msmtp/
- https://marlam.de/msmtp/
