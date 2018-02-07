// ZdZdPlotting includes
#include "ZdZdPlottingAlg.h"

#include "AnalysisCamEvent/CamEvent.h"


#include "TList.h"
#include "TFile.h"

#include "PathResolver/PathResolver.h"


bool CamObject::AutoSetTLV = true; //automatically fills the TLorentzVector properties of objects if it can


ZdZdPlottingAlg::ZdZdPlottingAlg( const std::string& name, ISvcLocator* pSvcLocator ) : CamAlgorithm( name, pSvcLocator ),
  chanInfo("ChannelInfoTool/channelInfo") {
  
  
  declareProperty("ChannelInfoFile",m_chanInfoFile="","Specify the merged file containing the sum of weights info");

  declareProperty("SplitByDecayChannel",m_splitByDecayChannel=true,"If true, cutflow and final histograms will be done per decay channel .. the output channel number will end in 1,2,3");

  declareProperty("DoLowMassSelection",m_doLowMassSelection=false,"If true, will do the modified cutflow for low mass analysis");

  declareProperty("DisableTriggerMask",m_disableTriggerMask=false,"If true, will not apply run-dependent trigger selection");

  declareProperty("Lumi",m_lumi=0.,"If you specify a lumi (in nb-1), we will try to MC distributions by crossSection*kFactor*genFiltEff*lumi");

}


ZdZdPlottingAlg::~ZdZdPlottingAlg() {}


