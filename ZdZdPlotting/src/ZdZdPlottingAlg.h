#ifndef ZDZDPLOTTING_ZDZDPLOTTINGALG_H
#define ZDZDPLOTTING_ZDZDPLOTTINGALG_H 1

#include "AnalysisCamEvent/CamAlgorithm.h"

#include "GeneralCamTools/IChannelInfoTool.h"

#include "TTree.h"
#include "TH1D.h"

class ZdZdPlottingAlg: public ::CamAlgorithm { 
 public: 
  ZdZdPlottingAlg( const std::string& name, ISvcLocator* pSvcLocator );
  virtual ~ZdZdPlottingAlg(); 

  virtual StatusCode  initialize();
  virtual StatusCode  execute();
  virtual StatusCode  finalize();
  
  virtual StatusCode beginInputFile();

 private: 

  ToolHandle<IChannelInfoTool> chanInfo;


  TTree* myTree;
  TH1D* myHist;
TH1D* myHist_DeltaR12_4e_channel;
TH1D* myHist_DeltaR12_2e2m_channel;
TH1D* myHist_DeltaR12_4m_channel;
TH1D* myHist_DeltaR34_4e_channel;
TH1D* myHist_DeltaR34_2e2m_channel;
TH1D* myHist_DeltaR34_4m_channel;
  
  std::map<int,double> m_massPoints;

}; 

#endif //> !ZDZDPLOTTING_ZDZDPLOTTINGALG_H
