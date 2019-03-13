rm out.txt ; 
for i in $(find . | grep -v 'clkrst\|memory2c\|bench\|dff' | grep '\.v$'); do 
	verilator -Wall -Wno-STMTDLY -Wno-ASSIGNDLY -Wno-BLKSEQ --lint-only "$i" 2>&1 3>&1 | \
		grep -v '^%Error:' >> out.txt 2>&1 3>&1 ;
done
