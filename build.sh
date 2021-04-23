mkdir -p $PREFIX/{bin,lib}
cp stata.sh $PREFIX/bin/stata
cd $PREFIX/bin
chmod +x stata
for path in stata-mp stata-se xstata xstata-mp xstata-se; do
   ln -s stata $path
done
cd ../lib
ln -s libtinfo.so libtinfo.so.5
ln -s libncurses.so libncurses.so.5
