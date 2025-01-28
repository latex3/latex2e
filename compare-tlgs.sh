for toplevel in base required/amsmath required/cyrillic required/firstaid required/graphics required/latex-lab required/tools; do
    echo "----------------- toplevel: $toplevel ----------------------"

    returndir=`pwd`
    cd $toplevel

    for d in `ls -d testfiles*`; do
       echo "----------------- $d ----------------------"
       cd $d

       for f in `ls *.xetex.tlg 2>/dev/null` ; do
	echo Handle FILE $f
	BASE=`basename $f '.xetex.tlg'`
	cmp -s $f $BASE.tlg
	if test $? -eq 0 ; then
	  echo " ==> identical with $BASE.tlg ==="
	  echo "    --> removing $f"
	  rm $f
	  echo " "
	fi
      done

      for f in `ls *.luatex.tlg 2>/dev/null` ; do
	echo Handle FILE $f
	BASE=`basename $f '.luatex.tlg'`
	cmp -s $f $BASE.tlg
	if test $? -eq 0 ; then
	  echo " ==> identical with $BASE.tlg ==="
	  echo "    --> removing $f"
	  rm $f
	  echo " "
	fi
      done
       cd ..
    done
   cd $returndir
done

