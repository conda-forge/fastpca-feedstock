export C_INCLUDE_PATH="$PREFIX/include:$C_INCLUDE_PATH"

if [ `uname` == Darwin ]; then
  export CC="${CC} -fopenmp"
fi

mkdir build && cd build
cmake ..
echo "CXX_INCLUDES = -isystem $PREFIX/include" >> $SRC_DIR/build/src/CMakeFiles/fastpca.dir/flags.make
make

cp -r src/ ${PREFIX}
rm -rf ${PREFIX}/CMakeFiles

ln -s ${PREFIX}/src/fastpca ${PREFIX}/bin/fastpca
