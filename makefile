
# Evaluate and save a model based on a nominal class, with discretization specified as 'none'
nominaltest:
	mkdir -p results
	rm -f results/nominal*
	wekaMine -d data/vijver2002.tab -i data/vijver2002.nominal.tab -c cfg/nominal_none_class.cfg -o results/nominal_none
	wmSaveModel -d data/vijver2002.tab -i data/vijver2002.nominal.tab -o results/nominal -T -R results/nominal_none-1.0.summary.csv
	wmClassify -d data/vijver2002.tab -i data/vijver2002.nominal.tab -m results/nominal_0.wmm