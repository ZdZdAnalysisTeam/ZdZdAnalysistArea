#Skeleton joboption for a simple analysis job

#---- Minimal joboptions -------

#filesInput = "/r04/atlas/will/ZdZd13TeV/NTUP4L/condor.20170311.signal_13TeV_fastSim_mc15c/all/my*"

jps.AthenaCommonFlags.AccessMode = "TreeAccess"
jps.AthenaCommonFlags.TreeName = "*/llllTree"

svcMgr.EventSelector.CreateEventInfo=True
svcMgr.EventSelector.IgnoreMissingTrees=True

jps.AthenaCommonFlags.HistOutputs = ["MYSTREAM:myfile.root"]

#here's an example of how to filter events with NtupleCutAlg ...
#we will create an OR of a bunch of run and event number pairs ...
#IMPORTANT: you *must* have the algseq.StopOverride=False line below if you want this cut to take effect
#algseq += CfgMgr.NtupleCutAlg(Cut="(RunNumber==311402&&eventNumber==46)||(RunNumber==307732&&eventNumber==1104)")

#create a sequencer configured in "OR" mode (i.e. will pass as soon as one of the sequences passes
#orSeq = CfgMgr.AthSequencer("orSeq",StopOnSuccess=True,StopOverride=True)
#orSeq += CfgMgr.NtupleCutAlg("Cut1",Cut="(RunNumber==338498&&eventNumber==1194886101)")
#orSeq += CfgMgr.NtupleCutAlg("Cut2",Cut="(RunNumber==307732&&eventNumber==1104)")
#orSeq += CfgMgr.NtupleCutAlg("Cut3",Cut="(RunNumber==338498&&eventNumber==1194886101)||(RunNumber==333192&&eventNumber==668349526)||(RunNumber==327490&&eventNumber==2280267433)||(RunNumber==331875&&eventNumber==2155358561)||(RunNumber==329869&&eventNumber==1854045093)||(RunNumber==337705&&eventNumber==1269081354)||(RunNumber==339957&&eventNumber==1849211466)||(RunNumber==334487&&eventNumber==1705788371)||(RunNumber==331697&&eventNumber==589626129)||(RunNumber==336927&&eventNumber==2752223913)||(RunNumber==338897&&eventNumber==1425456293)||(RunNumber==337451&&eventNumber==1565924746)||(RunNumber==327490&&eventNumber==3443149782)||(RunNumber==327342&&eventNumber==1046022147)||(RunNumber==327490&&eventNumber==3164302361)||(RunNumber==329835&&eventNumber==2772231558)||(RunNumber==335170&&eventNumber==924387985)||(RunNumber==331975&&eventNumber==560453845)||(RunNumber==336852&&eventNumber==1421168264)||(RunNumber==331085&&eventNumber==2671931064)||(RunNumber==337662&&eventNumber==3191995034)||(RunNumber==300600&&eventNumber==480791607)||(RunNumber==303208&&eventNumber==4632160483)||(RunNumber==310473&&eventNumber==733804988)||(RunNumber==310341&&eventNumber==1703977389)||(RunNumber==311473&&eventNumber==363660047)||(RunNumber==302393&&eventNumber==3342707940)||(RunNumber==306278&&eventNumber==2088396684)||(RunNumber==304409&&eventNumber==470403737)||(RunNumber==303846&&eventNumber==4188780118)||(RunNumber==283429&&eventNumber==3288076462)||(RunNumber==304409&&eventNumber==894735899)||(RunNumber==307732&&eventNumber==1085508844)||(RunNumber==302269&&eventNumber==80338044)||(RunNumber==310738&&eventNumber==2163127288)||(RunNumber==311287&&eventNumber==1520598489)||(RunNumber==301932&&eventNumber==3390806694)||(RunNumber==303892&&eventNumber==5068951074)||(RunNumber==304008&&eventNumber==1953292497)||(RunNumber==276689&&eventNumber==86569730)||(RunNumber==304128&&eventNumber==418478036)||(RunNumber==309674&&eventNumber==2283428809)||(RunNumber==304128&&eventNumber==2748350326)||(RunNumber==303304&&eventNumber==2993931600)||(RunNumber==280673&&eventNumber==1382973146)||(RunNumber==311481&&eventNumber==716376443)||(RunNumber==303499&&eventNumber==3299080424)||(RunNumber==304128&&eventNumber==2801187893)||(RunNumber==311170&&eventNumber==2962111612)")

#algseq += orSeq

athAlgSeq += CfgMgr.ZdZdPlottingAlg()                                 #adds an instance of your alg to it

athAlgSeq.ZdZdPlottingAlg.DoLowMassSelection=False #true if you want to do the low mass selection
athAlgSeq.ZdZdPlottingAlg.DisableTriggerMask=True #set to true if doing release 21 analysis, since mask is already included
athAlgSeq.ZdZdPlottingAlg.Lumi = (36207.7+43593.5)*1000. #lumi in nb^-1 ... get from running the getZdZdLumi.sh script over your DATA ntuples. if unspecified, output will be efficiency



#uncomment this line to activate skimming
#athAlgSeq += CfgMgr.NtupleCopyAlg()
#this next line ensures that the NtupleCopyAlg only runs for the selected events
athAlgSeq.StopOverride=False



#include("AthAnalysisBaseComps/SuppressLogging.py")              #Optional include to suppress as much athena output as possible. Keep at bottom of joboptions so that it doesn't suppress the logging of the things you have configured above


#minitree configuration for writing out selected quadruplets
svcMgr += CfgMgr.CamWriter("MiniWriter",TreeName="/MYSTREAM/miniTree",
      Branches = ["RunNumber/unsigned int","eventNumber/unsigned long long",
                  "llll_m12/double","llll_m34/double","llll_m14/double","llll_m32/double",
                  "llll_tlv_m/double",
                  "llll_type/int"] )

svcMgr += CfgMgr.AthenaEventLoopMgr(IntervalInSeconds=20)
svcMgr.THistSvc.MaxFileSize=-1

#StoreGateSvc.Dump=True