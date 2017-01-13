#include "TROOT.h"    
#include "TObject.h" 
#include "TFile.h"
#include "TTree.h"
#include "TH2.h"
#include "TMath.h"
#include "TGraph.h"
#include "TColor.h"
#include "TCanvas.h"
#include "TLegend.h"
#include <TStyle.h>
#include <iostream>

#include "AtlasStyle.h"

#include "TROOT.h"



void SetAtlasStyle ()
{
  static TStyle* atlasStyle = 0;
  std::cout << "\nApplying ATLAS style settings...\n" << std::endl ;
  if ( atlasStyle==0 ) atlasStyle = AtlasStyle();
  gROOT->SetStyle("ATLAS");
  gROOT->ForceStyle();

  gStyle->SetPadColor       (0);
     gStyle->SetPadBorderSize  (10);
     gStyle->SetPadBorderMode  (0);
     gStyle->SetPadBottomMargin(0.18);
     gStyle->SetPadTopMargin   (0.06);
     gStyle->SetPadLeftMargin  (0.10);
     gStyle->SetPadRightMargin (0.04);
     gStyle->SetPadGridX       (0);
     gStyle->SetPadGridY       (0);
     gStyle->SetPadTickX       (1);
     gStyle->SetPadTickY       (1);
     gStyle->SetTitleYOffset(1.0);

   gStyle->SetCanvasColor(0);
   gStyle->SetOptStat(0);
   gStyle->SetOptFit(1);
   gStyle->SetStatColor(0);

    


    TFile* f = new TFile("plots_15GeV_HM_DeltaMoMmax.root");
  //  TFile* f2 = new TFile("plots_20GeV_HM_DeltaMoMmax.root");
  // TFile* f3 = new TFile("plots_25GeV_HM_DeltaMoMmax.root");
  // TFile* f4 = new TFile("plots_30GeV_HM_DeltaMoMmax.root");
  // TFile* f5 = new TFile("plots_35GeV_HM_DeltaMoMmax.root");
  // TFile* f6 = new TFile("plots_45GeV_HM_DeltaMoMmax.root");
  // TFile* f7 = new TFile("plots_50GeV_HM_DeltaMoMmax.root");
  // TFile* f8 = new TFile("plots_55GeV_HM_DeltaMoMmax.root");
  // TFile* f9 = new TFile("plots_60GeV_HM_DeltaMoMmax.root");
  //TStyle *atlasStyle = new TStyle("ATLAS","Atlas style");
  // TCanvas *canv_1 = new TCanvas("c1", "c1",10,54,700,530);
  // TCanvas *canv_2 = new TCanvas("c2", "c2",10,54,700,530);
 
  // canv_1->Divide(3,1);

  // gStyle->SetOptStat(0);
    // TH1F *myHist_LM_4m= (TH1F*)f->Get("myHist_LM_4m");
    // myHist_LM_4m->SetFillColor(38);
    // myHist_LM_4m->SetTitle("Evt/1");
    // TH1F *myHist_HM_DeltaMoMmax = (TH1F*)f->Get("myHist_HM_DeltaMoMmax");
    // myHist_HM_DeltaMoMmax->SetFillColor(38);
    // myHist_DeltaM_vs_SigM_all_HM->SetTitle("Evt/0.1");
    // myHist_DeltaM_vs_SigM_all_HM->GetXaxis()->SetTitle("#Sigma M");
    // myHist_HM_4e_DeltaMoMmax->GetYaxis()->SetTitle("#Delta M/#M_{12}");
    TH1F * myHist_4e_HM_DeltaMoMmax = (TH1F*)f->Get("myHist_HM_4e_DeltaMoMmax");
    myHist_4e_HM_DeltaMoMmax->Fit("gaus");
  myHist_4e_HM_DeltaMoMmax->SetFillColor(38);
   myHist_4e_HM_DeltaMoMmax->SetTitle("");
   //  myHist_4e_HM_DeltaMoMmax->GetXaxis()->SetTitle("#Sigma M");
   myHist_4e_HM_DeltaMoMmax->GetYaxis()->SetTitle("#Delta M/M_{12}"); 
  TH1F *myHist_HM_2e2m_DeltaMoMmax = (TH1F*)f->Get("myHist_HM_2e2m_DeltaMoMmax");
   myHist_HM_2e2m_DeltaMoMmax->Fit("gaus"); 
 myHist_HM_2e2m_DeltaMoMmax->SetFillColor(38);
   myHist_HM_2e2m_DeltaMoMmax->SetTitle("");
   // myHist_2e2m_HM_DeltaMoMmax->GetXaxis()->SetTitle("#Sigma M");
 myHist_HM_2e2m_DeltaMoMmax->GetYaxis()->SetTitle("#Delta M/M_{12}");
  TH1F * myHist_HM_4m_DeltaMoMmax = (TH1F*)f->Get("myHist_HM_4m_DeltaMoMmax");
   myHist_HM_4m_DeltaMoMmax->Fit("gaus");
   myHist_HM_4m_DeltaMoMmax->SetFillColor(38);
   myHist_HM_4m_DeltaMoMmax->SetTitle("");
  // myHist_4m_HM_DeltaMoMmax->GetXaxis()->SetTitle("#Sigma M");
   myHist_HM_4m_DeltaMoMmax->GetYaxis()->SetTitle("#Delta M/M_{12}");
  /* TH1F * myHist_DeltaR34_4e_channel = (TH1F*)f->Get("myHist_DeltaR34_4e_channel");
  myHist_DeltaR34_4e_channel->SetFillColor(38);
  myHist_DeltaR34_4e_channel->SetTitle("Evt/0.1");
  myHist_DeltaR34_4e_channel->GetXaxis()->SetTitle("#Delta R");
  TH1F * myHist_DeltaR34_2e2m_channel = (TH1F*)f->Get("myHist_DeltaR34_2e2m_channel");
  myHist_DeltaR34_2e2m_channel->SetFillColor(38);
  myHist_DeltaR34_2e2m_channel->SetTitle("Evt/0.1");
  myHist_DeltaR34_2e2m_channel->GetXaxis()->SetTitle("#Delta R");
  TH1F * myHist_DeltaR34_4m_channel = (TH1F*)f->Get("myHist_DeltaR34_4m_channel");
  myHist_DeltaR34_4m_channel->SetFillColor(38);
  myHist_DeltaR34_4m_channel->SetTitle("Evt/0.1");
  myHist_DeltaR34_4m_channel->GetXaxis()->SetTitle("#Delta R");*/
  
   /*  TLatex *atexl=new TLatex(0.65,0.85,"ATLAS Internal");
 atexl->SetNDC();
 canv_1->cd(1);  
 myHist_4e_HM_DeltaMoMmax->Draw("");
  atexl->DrawText(0.6, 0.8, "4e_chann");
 canv_1->cd(2);
 myHist_HM_2e2m_DeltaMoMmax->Draw("");
 atexl->DrawText(0.5, 0.8, " 2e2m_chann");
  canv_1->cd(3);
  myHist_HM_4m_DeltaMoMmax->Draw("");
  atexl->DrawText(0.6, 0.8, " 4m_chann");*/

 /*canv_1->cd(4);  
 myHist_DeltaR34_4e_channel->Draw("b");
 atexl->DrawText(0.6, 0.8, "dR34 4e_chann");
 canv_1->cd(5);
 myHist_DeltaR34_2e2m_channel->Draw("b");
 atexl->DrawText(0.5, 0.8, "dR34 2e2m_chann");
 canv_1->cd(6);
 myHist_DeltaR34_4m_channel->Draw("b");
 atexl->DrawText(0.6, 0.8, "dR34 4m_chann");*/
   // myHist_LM_4m->Draw("b"); 
 //f->Close();


  
}

