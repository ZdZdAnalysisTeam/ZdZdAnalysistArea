#Skeleton joboption for a simple analysis job

#---- Minimal joboptions -------

theApp.EvtMax=-1                                         #says how many events to run over. Set to -1 for all events
jps.AthenaCommonFlags.FilesInput = ["/afs/cern.ch/work/d/diboye/RecoVariables/my.output.29.0.root"]  #list of input files

import AthenaRootComps.ReadAthenaRoot
#import AthenaPoolCnvSvc.ReadAthenaPool

svcMgr.EventSelector.InputCollections = jps.AthenaCommonFlags.FilesInput()
svcMgr.EventSelector.TupleName = "Nominal/llllTree" #change to different tree to process systematics

algseq = CfgMgr.AthSequencer("AthAlgSeq")                #gets the main AthSequencer
algseq += CfgMgr.ZdZdPlottingAlg()                                 #adds an instance of your alg to it

if not hasattr(svcMgr, 'THistSvc'): svcMgr += CfgMgr.THistSvc() #only add the histogram service if not already present (will be the case in this jobo)
svcMgr.THistSvc.Output += ["MYSTREAM DATAFILE='myfile.root' OPT='RECREATE'"] #add an output root file stream

#include("AthAnalysisBaseComps/SuppressLogging.py")              #Optional include to suppress as much athena output as possible. Keep at bottom of joboptions so that it doesn't suppress the logging of the things you have configured above

