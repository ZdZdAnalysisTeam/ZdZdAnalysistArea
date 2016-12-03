Setup:

asetup AthAnalysisBase,2.4.22,here
cmt co -r AnalysisCamROOT-02-00-00-branch PhysicsAnalysis/AnalysisCam/AnalysisCamROOT
cmt co -r AnalysisCamEvent-02-00-00-branch PhysicsAnalysis/AnalysisCam/AnalysisCamEvent
cmt co -r GeneralCamTools-02-00-00-branch PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools
cp -r /afs/cern.ch/work/w/will/public/ZdZdPlotting ./

cmt find_packages
cmt compile


future recompile of just ZdZdPlotting can be done with

cmt compile_pkg ZdZdPlotting

or even just

cmt compile_pkg ZdZd


Running:

modify the ZdZdPlottingAlgJobOptions.py to point at your local copy of the ntuples, then do:

athena ZdZdPlotting/ZdZdPlottingAlgJobOptions.py