StatusCode ZdZdPlottingAlg::initialize() {

  CHECK(AAH::setProperty(chanInfo,"PrintCutflow",false)); //will print it ourselves in the finalize, so disable it here
  ServiceHandle<ITHistSvc> histSvc("THistSvc",name());
  myHist = new TH1D("myHist","myHist",19,0.5,19.5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist",myHist));
  

  myHist->GetXaxis()->SetBinLabel(1,"total Events");
  myHist->GetXaxis()->SetBinLabel(2,"Pre_Cleaning");
  myHist->GetXaxis()->SetBinLabel(3,"Pre_Primary Vertex");
  myHist->GetXaxis()->SetBinLabel(4,"Pre_Trigger");
  myHist->GetXaxis()->SetBinLabel(5,"Quad_SFO");
  myHist->GetXaxis()->SetBinLabel(6,"Quad_NotOverlaps");
  myHist->GetXaxis()->SetBinLabel(7,"Quad_Kinematic");
  myHist->GetXaxis()->SetBinLabel(8,"Quad_TriggerMatched");
  myHist->GetXaxis()->SetBinLabel(9,"Quad_DeltaR");
  myHist->GetXaxis()->SetBinLabel(10,"Quad_MuQuality");
  myHist->GetXaxis()->SetBinLabel(11,"SRHM_Isolation");
  myHist->GetXaxis()->SetBinLabel(12,"SRHM_ElectronID");
  myHist->GetXaxis()->SetBinLabel(13,"SRHM_ImpactParameter");
  myHist->GetXaxis()->SetBinLabel(14,"SRHM_QVeto ");
  myHist->GetXaxis()->SetBinLabel(15,"SRHM_LowMassVeto");
  myHist->GetXaxis()->SetBinLabel(16,"SRHM_HWinHM");
  myHist->GetXaxis()->SetBinLabel(17,"SRHM_ZVeto");
  myHist->GetXaxis()->SetBinLabel(18,"SRHM_LooseSR_HM");
  myHist->GetXaxis()->SetBinLabel(19,"SRHM_MediumSR");
  // myHist->GetXaxis()->SetBinLabel(12,"TightSR");

  //we will need the sum of weights for MC ... 
  //this usually comes from a merged channelInfo object file 
  //if no file is provided to this alg, then we will try to use 
  //the input files to normalize things 
  
  if(m_chanInfoFile=="") {
    ATH_MSG_INFO("Attempting to generate a merged channelInfo from input files");
    std::vector<std::string> inputFiles;
    Gaudi::Parsers::parse(inputFiles,AAH::getProperty("EventSelector","InputCollections")).ignore();
    
    m_inputChanInfo = new TChannelInfo("channelInfo");
    for(auto& file : inputFiles) {
      TFile* f = TFile::Open(file.c_str());
      TChannelInfo* c = static_cast<TChannelInfo*>(f->Get("Nominal/channelInfo"));
      if(c) {
        TList l; l.Add(c); m_inputChanInfo->Merge(&l);
      }
      f->Close();
      delete f;
    }
    
    
  } else {
    //open the file and obtain the channel info .. we leave the file open 
    TFile* f = TFile::Open(m_chanInfoFile.c_str());
    m_inputChanInfo = static_cast<TChannelInfo*>(f->Get("Nominal/channelInfo"));
  }
  

  return StatusCode::SUCCESS;
}

//this method is used in the execute() method to get the histogram for a given mc_channel_number (i.e. mc dataset) 
TH1* ZdZdPlottingAlg::getHist(int mc_channel_number) {
  if(m_avgMll.find(mc_channel_number)==m_avgMll.end()) {
    //new hist needed 
    TString chanName;
    if(m_splitByDecayChannel) {
      switch(mc_channel_number%10) {
        case 1: chanName="_4e";break;
        case 2: chanName="_2e2m";break;
        case 3: chanName="_4m";break;
      }

    }
    
    
    
    TString histName = Form("signal%d%s",(m_splitByDecayChannel)? mc_channel_number/10: mc_channel_number,chanName.Data());
    TString histTitle = histName;
    CamEvent evt;
    if(evt.get<double>("truth_zdzd_avgM")>0.) {
      //truth_zdzd_avgM is set in signal samples to (approx) the zd mass ... add this to the title 
      histTitle += Form(" m_{Zd} = %.1f GeV",evt.get<double>("truth_zdzd_avgM")/1000.);
    }
    
    m_avgMll[mc_channel_number] = new TH1D(histName,histTitle,64,0,64);
    histSvc()->regHist(std::string("/MYSTREAM/Nominal/") + m_avgMll[mc_channel_number]->GetName(), m_avgMll[mc_channel_number]).ignore();
  }
  return m_avgMll[mc_channel_number];
}

StatusCode ZdZdPlottingAlg::finalize() {
  ATH_MSG_INFO ("Finalizing " << name() << "...");
  //
  //Things that happen once at the end of the event loop go here
  //
  
  //normalize the histograms with the input chanInfo ..
  if(m_inputChanInfo) {
    if(m_lumi>0) {
      //try to load cross-sections from config file
      std::string path = PathResolverFindCalibFile("ZdZdPlotting/signal_mc16a_crossSections.txt");
      if(path.empty()) {
        ATH_MSG_ERROR("Could not find the cross-sections file");
        return StatusCode::FAILURE;
      }
      if( m_inputChanInfo->ReadFile(path.c_str(),"dataset_number") != 0) {
        ATH_MSG_ERROR("Problem reading the cross-sections file!");
        return StatusCode::FAILURE;
      }
    }
  
    for(auto& hist : m_avgMll) {
      int chanNum = (m_splitByDecayChannel) ? hist.first/10 : hist.first;
      if(chanNum<10) continue; //skips data (channel_number=0)
       
      ATH_MSG_DEBUG("Dividing " << hist.first << " by " << m_inputChanInfo->GetInfoContent(chanNum, "Events_All") );
      hist.second->Scale( 1. / m_inputChanInfo->GetInfoContent(chanNum, "Events_All") );
      
      if(m_lumi) {
        double crossSec = m_inputChanInfo->GetInfoContent(chanNum,"crossSection") * m_inputChanInfo->GetInfoContent(chanNum,"kFactor") * m_inputChanInfo->GetInfoContent(chanNum,"genFiltEff");
        ATH_MSG_DEBUG("Cross-section*kFactor*genFiltEff = " << crossSec << " nb");
        if(crossSec>0) {
          hist.second->Scale(crossSec*m_lumi);
        } else {
          ATH_MSG_WARNING("No cross-section for " << hist << " so leaving as efficiency!");
        }
      }
      
    }
  }
  
  
  //print the cutflow but with full precision 
  chanInfo->Scan("$cutflow","channels","%f (%ld)","$value:$entries");

  return StatusCode::SUCCESS;
}

StatusCode ZdZdPlottingAlg::execute() {  

  static const StatusCode NEXTEVENT = StatusCode::SUCCESS; //we return this to move to next event

  //here we implement the reconstruction-level cutflow ...

  CamEvent evt;
  
  int mc_channel_number = evt.get<unsigned int>("mc_channel_number");
  double evtWeight = (mc_channel_number==0) ? 1. : evt.get<double>("evtWeight") * evt.get<double>("PileupWeight");
  
  
  chanInfo->Fill(mc_channel_number,"All",evtWeight);
  myHist->Fill(1,evtWeight);
  
  
  
  ///***** Event Preselections ******
  
  ///EventCleaning
  if(!evt.get<bool>("passCleaning")) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"Cleaning",evtWeight);
  myHist->Fill(2,evtWeight);
  ///NPV
  if(!evt.get<bool>("passNPV")) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"PrimaryVertex",evtWeight);
