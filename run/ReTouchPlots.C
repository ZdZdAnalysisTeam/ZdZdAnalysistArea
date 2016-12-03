#include "TROOT.h"    
#include "TObject.h" 
#include "TFile.h"
#include "TTree.h"
#include "TH2.h"
#include "TMath.h"
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

    


  TFile* f = new TFile("dR_5GeV.root");
  //TStyle *atlasStyle = new TStyle("ATLAS","Atlas style");
  TCanvas *canv_1 = new TCanvas("c1", "c1",10,54,700,530);
  canv_1->Divide(3,1);

  // gStyle->SetOptStat(0);
 TH1F * myHist_DeltaR12_4e_channel = (TH1F*)f->Get("myHist_DeltaR12_4e_channel");
  myHist_DeltaR12_4e_channel->SetFillColor(38);
  myHist_DeltaR12_4e_channel->GetYaxis()->SetTitle("Evt/0.1");
  myHist_DeltaR12_4e_channel->GetXaxis()->SetTitle("#Delta R");
  TH1F * myHist_DeltaR12_2e2m_channel = (TH1F*)f->Get("myHist_DeltaR12_2e2m_channel");
  myHist_DeltaR12_2e2m_channel->SetFillColor(38);
  myHist_DeltaR12_2e2m_channel->GetYaxis()->SetTitle("Evt/0.1");
  myHist_DeltaR12_2e2m_channel->GetXaxis()->SetTitle("#Delta R");
  TH1F * myHist_DeltaR12_4m_channel = (TH1F*)f->Get("myHist_DeltaR12_4m_channel");
  myHist_DeltaR12_4m_channel->SetFillColor(38);
  myHist_DeltaR12_4m_channel->GetYaxis()->SetTitle("Evt/0.1");
  myHist_DeltaR12_4m_channel->GetXaxis()->SetTitle("#Delta R");
  
 TLatex *atexl=new TLatex(0.65,0.85,"ATLAS Internal");
 atexl->SetNDC();
 canv_1->cd(1);  
 myHist_DeltaR12_4e_channel->Draw("b");
 atexl->DrawText(0.6, 0.8, "dR12 4e_chann");
 atexl->DrawText(0.7, 0.7, "5 GeV");
 canv_1->cd(2);
 myHist_DeltaR12_2e2m_channel->Draw("b");
 atexl->DrawText(0.5, 0.8, "dR12 2e2m_chann");
 atexl->DrawText(0.7, 0.7, "5 GeV");
 canv_1->cd(3);
 myHist_DeltaR12_4m_channel->Draw("b");
 atexl->DrawText(0.6, 0.8, "dR12 4m_chann");
 atexl->DrawText(0.7, 0.7, "5 GeV");
 
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
  atlasStyle->SetOptTitle(0);
  //atlasStyle->SetOptStat(1111);
  atlasStyle->SetOptStat(0);
  //atlasStyle->SetOptFit(1111);
  atlasStyle->SetOptFit(0);

  // put tick marks on top and RHS of plots
  atlasStyle->SetPadTickX(1);
  atlasStyle->SetPadTickY(1);

  return atlasStyle;

}

