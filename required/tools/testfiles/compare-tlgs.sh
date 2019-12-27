for f in `ls *.xetex.tlg 2>/dev/null` ; do
  echo Handle FILE $f
  BASE=`basename $f '.xetex.tlg'`
  cmp -s $f $BASE.tlg
  if test $? -eq 0 ; then
    echo ' => files are identical ==='
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
    echo ' => files are identical ==='
    echo "    --> removing $f"
    rm $f
    echo " "
  fi
done
