To run the code please proceed like that:
In the ZdZdRecoAnalysisArea repository, do:
SetupATLAS

asetup AthAnalysisBase,2.4.22,here
cmt co -r AnalysisCamROOT-02-00-00-branch PhysicsAnalysis/AnalysisCam/AnalysisCamROOT
cmt co -r AnalysisCamEvent-02-00-00-branch PhysicsAnalysis/AnalysisCam/AnalysisCamEvent
cmt co -r GeneralCamTools-02-00-00-branch PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools

cmt find_packages
cmt compile


future recompile of just ZdZdPlotting can be done with

cmt compile_pkg ZdZdPlotting

or even just

cmt compile_pkg ZdZd


For running you can do in run repository:
athena ZdZdPlottingAlgJobOptions.py after
modifying the ZdZdPlottingAlgJobOptions.py to point at your local copy of the ntuples, then do:
And to rectouch plots by using AtlasStyle do in root:
.L RetouchPlots.C
SetAtlasStyle ()