TStyle* AtlasStyle() 
{
  TStyle *atlasStyle = new TStyle("ATLAS","Atlas style");

  // use plain black on white colors
  Int_t icol=0; // WHITE
  atlasStyle->SetFrameBorderMode(icol);
  atlasStyle->SetFrameFillColor(icol);
  atlasStyle->SetCanvasBorderMode(icol);
  atlasStyle->SetCanvasColor(icol);
  atlasStyle->SetPadBorderMode(icol);
  atlasStyle->SetPadColor(icol);
  atlasStyle->SetStatColor(icol);
  //atlasStyle->SetFillColor(icol); // don't use: white fill color for *all* objects

  // set the paper & margin sizes
  atlasStyle->SetPaperSize(20,26);

  // set margin sizes
  atlasStyle->SetPadTopMargin(0.05);
  atlasStyle->SetPadRightMargin(0.05);
  atlasStyle->SetPadBottomMargin(0.16);
  atlasStyle->SetPadLeftMargin(0.16);

  // set title offsets (for axis label)
  atlasStyle->SetTitleXOffset(1.5);
  atlasStyle->SetTitleYOffset(1.5);

  // use large fonts
  //Int_t font=72; // Helvetica italics
  Int_t font=42; // Helvetica
  Double_t tsize=0.05;
  atlasStyle->SetTextFont(font);

  atlasStyle->SetTextSize(tsize);
  atlasStyle->SetLabelFont(font,"x");
  atlasStyle->SetTitleFont(font,"x");
  atlasStyle->SetLabelFont(font,"y");
  atlasStyle->SetTitleFont(font,"y");
  atlasStyle->SetLabelFont(font,"z");
  atlasStyle->SetTitleFont(font,"z");
  
  atlasStyle->SetLabelSize(tsize,"x");
  atlasStyle->SetTitleSize(tsize,"x");
  atlasStyle->SetLabelSize(tsize,"y");
  atlasStyle->SetTitleSize(tsize,"y");
  atlasStyle->SetLabelSize(tsize,"z");
  atlasStyle->SetTitleSize(tsize,"z");

  // use bold lines and markers
  atlasStyle->SetMarkerStyle(20);
  atlasStyle->SetMarkerSize(1.2);
  atlasStyle->SetHistLineWidth(2.);
  atlasStyle->SetLineStyleString(2,"[12 12]"); // postscript dashes

  // get rid of X error bars 
  //atlasStyle->SetErrorX(0.001);
  // get rid of error bar caps
  atlasStyle->SetEndErrorSize(0.);

  // do not display any of the standard histogram decorations
  //atlasStyle->SetOptTitle(0);
  //atlasStyle->SetOptStat(1111);
  atlasStyle->SetOptStat(0);
  //atlasStyle->SetOptFit(1111);
  atlasStyle->SetOptFit(0);

  // put tick marks on top and RHS of plots
  atlasStyle->SetPadTickX(1);
  atlasStyle->SetPadTickY(1);

  return atlasStyle;

}

