#include <fstream>
#include <iostream>
//#include <Riostream.h>
#include <sstream>
#include <TStyle.h>
#include <TCanvas.h>
#include <TLegend.h>
#include <TApplication.h>
#include <TMath.h>
#include <TROOT.h>
#include <TFile.h>
#include <TTree.h>
#include <TObject.h>
#include <TSystem.h>
#include <TPrincipal.h>
#include <TH1D.h>
#include <TH2D.h>
#include <TH3D.h>
#include <THStack.h>
#include <TBrowser.h>
#include <TGraph.h>
#include <TLatex.h>
//
// ATLAS Style, based on a style file from BaBar
//
//#include "TStyle.h"

#include "llllTree2.h"

using namespace std;

TStyle* AtlasStyle(bool beurk = true)
{
  TStyle *atlasStyle = new TStyle("ATLAS","Atlas style");

  // use plain black on white colors
  Int_t icol=0; // WHITE
  atlasStyle->SetFrameBorderMode(icol);
  atlasStyle->SetFrameFillColor(icol);
  atlasStyle->SetTitleFillColor(icol);
  atlasStyle->SetCanvasBorderMode(icol);
  atlasStyle->SetCanvasColor(icol);
  atlasStyle->SetPadBorderMode(icol);
  atlasStyle->SetPadColor(icol);
  atlasStyle->SetStatColor(icol);
  //atlasStyle->SetFillColor(icol); // don't use: white fill color floa *all* objects

  // set the paper & margin sizes
  atlasStyle->SetPaperSize(20,26);

  // set margin sizes
  if (beurk) {
    atlasStyle->SetPadTopMargin(0.05);
    atlasStyle->SetPadRightMargin(0.05);
    atlasStyle->SetPadBottomMargin(0.16);
    atlasStyle->SetPadLeftMargin(0.16);
  }

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
  atlasStyle->SetMarkerSize(1.);
  atlasStyle->SetHistLineWidth(2.);
  atlasStyle->SetLineStyleString(2,"[12 12]"); // postscript dashes

  // get rid of X error bars and y error bar caps
  //atlasStyle->SetErrorX(0.001);

  // do not display any of the standard histogram decorations
  atlasStyle->SetOptTitle(0);
  //atlasStyle->SetOptStat(1111);
  atlasStyle->SetOptStat(0);
  //atlasStyle->SetOptFit(1111);
  atlasStyle->SetOptFit(0);

  // put tick marks on top and RHS of plots
  atlasStyle->SetPadTickX(1);
  atlasStyle->SetPadTickY(1);

  atlasStyle->SetLegendBorderSize(1);

  return atlasStyle;

}

void SetAtlasStyle (bool beurk = true)
{
  std::cout << "\nApplying ATLAS style settings...\n" << std::endl ;
  TStyle* atlasStyle = AtlasStyle(beurk);
  gROOT->SetStyle("ATLAS");
  gROOT->ForceStyle();
}



#define nrows 706
#define ncols_file 9
#define ncols_tot 10
using namespace std;

// Globals
TCanvas *canv_1 = 0;
TObject *obj_1=0;
//TCanvas *canv_2 = 0;
//TObject *obj_2=0;

// main program starts here
int main(int argc, char **argv) {

// the csv file made from the Excel file, its a comme separated value file,
// with the header and footer pruned to have only the data
// the blanks are set to -1 so they can be rejected in the processing

/*char* rootfile;
if (argc<=1) {
  cout << "\n    *****    Enter root filename on the command line ****** \n";
  return 0;
}
else {
  rootfile=argv[1];
}

cout << "\nFilename is  " <<  rootfile  <<  "\n";

*/
  // gROOT->Reset();

 TString reader;
 ifstream fileReader(argv[1]);
 // TString dirout = argv[2];
  
 // gSystem->Exec("mkdir -p " + dirout );
  
   // TString outputfileName = TString::Format("%s/%s.root",argv[2],argv[3]);
   //  cout << " -- creating outputFile: " << outputfileName << endl;
   // TFile* outputFile = TFile::Open(outputfileName, "recreate");

   // TFile* outputFile = TFile::Open(TString::Format("%s/%s.root",argv[2],argv[3]), "recreate");
   SetAtlasStyle(1);





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

     TLatex *atexl=new TLatex(0.65,0.85,"ATLAS Internal");atexl->SetNDC();




    new TApplication("ATLAS Week analisys",&argc,argv);
    canv_1 = new TCanvas("canv_1","RAW",10,10,800,800); //canvas instantiated
     canv_1->Divide(3,3);

    // canv_2 = new TCanvas("canv_2","RAW",10,10,800,800); //canvas instantiated
    // canv_2->Divide(3,2);


    // TFile* file = new TFile(rootfile,"READ");
    //file->cd();


      //  string treeName;
      // treeName = "Nominal/llllTree";
     // cout << "treeName=" << treeName << endl;
     // TTree* tree = (TTree*)file->Get(treeName.c_str());
 
   TChain *treeHandle = new TChain("Nominal/llllTree");
   while (!fileReader.eof()) {
  reader.ReadLine(fileReader);
  if( reader.Length() < 2 ) continue;
  cout << " Adding " << reader << endl;
  treeHandle->Add( reader );
  }

   Long64_t nentries = treeHandle->GetEntries();
   cout << " Number of Entries : " << nentries << endl;
    llllTree2* m = new llllTree2(treeHandle);  
    // llllTree2* m = new llllTree2(tree);
    m->Loop();


 // pause so that you can zoom graphs etc .... then double click to continue
		  Int_t n=1;
 	      while (n>0) {
 	      obj_1 = gPad->WaitPrimitive();
	      // obj_2 = gPad->WaitPrimitive();
 	      if (!obj_1) break;  // leave this endless loop on a double click         
	      // if (!obj_2) break;
 	      printf("Mouse Action : Loop i=%d, found objIsA=%s, name=%s\n", n,obj_1->ClassName(),obj_1->GetName());
	      //printf("Mouse Action : Loop i=%d, found objIsA=%s, name=%s\n", n,obj_2->ClassName(),obj_2->GetName());
 	   }





	   delete canv_1;
	   delete obj_1;
	   //delete canv_2;
	   // delete obj_2;
   return 0;
   

   // outputFile->cd();
 
   //     outputFile->Close();
}
