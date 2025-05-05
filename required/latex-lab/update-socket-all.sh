l3build save -cconfig-LM-tagging \
	LM-2-2

sh update-OR-all.sh

l3build save -c config-table-luatex table-006-longtable table-021-longtable table-019 table-001 table-020 table-003 table-018 table-008-multi table-017 table-016 table-005 table-015 table-004-tabularx table-007-longtable table-009 table-002
l3build save -c config-table-pdftex table-020 table-015 table-005 table-008-disable table-022-cline table-002 table-007-longtable table-021-longtable table-026-multirow table-004-tabularx table-006-longtable table-008-multi table-001 table-019 table-017 table-009 table-003

exit