myHist->Fill(3,evtWeight);
  
  int RunNumber = evt.get<int>("RunNumber");
  int passTriggers = evt.get<int>("passTriggers"); //bitmask of triggers that have passed, see: llllTree->GetUserInfo()->Print() for the list of triggers
  //form a bitmask for the triggers that we will look at, based on the run number
  //int triggerMask = (RunNumber<=284484)*435 + (RunNumber<=300287)*76 + (RunNumber>=296639)*44032 + (RunNumber>=296639&&RunNumber<=302393)*65536 + 20992;
  
  int triggerMask(0);
 
  if(m_disableTriggerMask) {
    triggerMask = -1; //makes all triggers active
  }
  else if(!m_doLowMassSelection) {
    triggerMask = 283136 + (RunNumber<=284484)*435 + (RunNumber<=300287)*76 + (RunNumber<=302393)*131072 + (RunNumber>=296939)*2206720 + (RunNumber>=296939&&RunNumber<=302393)*5242880;
  } else {
    //2015: mu18_mu8noL1||2mu10||2mu14||mu22_mu8noL1 , 2016: (mu20_mu8noL1 (up to end of period C) then mu22_mu8noL1)||2mu14
    triggerMask = 278528 + (RunNumber<=284484)*32 + (RunNumber<=300287)*64 + (RunNumber<=302393)*131072;
  }
  
  
  ///Trigger
  if(!(passTriggers)) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"Trigger",evtWeight);
  myHist->Fill(4,evtWeight);
  
  ///***** Quadruplet level cuts ******
  
  CamVector* ls = evt.getVector("l"); //the leptons
  CamVector* lls = evt.getVector("ll"); //the dileptons
  CamVector* lllls = evt.getVector("llll"); //the quadruplets
  
  CamObject* selected_llll = 0; //will point this at our selected quadruplet, if we find one
  
  int cfCount=(m_doLowMassSelection) ? -1 : 0; //used so that each event only contributes once
  double tmpWeight(evtWeight); //to apply different SF while looping over quadruplets
  int tmpChannel(mc_channel_number); //also flip between channels
  for(auto& llll : *lllls) {
    if(llll.get<int>("pdgIdSum")!=44) continue;//only 4e channel
    if(mc_channel_number>0) tmpWeight = evtWeight * llll.get<float>("scaleFactor");

    
    if(m_splitByDecayChannel) {
      tmpChannel = mc_channel_number*10;
      switch(llll.get<int>("pdgIdSum")) {
        case 44:
          tmpChannel += 1; //ends in 1 = 4e;
          break;
        case 48:
          tmpChannel += 2; //ends in 2 = 2e2m;
          break;
        case 52:
          tmpChannel += 3; //ends in 3 = 4m
          break;
      }
    }
  
    ///4Muons (only for low mass selection)
      if(m_doLowMassSelection) {
      if(llll.get<int>("pdgIdSum")!=52) continue; //only consider the 4mu quadruplets 
      if(cfCount<0) {cfCount++; chanInfo->Fill(tmpChannel,"FourMuons",tmpWeight);}
    }
  
    
    ///SFOS
    if(llll.get<int>("charge")!=0 || llll.get<int>("dCharge")!=0) continue;
    if(cfCount<1) {cfCount++; chanInfo->Fill(tmpChannel,"SFOS",tmpWeight);myHist->Fill(5,evtWeight);}
    ///Not Overlap removed leptons by other leptons
    //bits are: (m=muon, e=electron, j=jet. b=out-of-volume jet cleaning jet) (xy = x removed by y)
    //1 = mj
    //2 = mm
    //4 = me
    //8 = ej
    //16 = em
    //32 = ee
    //64 = mb
    //128 = eb
    //so we want 2+4+16+32 = 54
    if(llll.get<char>("overlaps")&54) continue;  if(cfCount<2) {cfCount++; chanInfo->Fill(tmpChannel,"NotOverlaps",tmpWeight);myHist->Fill(6,evtWeight);}
    
    ///kinematic cuts
    if(ls->at(llll.get<int>("l1")).Pt()<20000. || 
        ls->at(llll.get<int>("l2")).Pt()<15000. || 
       ls->at(llll.get<int>("l3")).Pt()<10000.) continue; if(cfCount<3) {cfCount++; chanInfo->Fill(tmpChannel,"Kinematic",tmpWeight);myHist->Fill(7,evtWeight);}
    
    ///trigger matching
    if(!(llll.get<int>("triggerMatched"))) continue; if(cfCount<4) {cfCount++; chanInfo->Fill(tmpChannel,"TriggerMatched",tmpWeight);myHist->Fill(8,evtWeight);}
  
    ///leading pair *not* worse than loose
    /*  if( ls->at( lls->at(llll.get<int>("ll1")).get<int>("l1") ).get<int>("quality") >=3 ) continue;
    if( ls->at( lls->at(llll.get<int>("ll1")).get<int>("l2") ).get<int>("quality") >=3 ) continue; 
    if(cfCount<5) {cfCount++; chanInfo->Fill(tmpChannel,"ElQuality",tmpWeight);myHist->Fill(9,evtWeight);}*/

 ///delta R > 0.1 (0.2) for same (opposite) flavour leptons in quadruplet
    if(!m_doLowMassSelection) {
      if(llll.get<double>("min_sf_dR")<=0.1 || llll.get<double>("min_of_dR")<=0.2) continue; 
      if(cfCount<5) {cfCount++; chanInfo->Fill(tmpChannel,"DeltaR",tmpWeight);myHist->Fill(9,evtWeight); }
    }
    
    ///not more than 1 CT or SA muon
      if(llll.get<int>("nCTorSA")>=2) continue; if(cfCount<6) {cfCount++; chanInfo->Fill(tmpChannel,"MuQuality",tmpWeight);myHist->Fill(10,evtWeight);}
  
   
    
    selected_llll = &llll;
    break; //stop looking for quadruplets
  }
  
  if(!selected_llll) return NEXTEVENT; 
  
  evtWeight = tmpWeight;
  mc_channel_number = tmpChannel;
  
  ///***** Event level cuts ******
 
  ///FixedCutLoose isolation
  //4 bits, each are for the leading,subleading,subsubleading,last lepton (leading=most significant)
  //all must be '1': 1111 = 15
  if(selected_llll->get<char>("l_isIsolFixedCutLooseHelper")!=15) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"Isolation",evtWeight);myHist->Fill(11,evtWeight);
 

  ///Electron quality (All leptons loose ID or better)
  if(ls->at(selected_llll->get<int>("l1")).get<int>("quality")>=3 ||
     ls->at(selected_llll->get<int>("l2")).get<int>("quality")>=3 ||
     ls->at(selected_llll->get<int>("l3")).get<int>("quality")>=3 ||
     ls->at(selected_llll->get<int>("l4")).get<int>("quality")>=3)  return NEXTEVENT; chanInfo->Fill(mc_channel_number,"ElectronID",evtWeight); myHist->Fill(12,evtWeight);
     
     
  ///Impact Parameter
  if(selected_llll->get<double>("max_el_d0Sig")>=5)  return NEXTEVENT; 
  if(selected_llll->get<double>("max_mu_d0Sig")>=3)  return NEXTEVENT; chanInfo->Fill(mc_channel_number,"ImpactParameter",evtWeight);myHist->Fill(13,evtWeight);

  double m12 = lls->at(selected_llll->get<int>("ll1")).M();
  double m34 = lls->at(selected_llll->get<int>("ll2")).M();
  double m32 = lls->at(selected_llll->get<int>("alt_ll1")).M();
  double m14 = lls->at(selected_llll->get<int>("alt_ll2")).M();

  ///Quarkonia Veto  
  if( fabs(m12 - 9933.)<1172. ||
      fabs(m34 - 9933.)<1172. ||
      fabs(m32 - 9933.)<1172. ||
      fabs(m14 - 9933.)<1172. ||
      fabs(m12 - 3416.)<570. ||
      fabs(m34 - 3416.)<570. ||
      fabs(m32 - 3416.)<570. ||
      fabs(m14 - 3416.)<570. )  return NEXTEVENT; chanInfo->Fill(mc_channel_number,"QVeto",evtWeight);myHist->Fill(14,evtWeight);


  ///Low Mass Veto 
  if(!m_doLowMassSelection) {
    if( m12 < 5000. || m34 < 5000. || m32 < 5000. || m14 < 5000. ) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"LowMassVeto",evtWeight);myHist->Fill(15,evtWeight);
  }


  ///H Window
  if(!m_doLowMassSelection) {
    if( selected_llll->M()<115000. || selected_llll->M()>130000. ) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"HWindow",evtWeight);myHist->Fill(16,evtWeight);
  } else {
    if( selected_llll->M()<120000. || selected_llll->M()>130000. ) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"LowMassHWindow",evtWeight);
  }
  
  
  if(!m_doLowMassSelection) {
    ///Z Veto
    if( m12 > 64000. || m34 > 64000. || m32 > 75000. || m14 > 75000. ) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"ZVeto",evtWeight);myHist->Fill(17,evtWeight);
    ///Loose SR
    if( m12 <10000.  || m34 < 10000. ) return NEXTEVENT;  chanInfo->Fill(mc_channel_number,"LooseSR",evtWeight);myHist->Fill(18,evtWeight);
  } else {
    ///Low Mass Loose SR
    if( m12 < 880. || m34 < 880. || m12 > 15000. || m34 > 15000. ) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"LowMassLooseSR",evtWeight);
  }
  
  ///Medium SR
  if( m34/m12 < 0.85 ) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"MediumSR",evtWeight);myHist->Fill(19,evtWeight);
  
  

  getHist(mc_channel_number)->Fill( (m12+m34)/2000. , evtWeight );

  return StatusCode::SUCCESS;
}

StatusCode ZdZdPlottingAlg::beginInputFile() { 
  ATH_MSG_INFO("Processing " << currentFile()->GetName() << "...");
  return StatusCode::SUCCESS;
}


