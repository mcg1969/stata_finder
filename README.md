# Stata Binary Finder

This simple package enables a shared copy of Stata to be run
from within a conda enviromment. It does so by ensuring that
the environment has the necessary dynamic libraries, and by
providing a set of wrapper scripts that locate the binary
dynamically and set `LD_LIBRARY_PATH`. It also creates some
symbolc links to resolve some minor dynamic library
versioning issues.

The scripts will find the `stata`, `stata-mp`, etc. binaries
if one of the following is true:

- If they are on the standard `PATH`
- If the environment variable `STATA_HOME` exists and is
  set to the directory containing the binaries.

If `STATA_HOME` exists, it is assumed to be correct, and will
override any binaries found on the `PATH`.

Other limitations:
- This is currently for Linux only
- It provides wrapper scripts for the `xstata*` binaries, but
  it does not attempt to install any X Windows specific libraries
  into the conda environment, assuming instead that they will
  be pulled from the system.
