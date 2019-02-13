filesInput = "/eos/atlas/user/d/diboye/user.ychiu.20190131_149a89c6.ZdZd13TeV.signal_mc16e_NTUP4L/user.ychiu.309477.MadGraphPythia8EvtGen_A14NNPDF23LO_HAHMggfZdZd4l_70_250.e6311_e5984_s3126_r10201_r10210_p3654.16948024.NTUP4L._000028.root"
theApp.EvtMax=-1                                        #says how many events to run over. Set to -1 for all events
from glob import glob
jps.AthenaCommonFlags.FilesInput = glob(vars().get("filesInput","*.root"))  #list of input files


import AthenaRootComps.ReadAthenaRoot

svcMgr.EventSelector.InputCollections = jps.AthenaCommonFlags.FilesInput()
svcMgr.EventSelector.TupleName = "Nominal/llllTree" #change to different tree to process systematics

algseq = CfgMgr.AthSequencer("AthAlgSeq")                #gets the main AthSequencer
algseq += CfgMgr.ZdZdPlottingAlg(DoLowMassSelection=False,OutputLevel=DEBUG)   #adds an instance of your alg to it

if not hasattr(svcMgr, 'THistSvc'): svcMgr += CfgMgr.THistSvc() #only add the histogram service if not already present (will be the case in this jobo)

svcMgr.THistSvc.Output += ["MYSTREAM DATAFILE='" + vars().get("outputFile","test.root") + "' OPT='RECREATE'"]
svcMgr.THistSvc.Output += ["ANOTHERSTREAM DATAFILE='systematics_signal_70_250/user.ychiu.20190131.309477_mc16e_13TeV_70_250_Nominal_allCutExpZVeto.root' OPT='RECREATE'"]
