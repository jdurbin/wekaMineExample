
clean:
	rm -rf results
	rm -rf models

# Evaluate and save a model based on a nominal class, with discretization specified as 'none'
test:
	mkdir -p results
	mkdir -p models
	rm -f results/nominal*
	wmModelSelection -c cfg/vijver2002.cfg -d data/vijver2002.tab -i data/vijver2002.clinical.tab -o results/test
	wmBestModels -R results/test-1.0.summary.tab > results/best.tab
	wmSaveModel -o models/test -d data/vijver2002.tab -i data/vijver2002.clinical.tab -R results/best.tab 
	wmClassify -m models/test_0.wmm -d data/vijver2002.tab -o results/classifications.tab

#  Currently some issue with this... I'm looking into it. 
#	wmAttributeRank -d data/vijver2002.tab -i data/vijver2002.clinical.tab -E 'none,weka.attributeSelection.GainRatioAttributeEval,weka.attributeSelection.Ranker,100,none,TIMEsurvival,2;2.1' > results/attributeranks.tab
