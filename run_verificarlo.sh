#!/bin/bash
	echo Beginning evaluation.
	mkdir verificarlo_results
	
	for ((i = 36; i > 10; i=i-2))
	do
		echo Running Mondrians with precision of $i bits...
		export VFC_BACKENDS="libinterflop_vprec.so --precision-binary64=$i"
		make rerun
		echo Copying result files...
		cp /tmp/output verificarlo_results/output_$i
		cp /tmp/output_runs verificarlo_results/output_runs_$i
		cp models.csv verificarlo_results/models_$i.csv
	done
