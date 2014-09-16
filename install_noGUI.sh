#
#   Run this file from the project root to install all required libraries:
#       * Compile ALE under
#           ../bin/ale
#

# store current directory name and go in ALE directory
cwd=$(pwd)
cd ./libraries/ale

# prepare Makefiles based on OS, choose makefile with no SDL(no GUI)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    cp makefile_noGUI.unix makefile
elif [[ "$OSTYPE" == "darwin"* ]]; then
    cp makefile_noGUI.mac makefile
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "WARNING: Not tested under cygwin"
    cp makefile_noGUI.unix makefile
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Windows is not supported. Terminating."
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "WARNING: Not tested under FreeBSD"
    cp makefile_noGUI.unix makefile
else
    echo "Unknown OS. Terminating."
fi

# compile ALE
make

# go back to the main directory
cd "$cwd"

# run ALE
./libraries/ale/ale -help
