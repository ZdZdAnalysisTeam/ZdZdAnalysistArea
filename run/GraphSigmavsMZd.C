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

void Graph () {

   TCanvas *c1 = new TCanvas("c1","A Simple Graph Example",200,10,700,500);
   c1->Divide(3,1);
   const Int_t n = 8;
   Float_t  x[n]  = {15,20,25,30,35,45,55,60};
   Float_t  y_e[n]  = {1.25145e-01,7.47059e-02,1.94631e-01,7.19913e-02,1.08545e-01,6.91269e-02,9.95905e-02,9.10524e-02};
   Float_t  y_em[n]  = {7.20190e-02,6.96540e-02,7.61953e-02,6.92410e-02,8.28834e-02,7.44719e-02,7.20214e-02,6.97165e-02};
   Float_t  y_m[n]  = { 4.28630e-02,9.57744e-02,3.62185e-02,5.51113e-02,5.31077e-02,4.05733e-02,6.25711e-02,4.74246e-02};
   TGraph *gr_e = new TGraph (n, x, y_e);
   TGraph *gr_em = new TGraph (n, x, y_em);
   TGraph *gr_m = new TGraph (n, x, y_m);
    // gr1->SetLineColor(2);
    // gr1->SetLineWidth(4);
    gr_e->SetMarkerColor(4);
    gr_e->SetMarkerStyle(20);
    gr_e->SetTitle("4e");
    gr_e->GetYaxis()->SetTitle("#sigma |m_{12}-m_{34}|/m_{12}");
    gr_e->GetXaxis()->SetTitle("m_{ZD}/GeV");
    gr_e->GetYaxis()->SetTitleOffset(1.4);

    gr_em->SetMarkerColor(4);
    gr_em->SetMarkerStyle(20);
    gr_em->SetTitle("2e2m");
    gr_em->GetYaxis()->SetTitle("#sigma |m_{12}-m_{34}|/m_{12}");
    gr_em->GetXaxis()->SetTitle("m_{ZD}/GeV");
    gr_em->GetYaxis()->SetTitleOffset(1.5);

    gr_m->SetMarkerColor(4);
    gr_m->SetMarkerStyle(20);
    gr_m->SetTitle("4m");
    gr_m->GetYaxis()->SetTitle("#sigma |m_{12}-m_{34}|/m_{12}");
    gr_m->GetXaxis()->SetTitle("m_{ZD}/GeV");
    gr_m->GetYaxis()->SetTitleOffset(1.4);
    c1->cd(1);
    gr_e->Draw("ap");
    c1->cd(2);
    gr_em->Draw("ap");
    c1->cd(3);
    gr_m->Draw("ap");
}
