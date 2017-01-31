 // ZdZdPlotting includes
#include "ZdZdPlottingAlg.h"

#include "AnalysisCamEvent/CamEvent.h"


//uncomment the line below to use the HistSvc for outputting trees and histograms
#include "GaudiKernel/ITHistSvc.h"
#include "TTree.h"
#include "TH1D.h"
#include "TH2D.h"
#include <TStyle.h>
#include <TCanvas.h>

bool CamObject::AutoSetTLV = true; //automatically fills the TLorentzVector properties of objects if it can


ZdZdPlottingAlg::ZdZdPlottingAlg( const std::string& name, ISvcLocator* pSvcLocator ) : CamAlgorithm( name, pSvcLocator ),
  chanInfo("ChannelInfoTool/channelInfo") {
  

}


ZdZdPlottingAlg::~ZdZdPlottingAlg() {}


StatusCode ZdZdPlottingAlg::initialize() {
  ATH_MSG_INFO ("Initializing " << name() << "...");
  //
  //This is called once, before the start of the event loop
  //Retrieves of tools you have configured in the joboptions go here
  //

  //HERE IS AN EXAMPLE
  //We will create a histogram and a ttree and register them to the histsvc
  //Remember to uncomment the configuration of the histsvc stream in the joboptions
  //
   ServiceHandle<ITHistSvc> histSvc("THistSvc",name());
     myHist_HM_all = new TH1D("myHist_HM_all","myHist_HM_all",20,0.5,20.5);
   CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_all", myHist_HM_all) );

   myHist_HM_4e = new TH1D("myHist_HM_4e","myHist_HM_4e",19,0.5,19.5);
   CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_4e", myHist_HM_4e) );
   myHist_HM_2e2m = new TH1D("myHist_HM_2e2m","myHist_HM_2e2m",20,0.5,20.5);
   CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_2e2m", myHist_HM_2e2m) );
   myHist_HM_4m = new TH1D("myHist_HM_4m","myHist_HM_4m",18,0.5,18.5);
   CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_4m", myHist_HM_4m) );

  //DeltaM vs SigM plots HM

     myHist_DeltaM_vs_SigM_all_HM = new TH2D("myHist_DeltaM_vs_SigM_all_HM","myHist_DeltaM_vs_SigM_all_HM",10,25,35,5,0,5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_all_HM", myHist_DeltaM_vs_SigM_all_HM) );

  myHist_DeltaM_vs_SigM_4e_HM = new TH2D("myHist_DeltaM_vs_SigM_4e_HM","myHist_DeltaM_vs_SigM_4e_HM",10,25,35,5,0,5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_4e_HM",myHist_DeltaM_vs_SigM_4e_HM) );
  myHist_DeltaM_vs_SigM_2e2m_HM = new TH2D("myHist_DeltaM_vs_SigM_2e2m_HM","myHist_DeltaM_vs_SigM_2e2m_HM",10,25,35,5,0,5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_2e2m_HM", myHist_DeltaM_vs_SigM_2e2m_HM) );
  myHist_DeltaM_vs_SigM_4m_HM = new TH2D("myHist_DeltaM_vs_SigM_4m_HM","myHist_DeltaM_vs_SigM_4m_HM",10,25,35,5,0,5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_4m_HM",myHist_DeltaM_vs_SigM_4m_HM) );

//DeltaMoMmax plots HM
  myHist_HM_DeltaMoMmax = new TH1D("myHist_HM_DeltaMoMmax","myHist_HM_DeltaMoMmax",300,0,0.3);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_DeltaMoMmax",myHist_HM_DeltaMoMmax)); 

   myHist_HM_4e_DeltaMoMmax = new TH1D("myHist_HM_4e_DeltaMoMmax","myHist_HM_4e_DeltaMoMmax",300,0,0.3);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_4e_DeltaMoMmax",myHist_HM_4e_DeltaMoMmax)); 
   myHist_HM_2e2m_DeltaMoMmax = new TH1D("myHist_HM_2e2m_DeltaMoMmax","myHist_HM_2e2m_DeltaMoMmax",300,0,0.3);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_2e2m_DeltaMoMmax",myHist_HM_2e2m_DeltaMoMmax)); 
   myHist_HM_4m_DeltaMoMmax = new TH1D("myHist_HM_4m_DeltaMoMmax","myHist_HM_4m_DeltaMoMmax",300,0,0.3);
   CHECK( histSvc->regHist("/MYSTREAM/myHist_HM_4m_DeltaMoMmax",myHist_HM_4m_DeltaMoMmax));  


 //registers histogram to output stream (like SetDirectory in EventLoop)
  //deltaR12 4e
    myHist_DeltaR12_4e_channel_HM = new TH1D("myHist_DeltaR12_4e_channel_HM","myHist_DeltaR12_4e_channel_HM",60,0,6);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR12_4e_channel_HM", myHist_DeltaR12_4e_channel_HM) );
  //deltaR12 2e2m
  myHist_DeltaR12_2e2m_channel_HM = new TH1D("myHist_DeltaR12_2e2m_channel_HM","myHist_DeltaR12_2e2m_channel_HM",60,0,6);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR12_2e2m_channel_HM", myHist_DeltaR12_2e2m_channel_HM) );
  //deltaR12 4m
  myHist_DeltaR12_4m_channel_HM = new TH1D("myHist_DeltaR12_4m_channel_HM","myHist_DeltaR12_4m_channel_HM",60,0,6);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR12_4m_channel_HM", myHist_DeltaR12_4m_channel_HM) );
  //deltaR34 4e
  myHist_DeltaR34_4e_channel_HM = new TH1D("myHist_DeltaR34_4e_channel_HM","myHist_DeltaR34_4e_channel_HM",60,0,6);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR34_4e_channel_HM", myHist_DeltaR34_4e_channel_HM) );
  //deltaR34 2e2m
  myHist_DeltaR34_2e2m_channel_HM = new TH1D("myHist_DeltaR34_2e2m_channel_HM","myHist_DeltaR34_2e2m_channel_HM",60,0,6);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR34_2e2m_channel_HM", myHist_DeltaR34_2e2m_channel_HM) );
  //deltaR34 4m
  myHist_DeltaR34_4m_channel_HM = new TH1D("myHist_DeltaR34_4m_channel_HM","myHist_DeltaR34_4m_channel_HM",60,0,6);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR34_4m_channel_HM", myHist_DeltaR34_4m_channel_HM) );


    myHist_HM_all->GetXaxis()->SetBinLabel(1,"total Events");
  myHist_HM_all->GetXaxis()->SetBinLabel(2,"Cleaning");
  myHist_HM_all->GetXaxis()->SetBinLabel(3,"Primary Vertex");
  myHist_HM_all->GetXaxis()->SetBinLabel(4,"Trigger");
//myHist_HM_all->GetXaxis()->SetBinLabel(5,"Muon Quality");
  myHist_HM_all->GetXaxis()->SetBinLabel(5,"SFO");
  myHist_HM_all->GetXaxis()->SetBinLabel(6,"NotOverlaps");
  myHist_HM_all->GetXaxis()->SetBinLabel(7,"Kinematic");
  myHist_HM_all->GetXaxis()->SetBinLabel(8,"Trigger Matched");
  myHist_HM_all->GetXaxis()->SetBinLabel(9,"e Quality (12)");
  myHist_HM_all->GetXaxis()->SetBinLabel(10,"Muon Quality");
  myHist_HM_all->GetXaxis()->SetBinLabel(11,"Delta R");
  myHist_HM_all->GetXaxis()->SetBinLabel(12,"Isolation");
  myHist_HM_all->GetXaxis()->SetBinLabel(13,"Electron ID");
  myHist_HM_all->GetXaxis()->SetBinLabel(14,"Impact Parameter");
  myHist_HM_all->GetXaxis()->SetBinLabel(15,"QVeto ");
  myHist_HM_all->GetXaxis()->SetBinLabel(16,"HWindow");
  myHist_HM_all->GetXaxis()->SetBinLabel(17,"Z Veto");
  myHist_HM_all->GetXaxis()->SetBinLabel(18,"Loose SR");
  myHist_HM_all->GetXaxis()->SetBinLabel(19,"Medium SR");
  myHist_HM_all->GetXaxis()->SetBinLabel(20,"TightSR");

  myHist_HM_4e->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_HM_4e->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_HM_4e->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_HM_4e->GetXaxis()->SetBinLabel(4,"Trigger");
 //myHist_HM_all->GetXaxis()->SetBinLabel(5,"Muon Quality");
 myHist_HM_4e->GetXaxis()->SetBinLabel(5,"SFO");
 myHist_HM_4e->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_HM_4e->GetXaxis()->SetBinLabel(7,"Kinematic");
 myHist_HM_4e->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 myHist_HM_4e->GetXaxis()->SetBinLabel(9,"e Quality (12)");
 myHist_HM_4e->GetXaxis()->SetBinLabel(10,"Delta R");
 myHist_HM_4e->GetXaxis()->SetBinLabel(11,"Isolation");
 myHist_HM_4e->GetXaxis()->SetBinLabel(12,"Electron ID");
 myHist_HM_4e->GetXaxis()->SetBinLabel(13,"Impact Parameter");
 myHist_HM_4e->GetXaxis()->SetBinLabel(14,"QVeto ");
 myHist_HM_4e->GetXaxis()->SetBinLabel(15,"HWindow");
 myHist_HM_4e->GetXaxis()->SetBinLabel(16,"Z Veto");
 myHist_HM_4e->GetXaxis()->SetBinLabel(17,"Loose SR");
 myHist_HM_4e->GetXaxis()->SetBinLabel(18,"Medium SR");
 myHist_HM_4e->GetXaxis()->SetBinLabel(19,"TightSR");

 myHist_HM_2e2m->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(4,"Trigger");
//myHist_HM_2e2m->GetXaxis()->SetBinLabel(5,"Muon Quality");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(5,"SFO");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(7,"Kinematic");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(9,"e Quality (12)");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(10,"Muon Quality");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(11,"Delta R");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(12,"Isolation");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(13,"Electron ID");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(14,"Impact Parameter");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(15,"QVeto ");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(16,"HWindow");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(17,"Z Veto");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(18,"Loose SR");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(19,"Medium SR");
 myHist_HM_2e2m->GetXaxis()->SetBinLabel(20,"TightSR");


 myHist_HM_4m->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_HM_4m->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_HM_4m->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_HM_4m->GetXaxis()->SetBinLabel(4,"Trigger");
 myHist_HM_4m->GetXaxis()->SetBinLabel(5,"SFO");
 myHist_HM_4m->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_HM_4m->GetXaxis()->SetBinLabel(7,"Kinematic");
 myHist_HM_4m->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 myHist_HM_4m->GetXaxis()->SetBinLabel(9,"Muon Quality");
 myHist_HM_4m->GetXaxis()->SetBinLabel(10,"Delta R");
 myHist_HM_4m->GetXaxis()->SetBinLabel(11,"Isolation");
 myHist_HM_4m->GetXaxis()->SetBinLabel(12,"Impact Parameter");
 myHist_HM_4m->GetXaxis()->SetBinLabel(13,"QVeto ");
 myHist_HM_4m->GetXaxis()->SetBinLabel(14,"HWindow");
 myHist_HM_4m->GetXaxis()->SetBinLabel(15,"Z Veto");
 myHist_HM_4m->GetXaxis()->SetBinLabel(16,"Loose SR");
 myHist_HM_4m->GetXaxis()->SetBinLabel(17,"Medium SR");
 myHist_HM_4m->GetXaxis()->SetBinLabel(18,"TightSR");


    //---------------------LM-------------------------------//
  myHist_LM_all = new TH1D("myHist_LM_all","myHist_LM_all",17,0.5,17.5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_LM_all", myHist_LM_all) );
 myHist_LM_4e = new TH1D("myHist_LM_4e","myHist_LM_4e",16,0.5,16.5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_LM_4e", myHist_LM_4e) ); //registers histogram to output stream (like SetDirectory in EventLoop)
myHist_LM_2e2m = new TH1D("myHist_LM_2e2m","myHist_LM_2e2m",17,0.5,17.5);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_LM_2e2m", myHist_LM_2e2m) );
myHist_LM_4m = new TH1D("myHist_LM_4m","myHist_LM_4m",15,0.5,15.5);
CHECK( histSvc->regHist("/MYSTREAM/myHist_LM_4m", myHist_LM_4m) );

  //DeltaM vs SigM plots LM

 myHist_DeltaM_vs_SigM_all_LM = new TH2D("myHist_DeltaM_vs_SigM_all_LM","myHist_DeltaM_vs_SigM_all_LM",4,8,12,2,0,2);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_all_LM", myHist_DeltaM_vs_SigM_all_LM) );

  myHist_DeltaM_vs_SigM_4e_LM = new TH2D("myHist_DeltaM_vs_SigM_4e_LM","myHist_DeltaM_vs_SigM_4e_LM",4,8,12,2,0,2);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_4e_LM",myHist_DeltaM_vs_SigM_4e_LM) );
  myHist_DeltaM_vs_SigM_2e2m_LM = new TH2D("myHist_DeltaM_vs_SigM_2e2m_LM","myHist_DeltaM_vs_SigM_2e2m_LM",4,8,12,2,0,2);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_2e2m_LM", myHist_DeltaM_vs_SigM_2e2m_LM) );
  myHist_DeltaM_vs_SigM_4m_LM = new TH2D("myHist_DeltaM_vs_SigM_4m_LM","myHist_DeltaM_vs_SigM_4m_LM",4,8,12,2,0,2);
  CHECK( histSvc->regHist("/MYSTREAM/myHist_DeltaM_vs_SigM_4m_LM",myHist_DeltaM_vs_SigM_4m_LM) );


  //deltaR12 4e
   myHist_DeltaR12_4e_channel_LM = new TH1D("myHist_DeltaR12_4e_channel_LM","myHist_DeltaR12_4e_channel_LM",100,0,0.5);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR12_4e_channel_LM", myHist_DeltaR12_4e_channel_LM) );
  //deltaR12 2e2m
  myHist_DeltaR12_2e2m_channel_LM = new TH1D("myHist_DeltaR12_2e2m_channel_LM","myHist_DeltaR12_2e2m_channel_LM",100,0,0.5);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR12_2e2m_channel_LM", myHist_DeltaR12_2e2m_channel_LM) );
  //deltaR12 4m
  myHist_DeltaR12_4m_channel_LM = new TH1D("myHist_DeltaR12_4m_channel_LM","myHist_DeltaR12_4m_channel_LM",100,0,0.5);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR12_4m_channel_LM", myHist_DeltaR12_4m_channel_LM) );
  //deltaR34 4e
  myHist_DeltaR34_4e_channel_LM = new TH1D("myHist_DeltaR34_4e_channel_LM","myHist_DeltaR34_4e_channel_LM",100,0,0.5);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR34_4e_channel_LM", myHist_DeltaR34_4e_channel_LM) );
  //deltaR34 2e2m
  myHist_DeltaR34_2e2m_channel_LM = new TH1D("myHist_DeltaR34_2e2m_channel_LM","myHist_DeltaR34_2e2m_channel_LM",100,0,0.5);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR34_2e2m_channel_LM", myHist_DeltaR34_2e2m_channel_LM) );
  //deltaR34 4m
  myHist_DeltaR34_4m_channel_LM = new TH1D("myHist_DeltaR34_4m_channel_LM","myHist_DeltaR34_4m_channel_LM",100,0,0.5);
  CHECK(histSvc->regHist("/MYSTREAM/myHist_DeltaR34_4m_channel_LM", myHist_DeltaR34_4m_channel_LM) );


   myHist_LM_all->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_LM_all->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_LM_all->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_LM_all->GetXaxis()->SetBinLabel(4,"Trigger");
 myHist_LM_all->GetXaxis()->SetBinLabel(5,"SFOS");
 myHist_LM_all->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_LM_all->GetXaxis()->SetBinLabel(7,"Kinematic");
 // myHist_LM_all->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 myHist_LM_all->GetXaxis()->SetBinLabel(8,"e Quality (12)");
 myHist_LM_all->GetXaxis()->SetBinLabel(9,"Muon Quality");
 // myHist_LM_all->GetXaxis()->SetBinLabel(11,"Delta R");
 myHist_LM_all->GetXaxis()->SetBinLabel(10,"Isolation");
 myHist_LM_all->GetXaxis()->SetBinLabel(11,"Electron ID");
 myHist_LM_all->GetXaxis()->SetBinLabel(12,"Impact Parameter");
 myHist_LM_all->GetXaxis()->SetBinLabel(13,"QVeto ");
 myHist_LM_all->GetXaxis()->SetBinLabel(14,"HWindow ");
 myHist_LM_all->GetXaxis()->SetBinLabel(15,"Z Veto");
 // myHist_LM_all->GetXaxis()->SetBinLabel(15,"Loose SR");
 myHist_LM_all->GetXaxis()->SetBinLabel(16,"Medium SR");
 myHist_LM_all->GetXaxis()->SetBinLabel(17,"TightSR");

 myHist_LM_4e->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_LM_4e->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_LM_4e->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_LM_4e->GetXaxis()->SetBinLabel(4,"Trigger");
 myHist_LM_4e->GetXaxis()->SetBinLabel(5,"SFO");
 myHist_LM_4e->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_LM_4e->GetXaxis()->SetBinLabel(7,"Kinematic");
 // myHist_LM_4e->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 myHist_LM_4e->GetXaxis()->SetBinLabel(8,"e Quality (12)");
 //myHist_LM_4e->GetXaxis()->SetBinLabel(9,"Muon Quality");
 // myHist_LM_4e->GetXaxis()->SetBinLabel(11,"Delta R");
 myHist_LM_4e->GetXaxis()->SetBinLabel(9,"Isolation");
 myHist_LM_4e->GetXaxis()->SetBinLabel(10,"Electron ID");
 myHist_LM_4e->GetXaxis()->SetBinLabel(11,"Impact Parameter");
 myHist_LM_4e->GetXaxis()->SetBinLabel(12,"QVeto ");
 myHist_LM_4e->GetXaxis()->SetBinLabel(13,"HWindow ");
 myHist_LM_4e->GetXaxis()->SetBinLabel(14,"Z Veto");
 // myHist_LM_4e->GetXaxis()->SetBinLabel(15,"Loose SR");
 myHist_LM_4e->GetXaxis()->SetBinLabel(15,"Medium SR");
 myHist_LM_4e->GetXaxis()->SetBinLabel(16,"TightSR");

 myHist_LM_2e2m->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(4,"Trigger");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(5,"SFO");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(7,"Kinematic");
 // myHist_LM_2e2m->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(8,"e Quality (12)");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(9,"Muon Quality");
 // myHist_LM_2e2m->GetXaxis()->SetBinLabel(11,"Delta R");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(10,"Isolation");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(11,"Electron ID");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(12,"Impact Parameter");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(13,"QVeto ");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(14,"HWindow ");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(15,"Z Veto");
 // myHist_LM_2e2m->GetXaxis()->SetBinLabel(15,"Loose SR");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(16,"Medium SR");
 myHist_LM_2e2m->GetXaxis()->SetBinLabel(17,"TightSR");

 myHist_LM_4m->GetXaxis()->SetBinLabel(1,"total Events");
 myHist_LM_4m->GetXaxis()->SetBinLabel(2,"Cleaning");
 myHist_LM_4m->GetXaxis()->SetBinLabel(3,"Primary Vertex");
 myHist_LM_4m->GetXaxis()->SetBinLabel(4,"Trigger");
 myHist_LM_4m->GetXaxis()->SetBinLabel(5,"SFO");
 myHist_LM_4m->GetXaxis()->SetBinLabel(6,"NotOverlaps");
 myHist_LM_4m->GetXaxis()->SetBinLabel(7,"Kinematic");
 // myHist_LM_4m->GetXaxis()->SetBinLabel(8,"Trigger Matched");
 //myHist_LM_4m->GetXaxis()->SetBinLabel(8,"e Quality (12)");
 myHist_LM_4m->GetXaxis()->SetBinLabel(8,"Muon Quality");
 // myHist_LM_4m->GetXaxis()->SetBinLabel(11,"Delta R");
 myHist_LM_4m->GetXaxis()->SetBinLabel(9,"Isolation");
 // myHist_LM_4m->GetXaxis()->SetBinLabel(10,"Electron ID");
 myHist_LM_4m->GetXaxis()->SetBinLabel(10,"Impact Parameter");
 myHist_LM_4m->GetXaxis()->SetBinLabel(11,"QVeto ");
 myHist_LM_4m->GetXaxis()->SetBinLabel(12,"HWindow ");
 myHist_LM_4m->GetXaxis()->SetBinLabel(13,"Z Veto");
 // myHist_LM_4m->GetXaxis()->SetBinLabel(15,"Loose SR");
 myHist_LM_4m->GetXaxis()->SetBinLabel(14,"Medium SR");
 myHist_LM_4m->GetXaxis()->SetBinLabel(15,"TightSR");

  //myTree = new TTree("myTree","myTree");
  // CHECK( histSvc->regTree("/MYSTREAM/myTree", myTree) ); //registers tree to output stream (like SetDirectory in EventLoop) inside a sub-directory
  


 m_massPoints[302073] = 0.5;//my.output.29.3.root
 m_massPoints[302074] = 1.0;//my.output.29.14.root
 m_massPoints[302075] = 2.0;//my.output.29.4.root
 m_massPoints[302076] = 5.;//my.output.29.13.root
 m_massPoints[302077] = 10.;//my.output.29.8.root
 m_massPoints[302078] = 15.;//my.output.29.5.root
 m_massPoints[302079] = 20.;//my.output.29.11.root
 m_massPoints[302080] = 25.;//my.output.29.6.root
 m_massPoints[302081] = 30.;//my.output.29.7.root
 m_massPoints[302082] = 35.;//my.output.29.0.root
 m_massPoints[302083] = 40.;
 m_massPoints[302084] = 45.;//my.output.29.1.root
 m_massPoints[302085] = 55.;//my.output.29.2.root
 m_massPoints[302086] = 55.;//my.output.29.9.root
 m_massPoints[302087] = 60.;//my.output.29.12.root

  return StatusCode::SUCCESS;
}

StatusCode ZdZdPlottingAlg::finalize() {
  ATH_MSG_INFO ("Finalizing " << name() << "...");
  //
  //Things that happen once at the end of the event loop go here
  //

  return StatusCode::SUCCESS;
}

StatusCode ZdZdPlottingAlg::execute() {  
  ATH_MSG_DEBUG ("Executing " << name() << "...");

  static const StatusCode NEXTEVENT = StatusCode::SUCCESS; //we return this to move to next event

  //here we implement the reconstruction-level cutflow ...

  CamEvent evt;
  CamVector* ls = evt.getVector("l"); //the leptons
  CamVector* lls = evt.getVector("ll"); //the dileptons
  CamVector* lllls = evt.getVector("llll"); //the quadruplets
  
  double evtWeight = evt.get<double>("evtWeight");
  int mc_channel_number = evt.get<unsigned int>("mc_channel_number");
  // int EventNumber = evt.get<int>("EventNumber");


  // std::printf("Integers %d\n", l_pdgIdSum);
  //  if (mc_channel_number == 302077){
  
  /*  chanInfo->Fill(mc_channel_number,"All",evtWeight);
   myHist_HM_all->Fill(1,evtWeight);   
   myHist_HM_4e->Fill(1,evtWeight); 
   myHist_HM_2e2m->Fill(1,evtWeight);
   myHist_HM_4m->Fill(1,evtWeight);
  
  
  
  ///***** Event Preselections ******
  
  ///EventCleaning
  if(!evt.get<bool>("passCleaning")) return NEXTEVENT;
  chanInfo->Fill(mc_channel_number,"Cleaning",evtWeight);
  myHist_HM_all->Fill(2,evtWeight);
  myHist_HM_4e->Fill(2,evtWeight);
  myHist_HM_2e2m->Fill(2,evtWeight);
  myHist_HM_4m->Fill(2,evtWeight);
  
  ///NPV
  if(!evt.get<bool>("passNPV")) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"PrimaryVertex",evtWeight);
  myHist_HM_all->Fill(3,evtWeight);
  myHist_HM_4e->Fill(3,evtWeight);
  myHist_HM_2e2m->Fill(3,evtWeight);
  myHist_HM_4m->Fill(3,evtWeight); 
  int RunNumber = evt.get<int>("RunNumber");
  int passTriggers = evt.get<int>("passTriggers"); //bitmask of triggers that have passed, see: llllTree->GetUserInfo()->Print() for the list of triggers
  //form a bitmask for the triggers that we will look at, based on the run number
  int triggerMask = (RunNumber<=284484)*435 + (RunNumber<=300287)*76 + (RunNumber>=296639)*44032 + (RunNumber>=296639&&RunNumber<=302393)*65536 + 20992;
 
  ///Trigger
  if(!(passTriggers&triggerMask)) return NEXTEVENT;  chanInfo->Fill(mc_channel_number,"Trigger",evtWeight);
  myHist_HM_all->Fill(4,evtWeight);
  myHist_HM_4e->Fill(4,evtWeight); 
  myHist_HM_2e2m->Fill(4,evtWeight);
  myHist_HM_4m->Fill(4,evtWeight); 
  ///***** Quadruplet level cuts ******
  
  // CamVector* ls = evt.getVector("l"); //the leptons
  // CamVector* lls = evt.getVector("ll"); //the dileptons
  // CamVector* lllls = evt.getVector("llll"); //the quadruplets
  
  CamObject* selected_llll = 0; //will point this at our selected quadruplet, if we find one
  
  int cfCount=0; //used so that each event only contributes once
 
  for(auto& llll : *lllls) {

      int llll_pdgIdSum = llll.get<int>("pdgIdSum");
      //     int EventNumber = llll.get<int>("EventNumber");  
       if( (llll_pdgIdSum!=44) && (llll_pdgIdSum!=48) && (llll_pdgIdSum!=52) ) continue;




///not more than 1 CT or SA muon
 //    if(llll.get<int>("nCTorSA")>=2) continue; 
   //  if(cfCount<1 ) {cfCount++; 
      // chanInfo->Fill(mc_channel_number,"MuQuality_all",evtWeight);myHist_HM_all->Fill(5,evtWeight);
       //  if(llll_pdgIdSum == 44)  {chanInfo->Fill(mc_channel_number,"MuQuality_el",evtWeight); myHist_HM_4e->Fill(5,evtWeight);}
        // if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"MuQuality_el_mu",evtWeight);myHist_HM_2e2m->Fill(5,evtWeight);}
//	  if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"MuQuality_mu",evtWeight);myHist_HM_4m->Fill(5,evtWeight);}
  //   }

    ///SFOS
       if(llll.get<int>("charge")!=0 || llll.get<int>("dCharge")!=0) continue;
     if(cfCount<1) {cfCount++;
       chanInfo->Fill(mc_channel_number,"SFOS_all",evtWeight); myHist_HM_all->Fill(5,evtWeight);
        if(llll_pdgIdSum == 44)  {chanInfo->Fill(mc_channel_number,"SFOS_el",evtWeight); myHist_HM_4e->Fill(5,evtWeight);}
	 if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"SFOS_el_mu",evtWeight);myHist_HM_2e2m->Fill(5,evtWeight);}
	  if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"SFOS_mu",evtWeight);myHist_HM_4m->Fill(5,evtWeight);}
}
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
    if(llll.get<char>("overlaps")&54) continue;  
    if(cfCount<2) {cfCount++; 
       chanInfo->Fill(mc_channel_number,"NotOverlaps_all",evtWeight);  myHist_HM_all->Fill(6,evtWeight);
       if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"NotOverlaps_el",evtWeight);  myHist_HM_4e->Fill(6,evtWeight); }
        if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"NotOverlaps_el_mu",evtWeight);myHist_HM_2e2m->Fill(6,evtWeight);}
	 if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"NotOverlaps_mu",evtWeight);myHist_HM_4m->Fill(6,evtWeight);}
    }
    
    ///kinematic cuts
    if(ls->at(llll.get<int>("l1")).Pt()<20000. || 
        ls->at(llll.get<int>("l2")).Pt()<15000. || 
       ls->at(llll.get<int>("l3")).Pt()<10000.) continue; 
if(cfCount<3) {cfCount++; 
  chanInfo->Fill(mc_channel_number,"Kinematic_all",evtWeight); myHist_HM_all->Fill(7,evtWeight);
   if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"Kinematic_el",evtWeight); myHist_HM_4e->Fill(7,evtWeight); }
   if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"Kinematic_el_mu",evtWeight);myHist_HM_2e2m->Fill(7,evtWeight); }
    if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"Kinematic_mu",evtWeight);myHist_HM_4m->Fill(7,evtWeight); }
 }
    
    ///trigger matching
    if(!(llll.get<int>("triggerMatched")&triggerMask)) continue; 
    if(cfCount<4) {cfCount++; 
       chanInfo->Fill(mc_channel_number,"TriggerMatched_all",evtWeight); myHist_HM_all->Fill(8,evtWeight);
        if(llll_pdgIdSum == 44)   { chanInfo->Fill(mc_channel_number,"TriggerMatched_el",evtWeight); myHist_HM_4e->Fill(8,evtWeight); }
        if(llll_pdgIdSum == 48)    {chanInfo->Fill(mc_channel_number,"TriggerMatched_el_mu",evtWeight);myHist_HM_2e2m->Fill(8,evtWeight); }
	  if(llll_pdgIdSum == 52)    {chanInfo->Fill(mc_channel_number,"TriggerMatched_mu",evtWeight); myHist_HM_4m->Fill(8,evtWeight);}
}
  
    ///leading pair *not* worse than loose
    if( ls->at( lls->at(llll.get<int>("ll1")).get<int>("l1") ).get<int>("quality") >=3 ) continue;
    if( ls->at( lls->at(llll.get<int>("ll1")).get<int>("l2") ).get<int>("quality") >=3 ) continue; 
    if(cfCount<5) {cfCount++; 
      chanInfo->Fill(mc_channel_number,"ElQuality_all",evtWeight); myHist_HM_all->Fill(9,evtWeight);
       if(llll_pdgIdSum == 44)   { chanInfo->Fill(mc_channel_number,"ElQuality_el",evtWeight); myHist_HM_4e->Fill(9,evtWeight); }
        if(llll_pdgIdSum == 48)   { chanInfo->Fill(mc_channel_number,"ElQuality_el_mu",evtWeight);myHist_HM_2e2m->Fill(9,evtWeight);}
	// if(llll_pdgIdSum == 52)  {  chanInfo->Fill(mc_channel_number,"ElQuality_mu",evtWeight);}

}
      
  // ///not more than 1 CT or SA muon
    if(llll.get<int>("nCTorSA")>=2) continue; 
    if(cfCount<6 ) {cfCount++; 
   chanInfo->Fill(mc_channel_number,"MuQuality_all",evtWeight);myHist_HM_all->Fill(10,evtWeight);
 // if(llll_pdgIdSum == 44)  {chanInfo->Fill(mc_channel_number,"MuQuality_el",evtWeight); myHist_HM_4e->Fill(10,evtWeight);}
  	  if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"MuQuality_el_mu",evtWeight);myHist_HM_2e2m->Fill(10,evtWeight);}
   if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"MuQuality_mu",evtWeight);myHist_HM_4m->Fill(9,evtWeight);}
    }
  
    ///delta R > 0.1 (0.2) for same (opposite) flavour leptons in quadruplet
      if(llll.get<double>("min_sf_dR")<=0.1 || llll.get<double>("min_of_dR")<=0.2) continue; 
     if(cfCount<7) {cfCount++; 
       chanInfo->Fill(mc_channel_number,"DeltaR_all",evtWeight); myHist_HM_all->Fill(11,evtWeight);
         if(llll_pdgIdSum == 44)  {chanInfo->Fill(mc_channel_number,"DeltaR_el",evtWeight); myHist_HM_4e->Fill(10,evtWeight);}
        if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"DeltaR_el_mu",evtWeight);myHist_HM_2e2m->Fill(11,evtWeight);}
	 if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"DeltaR_mu",evtWeight);myHist_HM_4m->Fill(10,evtWeight);}
    }
    
    selected_llll = &llll;
    break; //stop looking for quadruplets
  }
  
   if(!selected_llll) return NEXTEVENT; 
  
  ///***** Event level cuts ******
 
  ///FixedCutLoose isolation
  //4 bits, each are for the leading,subleading,subsubleading,last lepton (leading=most significant)
  //all must be '1': 1111 = 15
   int llll_pdgIdSum = selected_llll->get<int>("pdgIdSum"); 
   if(selected_llll->get<char>("l_isIsolFixedCutLoose")!=15) return NEXTEVENT;
  chanInfo->Fill(mc_channel_number,"Isolation_all",evtWeight); myHist_HM_all->Fill(12,evtWeight);
  if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"Isolation_el",evtWeight); myHist_HM_4e->Fill(11,evtWeight); }
   if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"Isolation_el_mu",evtWeight);myHist_HM_2e2m->Fill(12,evtWeight); }
     if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"Isolation_mu",evtWeight);myHist_HM_4m->Fill(11,evtWeight);}



 ///Electron quality (All leptons loose ID or better)
 if(ls->at(selected_llll->get<int>("l1")).get<int>("quality")>=3 ||
    ls->at(selected_llll->get<int>("l2")).get<int>("quality")>=3 ||
    ls->at(selected_llll->get<int>("l3")).get<int>("quality")>=3 ||
    ls->at(selected_llll->get<int>("l4")).get<int>("quality")>=3)  return NEXTEVENT; 
  chanInfo->Fill(mc_channel_number,"ElectronID_all",evtWeight); myHist_HM_all->Fill(13,evtWeight);
  if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"ElectronID_el",evtWeight); myHist_HM_4e->Fill(12,evtWeight); }
   if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"ElectronID_el_mu",evtWeight);myHist_HM_2e2m->Fill(13,evtWeight);}
   // if(llll_pdgIdSum == 52)  chanInfo->Fill(mc_channel_number,"ElectronID_mu",evtWeight);


     
     
  ///Impact Parameter
 if(selected_llll->get<double>("max_el_d0Sig")>=5)  return NEXTEVENT; 
 if(selected_llll->get<double>("max_mu_d0Sig")>=3)  return NEXTEVENT;
 chanInfo->Fill(mc_channel_number,"ImpactParameter_all",evtWeight); myHist_HM_all->Fill(14,evtWeight);
  if(llll_pdgIdSum == 44){ chanInfo->Fill(mc_channel_number,"ImpactParameter_el",evtWeight); myHist_HM_4e->Fill(13,evtWeight);}
 if(llll_pdgIdSum == 48) {chanInfo->Fill(mc_channel_number,"ImpactParameter_el_mu",evtWeight);myHist_HM_2e2m->Fill(14,evtWeight);}
  if(llll_pdgIdSum == 52) {chanInfo->Fill(mc_channel_number,"ImpactParameter_mu",evtWeight);myHist_HM_4m->Fill(12,evtWeight);}

double m12 = lls->at(selected_llll->get<int>("ll1")).M();
 double m34 = lls->at(selected_llll->get<int>("ll2")).M();
 double m32 = lls->at(selected_llll->get<int>("alt_ll1")).M();
 double m14 = lls->at(selected_llll->get<int>("alt_ll2")).M();

 
  //Quarkonia Veto
   if( fabs(m12 - 10000.)<1000. ||
    fabs(m34 - 10000.)<1000. ||
    fabs(m32 - 10000.)<1000. ||
    fabs(m14 - 10000.)<1000. ||
    fabs(m12 - 3000.)<1000. ||
    fabs(m34 - 3000.)<1000. ||
    fabs(m32 - 3000.)<1000. ||
    fabs(m14 - 3000.)<1000. )  return NEXTEVENT;
  chanInfo->Fill(mc_channel_number,"QVeto_all",evtWeight); myHist_HM_all->Fill(15,evtWeight); 
   if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"QVeto_el",evtWeight); myHist_HM_4e->Fill(14,evtWeight); }
   if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"QVeto_el_mu",evtWeight);myHist_HM_2e2m->Fill(15,evtWeight);}
   if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"QVeto_mu",evtWeight);myHist_HM_4m->Fill(13,evtWeight);}


  ///H Window
    if( selected_llll->M()<115000. || selected_llll->M()>130000. ) return NEXTEVENT;
  //myHist->Fill(m12,evtWeight);
  chanInfo->Fill(mc_channel_number,"HWindow_all",evtWeight); myHist_HM_all->Fill(16,evtWeight);
   if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"HWindow_el",evtWeight); myHist_HM_4e->Fill(15,evtWeight);}
   if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"HWindow_el_mu",evtWeight);myHist_HM_2e2m->Fill(16,evtWeight);}
   if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"HWindow_mu",evtWeight); myHist_HM_4m->Fill(14,evtWeight); }

  ///Z Veto
  
    if( m12 > 64000. || m34 > 64000. || m32 > 75000. || m14 > 75000. ) return NEXTEVENT; 
   chanInfo->Fill(mc_channel_number,"ZVeto_all",evtWeight); myHist_HM_all->Fill(17,evtWeight);
   if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"ZVeto_el",evtWeight); myHist_HM_4e->Fill(16,evtWeight);}
  if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"ZVeto_el_mu",evtWeight);myHist_HM_2e2m->Fill(17,evtWeight);}
  if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"ZVeto_mu",evtWeight);myHist_HM_4m->Fill(15,evtWeight);}


 double DeltaM = fabs(m12-m34);
  double SigM = fabs(m12+m34)*0.001;
  // std::printf("%1f\n", DeltaM/m12);
     myHist_DeltaM_vs_SigM_all_HM->Fill(SigM,DeltaM,evtWeight);
       if(llll_pdgIdSum==44) myHist_DeltaM_vs_SigM_4e_HM->Fill(SigM,DeltaM,evtWeight);
         if(llll_pdgIdSum==48) myHist_DeltaM_vs_SigM_2e2m_HM->Fill(SigM,DeltaM,evtWeight);
           if(llll_pdgIdSum==52) myHist_DeltaM_vs_SigM_4m_HM->Fill(SigM,DeltaM,evtWeight);
  
            myHist_HM_DeltaMoMmax->Fill(DeltaM/m34,evtWeight);
             //myHist_HM_DeltaMoMmax->Fit("gaus");
              if(llll_pdgIdSum==44) myHist_HM_4e_DeltaMoMmax->Fill(DeltaM/(m12+m34),evtWeight);
                //  myHist_HM_4e_DeltaMoMmax->Fit("gaus");
                 if(llll_pdgIdSum==48) myHist_HM_2e2m_DeltaMoMmax->Fill(DeltaM/(m12+m34),evtWeight);
                    // myHist_HM_2e2m_DeltaMoMmax->Fit("gaus");
		 if(llll_pdgIdSum==52) myHist_HM_4m_DeltaMoMmax->Fill(DeltaM/(m12+m34),evtWeight);
		 // myHist_HM_4m_DeltaMoMmax->Fit("gaus");


  ///Loose SR
  if( m12 <10000.  || m34 < 10000. ) return NEXTEVENT;
 chanInfo->Fill(mc_channel_number,"LooseSR_all",evtWeight); myHist_HM_all->Fill(18,evtWeight);  
if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"LooseSR_el",evtWeight); myHist_HM_4e->Fill(17,evtWeight);}
  if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"LooseSR_el_mu",evtWeight);myHist_HM_2e2m->Fill(18,evtWeight);}
  if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"LooseSR_mu",evtWeight);myHist_HM_4m->Fill(16,evtWeight);}




  ///Medium SR
   if( fabs( m12 - m34 ) > 10000. ) return NEXTEVENT;
  chanInfo->Fill(mc_channel_number,"MediumSR_all",evtWeight); myHist_HM_all->Fill(19,evtWeight); 
   if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"MediumSR_el",evtWeight); myHist_HM_4e->Fill(18,evtWeight);}
   if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"MediumSR_el_mu",evtWeight);myHist_HM_2e2m->Fill(19,evtWeight);}
   if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"MediumSR_mu",evtWeight);myHist_HM_4m->Fill(17,evtWeight);}
  
  ///Tight SR 

    if( fabs( m12 - m_massPoints[mc_channel_number]*1000. ) > 5000. ||
    fabs( m34 - m_massPoints[mc_channel_number]*1000. ) > 5000. ) return NEXTEVENT; 
  chanInfo->Fill(mc_channel_number,"TightSR_all",evtWeight); myHist_HM_all->Fill(20,evtWeight);
  if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"TightSR_el",evtWeight); myHist_HM_4e->Fill(19,evtWeight);}
   if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"TightSR_el_mu",evtWeight); myHist_HM_2e2m->Fill(20,evtWeight);}
   if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"TightSR_mu",evtWeight); myHist_HM_4m->Fill(18,evtWeight);}*/
  
  // double DeltaM = fabs(m12-m34)*0.001;
  // double SigM = fabs(m12+m34)*0.001;
 //  myHist_DeltaM_vs_SigM_all_HM->Fill(SigM,DeltaM,evtWeight);
// if(llll_pdgIdSum==44) myHist_DeltaM_vs_SigM_4e_HM->Fill(SigM,DeltaM,evtWeight);
// if(llll_pdgIdSum==48) myHist_DeltaM_vs_SigM_2e2m_HM->Fill(SigM,DeltaM,evtWeight);
// if(llll_pdgIdSum==52) myHist_DeltaM_vs_SigM_4m_HM->Fill(SigM,DeltaM,evtWeight);
 //  std::printf(" %1f\n", SigM);
  // int llll_pdgIdSum = selected_llll->get<int>("pdgIdSum");

 /*   //deltaR12
    double deltaR12 = lls->at(selected_llll->get<int>("ll1")).get<double>("dR");
 
   if(llll_pdgIdSum==44) myHist_DeltaR12_4e_channel_HM->Fill(deltaR12,evtWeight);
  if(llll_pdgIdSum==48) myHist_DeltaR12_2e2m_channel_HM->Fill(deltaR12,evtWeight);
  if(llll_pdgIdSum==52) myHist_DeltaR12_4m_channel_HM->Fill(deltaR12,evtWeight);
//deltaR34
  double deltaR34 = lls->at(selected_llll->get<int>("ll2")).get<double>("dR");
  if(llll_pdgIdSum==44) myHist_DeltaR34_4e_channel_HM->Fill(deltaR34,evtWeight);
  if(llll_pdgIdSum==48) myHist_DeltaR34_2e2m_channel_HM->Fill(deltaR34,evtWeight);
  if(llll_pdgIdSum==52) myHist_DeltaR34_4m_channel_HM->Fill(deltaR34,evtWeight);*/
 
  // }
  
  //  else if(mc_channel_number == 302073) {
     chanInfo->Fill(mc_channel_number,"All",evtWeight);
   myHist_LM_all->Fill(1,evtWeight); 
   myHist_LM_4e->Fill(1,evtWeight); 
   myHist_LM_2e2m->Fill(1,evtWeight);
   myHist_LM_4m->Fill(1,evtWeight); 
   
  
  
  ///***** Event Preselections ******
  
  ///EventCleaning
  if(!evt.get<bool>("passCleaning")) return NEXTEVENT;
  chanInfo->Fill(mc_channel_number,"Cleaning",evtWeight);
myHist_LM_all->Fill(2,evtWeight);  
myHist_LM_4e->Fill(2,evtWeight);
  myHist_LM_2e2m->Fill(2,evtWeight);
  myHist_LM_4m->Fill(2,evtWeight);
  
  ///NPV
  if(!evt.get<bool>("passNPV")) return NEXTEVENT; chanInfo->Fill(mc_channel_number,"PrimaryVertex",evtWeight); 
myHist_LM_all->Fill(3,evtWeight);
myHist_LM_4e->Fill(3,evtWeight);
myHist_LM_2e2m->Fill(3,evtWeight);
myHist_LM_4m->Fill(3,evtWeight); 
  int RunNumber = evt.get<int>("RunNumber");
  int passTriggers = evt.get<int>("passTriggers"); //bitmask of triggers that have passed, see: llllTree->GetUserInfo()->Print() for the list of triggers
  //form a bitmask for the triggers that we will look at, based on the run number
  // llllTree->GetUserInfo()->Print();
    int triggerMask =(RunNumber>284484)*278528 + (RunNumber<=284484)*96;
  // int triggerMask =(RunNumber>284484)*278528;
  // int triggerMask = (RunNumber<=284484)*96;
    // +(RunNumber<=284484)*435 + (RunNumber<=300287)*76 + (RunNumber>=296639)*44032 + (RunNumber>=296639&&RunNumber<=302393)*65536 + 20992;
 
  ///Trigger
   //  if(!(passTriggers&((1<<6)+(1<<5)))) return NEXTEVENT;  chanInfo->Fill(mc_channel_number,"Trigger",evtWeight);
   if(!(passTriggers&triggerMask)) return NEXTEVENT;  chanInfo->Fill(mc_channel_number,"Trigger",evtWeight);
   myHist_LM_all->Fill(4,evtWeight); 
  myHist_LM_4e->Fill(4,evtWeight); 
  myHist_LM_2e2m->Fill(4,evtWeight);
   myHist_LM_4m->Fill(4,evtWeight);
  ///***** Quadruplet level cuts ******
  
  //  CamVector* ls = evt.getVector("l"); //the leptons
  // CamVector* lls = evt.getVector("ll"); //the dileptons
  // CamVector* lllls = evt.getVector("llll"); //the quadruplets
  
   CamObject* selected_llll = 0; //will point this at our selected quadruplet, if we find one
  
  int cfCount=0; //used so that each event only contributes once
 
  for(auto& llll : *lllls) {
     int llll_pdgIdSum = llll.get<int>("pdgIdSum");
    ///SFOS
    if(llll.get<int>("charge")!=0 || llll.get<int>("dCharge")!=0) continue;
     if(llll.get<int>("pdgIdSum")!=52) continue;
    //  if(llll.get<int>("pdgIdSum")!=52 && llll.get<int>("pdgIdSum")!=48 && llll.get<int>("pdgIdSum")!=44) continue;
     if(cfCount<1) {cfCount++;
       // chanInfo->Fill(mc_channel_number,"SFOS_all",evtWeight); myHist_LM_all->Fill(5,evtWeight);
       // if(llll_pdgIdSum == 44)  {chanInfo->Fill(mc_channel_number,"SFOS_el",evtWeight); myHist_LM_4e->Fill(5,evtWeight);}
       // if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"SFOS_el_mu",evtWeight);myHist_LM_2e2m->Fill(5,evtWeight);}
       //  if(llll_pdgIdSum == 52)  {
chanInfo->Fill(mc_channel_number,"SFOS_mu",evtWeight);myHist_LM_4m->Fill(5,evtWeight);
//}

}
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
    if(llll.get<char>("overlaps")&54) continue;  
if(cfCount<2) {cfCount++; 
  //chanInfo->Fill(mc_channel_number,"NotOverlaps_all",evtWeight);  myHist_LM_all->Fill(6,evtWeight);
  // if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"NotOverlaps_el",evtWeight);  myHist_LM_4e->Fill(6,evtWeight); }
  //  if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"NotOverlaps_el_mu",evtWeight);myHist_LM_2e2m->Fill(6,evtWeight);}
  //  if(llll_pdgIdSum == 52)  {
chanInfo->Fill(mc_channel_number,"NotOverlaps_mu",evtWeight);myHist_LM_4m->Fill(6,evtWeight);
//}
}
    
    ///kinematic cuts
    if(ls->at(llll.get<int>("l1")).Pt()<20000. || 
        ls->at(llll.get<int>("l2")).Pt()<15000. || 
       ls->at(llll.get<int>("l3")).Pt()<10000.) continue; 
if(cfCount<3) {cfCount++;
  //chanInfo->Fill(mc_channel_number,"Kinematic_all",evtWeight); myHist_LM_all->Fill(7,evtWeight);
  //if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"Kinematic_el",evtWeight); myHist_LM_4e->Fill(7,evtWeight); }
  // if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"Kinematic_el_mu",evtWeight);myHist_LM_2e2m->Fill(7,evtWeight); }
  // if(llll_pdgIdSum == 52) {
 chanInfo->Fill(mc_channel_number,"Kinematic_mu",evtWeight);myHist_LM_4m->Fill(7,evtWeight); 
 //}
}
    
    ///trigger matching
    // if(!(llll.get<int>("triggerMatched")&triggerMask)) continue; if(cfCount<4) {cfCount++; chanInfo->Fill(mc_channel_number,"TriggerMatched",evtWeight); myHist_LM->Fill(8,evtWeight);}
  
    ///leading pair *not* worse than loose
// if( ls->at( lls->at(llll.get<int>("ll1")).get<int>("l1") ).get<int>("quality") >=3 ) continue;
//  if( ls->at( lls->at(llll.get<int>("ll1")).get<int>("l2") ).get<int>("quality") >=3 ) continue; 
//  if(cfCount<4) {cfCount++; 
//chanInfo->Fill(mc_channel_number,"ElQuality_all",evtWeight); myHist_LM_all->Fill(8,evtWeight);
// if(llll_pdgIdSum == 44)   { chanInfo->Fill(mc_channel_number,"ElQuality_el",evtWeight); myHist_LM_4e->Fill(8,evtWeight); }
//    if(llll_pdgIdSum == 48)   { chanInfo->Fill(mc_channel_number,"ElQuality_el_mu",evtWeight);myHist_LM_2e2m->Fill(8,evtWeight);}
	//	if(llll_pdgIdSum == 52)  {  chanInfo->Fill(mc_channel_number,"ElQuality_mu",evtWeight);myHist_HM_4m->Fill(9,evtWeight);

//	}
    
    ///not more than 1 CT or SA muon
    if(llll.get<int>("nCTorSA")>=2) continue; 
if(cfCount<5) {cfCount++;
  //chanInfo->Fill(mc_channel_number,"MuQuality_all",evtWeight);myHist_LM_all->Fill(9,evtWeight);
//  if(llll_pdgIdSum == 44)  chanInfo->Fill(mc_channel_number,"MuQuality_el",evtWeight);
  //  if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"MuQuality_el_mu",evtWeight);myHist_LM_2e2m->Fill(9,evtWeight);}
  //  if(llll_pdgIdSum == 52)  {
chanInfo->Fill(mc_channel_number,"MuQuality_mu",evtWeight);myHist_LM_4m->Fill(8,evtWeight);
//}
   
}
  
    ///delta R > 0.1 (0.2) for same (opposite) flavour leptons in quadruplet
    // if(llll.get<double>("min_sf_dR")<=0.1 || llll.get<double>("min_of_dR")<=0.2) continue; 
    // if(cfCount<7) {cfCount++; chanInfo->Fill(mc_channel_number,"DeltaR",evtWeight);myHist_LM->Fill(11,evtWeight);}
    
    selected_llll = &llll;
    break; //stop looking for quadruplets
  }
  
  if(!selected_llll) return NEXTEVENT; 
  
  ///***** Event level cuts ******
 
  ///FixedCutLoose isolation
  //4 bits, each are for the leading,subleading,subsubleading,last lepton (leading=most significant)
  //all must be '1': 1111 = 15
  // int llll_pdgIdSum = selected_llll->get<int>("pdgIdSum");
   if(selected_llll->get<char>("l_isIsolFixedCutLooseHelper")!=15) return NEXTEVENT; 
   // chanInfo->Fill(mc_channel_number,"Isolation",evtWeight);myHist_LM_all->Fill(10,evtWeight);
   // if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"Isolation_el",evtWeight); myHist_LM_4e->Fill(9,evtWeight); }
   // if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"Isolation_el_mu",evtWeight);myHist_LM_2e2m->Fill(10,evtWeight);}
   // if(llll_pdgIdSum == 52) {
 chanInfo->Fill(mc_channel_number,"Isolation_mu",evtWeight);myHist_LM_4m->Fill(9,evtWeight);
 //}



  ///Electron quality (All leptons loose ID or better)
 // if(ls->at(selected_llll->get<int>("l1")).get<int>("quality")>=3 ||
 //  ls->at(selected_llll->get<int>("l2")).get<int>("quality")>=3 ||
 //  ls->at(selected_llll->get<int>("l3")).get<int>("quality")>=3 ||
 //  ls->at(selected_llll->get<int>("l4")).get<int>("quality")>=3)  return NEXTEVENT; 
  //chanInfo->Fill(mc_channel_number,"ElectronID_all",evtWeight); myHist_LM_all->Fill(11,evtWeight);
  // if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"ElectronID_el",evtWeight); myHist_LM_4e->Fill(10,evtWeight); }
  //if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"ElectronID_el_mu",evtWeight);myHist_LM_2e2m->Fill(11,evtWeight);}
  // if(llll_pdgIdSum == 52)  chanInfo->Fill(mc_channel_number,"ElectronID_mu",evtWeight);
     
     
  ///Impact Parameter
  if(selected_llll->get<double>("max_el_d0Sig")>=5)  return NEXTEVENT; 
  if(selected_llll->get<double>("max_mu_d0Sig")>=3)  return NEXTEVENT;
  //chanInfo->Fill(mc_channel_number,"ImpactParameter_all",evtWeight); myHist_LM_all->Fill(12,evtWeight); 
  //if(llll_pdgIdSum == 44){ chanInfo->Fill(mc_channel_number,"ImpactParameter_el",evtWeight); myHist_LM_4e->Fill(11,evtWeight);}
  //if(llll_pdgIdSum == 48) {chanInfo->Fill(mc_channel_number,"ImpactParameter_el_mu",evtWeight);myHist_LM_2e2m->Fill(12,evtWeight);}
  //if(llll_pdgIdSum == 52) {
chanInfo->Fill(mc_channel_number,"ImpactParameter_mu",evtWeight);myHist_LM_4m->Fill(10,evtWeight);
//}

  double m12 = lls->at(selected_llll->get<int>("ll1")).M();
  double m34 = lls->at(selected_llll->get<int>("ll2")).M();
  double m32 = lls->at(selected_llll->get<int>("alt_ll1")).M();
  double m14 = lls->at(selected_llll->get<int>("alt_ll2")).M();

  ///Quarkonia Veto

  if ( ((3096.-250.) < m12 && m12 < (3686.+300.)) ||
       ((3096.-250.) < m34 && m34 < (3686.+300.)) ||
	((3096.-250.) < m14 && m14 < (3686.+300.)) ||
	((3096.-250.) < m32 && m32 < (3686.+300.))||
	((9461.-700.) < m12 && m12 < (10355.+750.)) ||
	((9461.-700.) < m34 && m34 < (10355.+750.)) ||
	((9461.-700.) < m14 && m14 < (10355.+750.)) ||
	((9461.-700.) < m32 && m32 < (10355.+750.)))  return NEXTEVENT;
  //chanInfo->Fill(mc_channel_number,"QVeto_all",evtWeight); myHist_LM_all->Fill(13,evtWeight); 
  // if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"QVeto_el",evtWeight); myHist_LM_4e->Fill(12,evtWeight); }
  //if(llll_pdgIdSum == 48)  {chanInfo->Fill(mc_channel_number,"QVeto_el_mu",evtWeight);myHist_LM_2e2m->Fill(13,evtWeight);}
  //if(llll_pdgIdSum == 52) { 
chanInfo->Fill(mc_channel_number,"QVeto_mu",evtWeight);myHist_LM_4m->Fill(11,evtWeight);
//}

  ///H Window
  if( selected_llll->M()<120000. || selected_llll->M()>130000. ) return NEXTEVENT;
  //chanInfo->Fill(mc_channel_number,"HWindow_all",evtWeight); myHist_LM_all->Fill(14,evtWeight);
  // if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"HWindow_el",evtWeight); myHist_LM_4e->Fill(13,evtWeight);}
  //if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"HWindow_el_mu",evtWeight);myHist_LM_2e2m->Fill(14,evtWeight);}
  //if(llll_pdgIdSum == 52) { 
chanInfo->Fill(mc_channel_number,"HWindow_mu",evtWeight); myHist_LM_4m->Fill(12,evtWeight);
// }
  
  ///Z Veto
  
// if( m12 > 20000. || m34 > 20000. ) return NEXTEVENT;
//chanInfo->Fill(mc_channel_number,"ZVeto_all",evtWeight); myHist_LM_all->Fill(15,evtWeight); 
//if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"ZVeto_el",evtWeight); myHist_LM_4e->Fill(14,evtWeight);}
//if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"ZVeto_el_mu",evtWeight);myHist_LM_2e2m->Fill(15,evtWeight);}
//if(llll_pdgIdSum == 52)  {chanInfo->Fill(mc_channel_number,"ZVeto_mu",evtWeight);myHist_LM_4m->Fill(13,evtWeight);}


//double DeltaM = fabs(m12-m34)*0.001;
// double SigM = fabs(m12+m34)*0.001;

   // std::printf("%1f\n", SigM);
//  myHist_DeltaM_vs_SigM_all_LM->Fill(SigM,DeltaM,evtWeight);
// if(llll_pdgIdSum==44) myHist_DeltaM_vs_SigM_4e_LM->Fill(SigM,DeltaM,evtWeight);
// if(llll_pdgIdSum==48) myHist_DeltaM_vs_SigM_2e2m_LM->Fill(SigM,DeltaM,evtWeight);
// if(llll_pdgIdSum==52) myHist_DeltaM_vs_SigM_4m_LM->Fill(SigM,DeltaM,evtWeight);

  ///Loose SR
    if( m12 >20000.  || m34 > 20000. ) return NEXTEVENT;  
    //chanInfo->Fill(mc_channel_number,"LooseSR_mu",evtWeight);myHist_LM_all->Fill(15,evtWeight);
    // if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"HWindow_el",evtWeight); myHist_LM_4e->Fill(14,evtWeight);}
    //if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"HWindow_el_mu",evtWeight);myHist_LM_2e2m->Fill(15,evtWeight);}
    //if(llll_pdgIdSum == 52) { 
    chanInfo->Fill(mc_channel_number,"Loose_mu",evtWeight); myHist_LM_4m->Fill(13,evtWeight);
// }


  ///Medium SR
/* if( fabs( m12 - m34 )/(m12 + m34) > 0.075 ) return NEXTEVENT;
chanInfo->Fill(mc_channel_number,"MediumSR_all",evtWeight); myHist_LM_all->Fill(16,evtWeight);
 if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"MediumSR_el",evtWeight); myHist_LM_4e->Fill(15,evtWeight);}
if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"MediumSR_el_mu",evtWeight);myHist_LM_2e2m->Fill(16,evtWeight);}
if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"MediumSR_mu",evtWeight);myHist_LM_4m->Fill(14,evtWeight);}*/
  
  ///Tight SR 

/* if( fabs( m12 - m_massPoints[mc_channel_number]*1000. )/(m_massPoints[mc_channel_number]*1000.) > 0.15 ||
      fabs( m34 - m_massPoints[mc_channel_number]*1000. )/(m_massPoints[mc_channel_number]*1000.) > 0.15 ) return NEXTEVENT;
chanInfo->Fill(mc_channel_number,"TightSR_all",evtWeight); myHist_LM_all->Fill(17,evtWeight); 
if(llll_pdgIdSum == 44) { chanInfo->Fill(mc_channel_number,"TightSR_el",evtWeight); myHist_LM_4e->Fill(16,evtWeight);}
if(llll_pdgIdSum == 48) { chanInfo->Fill(mc_channel_number,"TightSR_el_mu",evtWeight); myHist_LM_2e2m->Fill(17,evtWeight);}
if(llll_pdgIdSum == 52) { chanInfo->Fill(mc_channel_number,"TightSR_mu",evtWeight); myHist_LM_4m->Fill(15,evtWeight);}*/

  /* int llll_pdgIdSum = selected_llll->get<int>("pdgIdSum");

   //deltaR12
    double deltaR12 = lls->at(selected_llll->get<int>("ll1")).get<double>("dR");
 
   if(llll_pdgIdSum==44) myHist_DeltaR12_4e_channel_LM->Fill(deltaR12,evtWeight);
  if(llll_pdgIdSum==48) myHist_DeltaR12_2e2m_channel_LM->Fill(deltaR12,evtWeight);
  if(llll_pdgIdSum==52) myHist_DeltaR12_4m_channel_LM->Fill(deltaR12,evtWeight);
//deltaR34
  double deltaR34 = lls->at(selected_llll->get<int>("ll2")).get<double>("dR");
  if(llll_pdgIdSum==44) myHist_DeltaR34_4e_channel_LM->Fill(deltaR34,evtWeight);
  if(llll_pdgIdSum==48) myHist_DeltaR34_2e2m_channel_LM->Fill(deltaR34,evtWeight);
  if(llll_pdgIdSum==52) myHist_DeltaR34_4m_channel_LM->Fill(deltaR34,evtWeight);*/
 
 
    
  // }


  return StatusCode::SUCCESS;
  
}



StatusCode ZdZdPlottingAlg::beginInputFile() { 
  ATH_MSG_INFO("Processing " << currentFile()->GetName() << "...");
  return StatusCode::SUCCESS;
}


