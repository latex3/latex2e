l3build save -cconfig-LM-tagging \
	LM-2-2

l3build save \
	socket-000

l3build save -epdftex,luatex \
	socket-001

sh update-OR-all.sh


exit
