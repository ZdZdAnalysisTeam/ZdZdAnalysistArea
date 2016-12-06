// Do NOT change. Changes will be lost next time file is generated

#define R__DICTIONARY_FILENAME dOdOdIx86_64mIslc6mIgcc49mIoptdIdictdIAnalysisCamROOTLibDict

/*******************************************************************/
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <assert.h>
#define G__DICTIONARY
#include "RConfig.h"
#include "TClass.h"
#include "TDictAttributeMap.h"
#include "TInterpreter.h"
#include "TROOT.h"
#include "TBuffer.h"
#include "TMemberInspector.h"
#include "TInterpreter.h"
#include "TVirtualMutex.h"
#include "TError.h"

#ifndef G__ROOT
#define G__ROOT
#endif

#include "RtypesImp.h"
#include "TIsAProxy.h"
#include "TFileMergeInfo.h"
#include <algorithm>
#include "TCollectionProxyInfo.h"
/*******************************************************************/

#include "TDataMember.h"

// Since CINT ignores the std namespace, we need to do so in this file.
namespace std {} using namespace std;

// Header files passed as explicit arguments
#include "AnalysisCamROOT/TChannelInfo.h"

// Header files passed via #pragma extra_include

namespace ROOT {
   static void *new_TChannelInfo(void *p = 0);
   static void *newArray_TChannelInfo(Long_t size, void *p);
   static void delete_TChannelInfo(void *p);
   static void deleteArray_TChannelInfo(void *p);
   static void destruct_TChannelInfo(void *p);
   static Long64_t merge_TChannelInfo(void *obj, TCollection *coll,TFileMergeInfo *info);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::TChannelInfo*)
   {
      ::TChannelInfo *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TInstrumentedIsAProxy< ::TChannelInfo >(0);
      static ::ROOT::TGenericClassInfo 
         instance("TChannelInfo", ::TChannelInfo::Class_Version(), "AnalysisCamROOT/TChannelInfo.h", 24,
                  typeid(::TChannelInfo), DefineBehavior(ptr, ptr),
                  &::TChannelInfo::Dictionary, isa_proxy, 4,
                  sizeof(::TChannelInfo) );
      instance.SetNew(&new_TChannelInfo);
      instance.SetNewArray(&newArray_TChannelInfo);
      instance.SetDelete(&delete_TChannelInfo);
      instance.SetDeleteArray(&deleteArray_TChannelInfo);
      instance.SetDestructor(&destruct_TChannelInfo);
      instance.SetMerge(&merge_TChannelInfo);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::TChannelInfo*)
   {
      return GenerateInitInstanceLocal((::TChannelInfo*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::TChannelInfo*)0x0); R__UseDummy(_R__UNIQUE_(Init));
} // end of namespace ROOT

//______________________________________________________________________________
atomic_TClass_ptr TChannelInfo::fgIsA(0);  // static to hold class pointer

//______________________________________________________________________________
const char *TChannelInfo::Class_Name()
{
   return "TChannelInfo";
}

//______________________________________________________________________________
const char *TChannelInfo::ImplFileName()
{
   return ::ROOT::GenerateInitInstanceLocal((const ::TChannelInfo*)0x0)->GetImplFileName();
}

//______________________________________________________________________________
int TChannelInfo::ImplFileLine()
{
   return ::ROOT::GenerateInitInstanceLocal((const ::TChannelInfo*)0x0)->GetImplFileLine();
}

//______________________________________________________________________________
TClass *TChannelInfo::Dictionary()
{
   fgIsA = ::ROOT::GenerateInitInstanceLocal((const ::TChannelInfo*)0x0)->GetClass();
   return fgIsA;
}

//______________________________________________________________________________
TClass *TChannelInfo::Class()
{
   if (!fgIsA.load()) { R__LOCKGUARD2(gInterpreterMutex); fgIsA = ::ROOT::GenerateInitInstanceLocal((const ::TChannelInfo*)0x0)->GetClass(); }
   return fgIsA;
}

//______________________________________________________________________________
void TChannelInfo::Streamer(TBuffer &R__b)
{
   // Stream an object of class TChannelInfo.

   if (R__b.IsReading()) {
      R__b.ReadClassBuffer(TChannelInfo::Class(),this);
   } else {
      R__b.WriteClassBuffer(TChannelInfo::Class(),this);
   }
}

namespace ROOT {
   // Wrappers around operator new
   static void *new_TChannelInfo(void *p) {
      return  p ? new(p) ::TChannelInfo : new ::TChannelInfo;
   }
   static void *newArray_TChannelInfo(Long_t nElements, void *p) {
      return p ? new(p) ::TChannelInfo[nElements] : new ::TChannelInfo[nElements];
   }
   // Wrapper around operator delete
   static void delete_TChannelInfo(void *p) {
      delete ((::TChannelInfo*)p);
   }
   static void deleteArray_TChannelInfo(void *p) {
      delete [] ((::TChannelInfo*)p);
   }
   static void destruct_TChannelInfo(void *p) {
      typedef ::TChannelInfo current_t;
      ((current_t*)p)->~current_t();
   }
   // Wrapper around the merge function.
   static Long64_t  merge_TChannelInfo(void *obj,TCollection *coll,TFileMergeInfo *) {
      return ((::TChannelInfo*)obj)->Merge(coll);
   }
} // end of namespace ROOT for class ::TChannelInfo

namespace ROOT {
   static TClass *vectorlETStringgR_Dictionary();
   static void vectorlETStringgR_TClassManip(TClass*);
   static void *new_vectorlETStringgR(void *p = 0);
   static void *newArray_vectorlETStringgR(Long_t size, void *p);
   static void delete_vectorlETStringgR(void *p);
   static void deleteArray_vectorlETStringgR(void *p);
   static void destruct_vectorlETStringgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<TString>*)
   {
      vector<TString> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<TString>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<TString>", -2, "vector", 214,
                  typeid(vector<TString>), DefineBehavior(ptr, ptr),
                  &vectorlETStringgR_Dictionary, isa_proxy, 0,
                  sizeof(vector<TString>) );
      instance.SetNew(&new_vectorlETStringgR);
      instance.SetNewArray(&newArray_vectorlETStringgR);
      instance.SetDelete(&delete_vectorlETStringgR);
      instance.SetDeleteArray(&deleteArray_vectorlETStringgR);
      instance.SetDestructor(&destruct_vectorlETStringgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<TString> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<TString>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlETStringgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<TString>*)0x0)->GetClass();
      vectorlETStringgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlETStringgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlETStringgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<TString> : new vector<TString>;
   }
   static void *newArray_vectorlETStringgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<TString>[nElements] : new vector<TString>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlETStringgR(void *p) {
      delete ((vector<TString>*)p);
   }
   static void deleteArray_vectorlETStringgR(void *p) {
      delete [] ((vector<TString>*)p);
   }
   static void destruct_vectorlETStringgR(void *p) {
      typedef vector<TString> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<TString>

namespace ROOT {
   static TClass *maplEintcOmaplETStringcOdoublegRsPgR_Dictionary();
   static void maplEintcOmaplETStringcOdoublegRsPgR_TClassManip(TClass*);
   static void *new_maplEintcOmaplETStringcOdoublegRsPgR(void *p = 0);
   static void *newArray_maplEintcOmaplETStringcOdoublegRsPgR(Long_t size, void *p);
   static void delete_maplEintcOmaplETStringcOdoublegRsPgR(void *p);
   static void deleteArray_maplEintcOmaplETStringcOdoublegRsPgR(void *p);
   static void destruct_maplEintcOmaplETStringcOdoublegRsPgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<int,map<TString,double> >*)
   {
      map<int,map<TString,double> > *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<int,map<TString,double> >));
      static ::ROOT::TGenericClassInfo 
         instance("map<int,map<TString,double> >", -2, "map", 96,
                  typeid(map<int,map<TString,double> >), DefineBehavior(ptr, ptr),
                  &maplEintcOmaplETStringcOdoublegRsPgR_Dictionary, isa_proxy, 0,
                  sizeof(map<int,map<TString,double> >) );
      instance.SetNew(&new_maplEintcOmaplETStringcOdoublegRsPgR);
      instance.SetNewArray(&newArray_maplEintcOmaplETStringcOdoublegRsPgR);
      instance.SetDelete(&delete_maplEintcOmaplETStringcOdoublegRsPgR);
      instance.SetDeleteArray(&deleteArray_maplEintcOmaplETStringcOdoublegRsPgR);
      instance.SetDestructor(&destruct_maplEintcOmaplETStringcOdoublegRsPgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<int,map<TString,double> > >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<int,map<TString,double> >*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplEintcOmaplETStringcOdoublegRsPgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<int,map<TString,double> >*)0x0)->GetClass();
      maplEintcOmaplETStringcOdoublegRsPgR_TClassManip(theClass);
   return theClass;
   }

   static void maplEintcOmaplETStringcOdoublegRsPgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplEintcOmaplETStringcOdoublegRsPgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<int,map<TString,double> > : new map<int,map<TString,double> >;
   }
   static void *newArray_maplEintcOmaplETStringcOdoublegRsPgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<int,map<TString,double> >[nElements] : new map<int,map<TString,double> >[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplEintcOmaplETStringcOdoublegRsPgR(void *p) {
      delete ((map<int,map<TString,double> >*)p);
   }
   static void deleteArray_maplEintcOmaplETStringcOdoublegRsPgR(void *p) {
      delete [] ((map<int,map<TString,double> >*)p);
   }
   static void destruct_maplEintcOmaplETStringcOdoublegRsPgR(void *p) {
      typedef map<int,map<TString,double> > current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<int,map<TString,double> >

namespace ROOT {
   static TClass *maplEintcOmaplETStringcOTStringgRsPgR_Dictionary();
   static void maplEintcOmaplETStringcOTStringgRsPgR_TClassManip(TClass*);
   static void *new_maplEintcOmaplETStringcOTStringgRsPgR(void *p = 0);
   static void *newArray_maplEintcOmaplETStringcOTStringgRsPgR(Long_t size, void *p);
   static void delete_maplEintcOmaplETStringcOTStringgRsPgR(void *p);
   static void deleteArray_maplEintcOmaplETStringcOTStringgRsPgR(void *p);
   static void destruct_maplEintcOmaplETStringcOTStringgRsPgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<int,map<TString,TString> >*)
   {
      map<int,map<TString,TString> > *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<int,map<TString,TString> >));
      static ::ROOT::TGenericClassInfo 
         instance("map<int,map<TString,TString> >", -2, "map", 96,
                  typeid(map<int,map<TString,TString> >), DefineBehavior(ptr, ptr),
                  &maplEintcOmaplETStringcOTStringgRsPgR_Dictionary, isa_proxy, 0,
                  sizeof(map<int,map<TString,TString> >) );
      instance.SetNew(&new_maplEintcOmaplETStringcOTStringgRsPgR);
      instance.SetNewArray(&newArray_maplEintcOmaplETStringcOTStringgRsPgR);
      instance.SetDelete(&delete_maplEintcOmaplETStringcOTStringgRsPgR);
      instance.SetDeleteArray(&deleteArray_maplEintcOmaplETStringcOTStringgRsPgR);
      instance.SetDestructor(&destruct_maplEintcOmaplETStringcOTStringgRsPgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<int,map<TString,TString> > >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<int,map<TString,TString> >*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplEintcOmaplETStringcOTStringgRsPgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<int,map<TString,TString> >*)0x0)->GetClass();
      maplEintcOmaplETStringcOTStringgRsPgR_TClassManip(theClass);
   return theClass;
   }

   static void maplEintcOmaplETStringcOTStringgRsPgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplEintcOmaplETStringcOTStringgRsPgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<int,map<TString,TString> > : new map<int,map<TString,TString> >;
   }
   static void *newArray_maplEintcOmaplETStringcOTStringgRsPgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<int,map<TString,TString> >[nElements] : new map<int,map<TString,TString> >[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplEintcOmaplETStringcOTStringgRsPgR(void *p) {
      delete ((map<int,map<TString,TString> >*)p);
   }
   static void deleteArray_maplEintcOmaplETStringcOTStringgRsPgR(void *p) {
      delete [] ((map<int,map<TString,TString> >*)p);
   }
   static void destruct_maplEintcOmaplETStringcOTStringgRsPgR(void *p) {
      typedef map<int,map<TString,TString> > current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<int,map<TString,TString> >

namespace ROOT {
   static TClass *maplEintcOmaplETStringcOLong64_tgRsPgR_Dictionary();
   static void maplEintcOmaplETStringcOLong64_tgRsPgR_TClassManip(TClass*);
   static void *new_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p = 0);
   static void *newArray_maplEintcOmaplETStringcOLong64_tgRsPgR(Long_t size, void *p);
   static void delete_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p);
   static void deleteArray_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p);
   static void destruct_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<int,map<TString,Long64_t> >*)
   {
      map<int,map<TString,Long64_t> > *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<int,map<TString,Long64_t> >));
      static ::ROOT::TGenericClassInfo 
         instance("map<int,map<TString,Long64_t> >", -2, "map", 96,
                  typeid(map<int,map<TString,Long64_t> >), DefineBehavior(ptr, ptr),
                  &maplEintcOmaplETStringcOLong64_tgRsPgR_Dictionary, isa_proxy, 0,
                  sizeof(map<int,map<TString,Long64_t> >) );
      instance.SetNew(&new_maplEintcOmaplETStringcOLong64_tgRsPgR);
      instance.SetNewArray(&newArray_maplEintcOmaplETStringcOLong64_tgRsPgR);
      instance.SetDelete(&delete_maplEintcOmaplETStringcOLong64_tgRsPgR);
      instance.SetDeleteArray(&deleteArray_maplEintcOmaplETStringcOLong64_tgRsPgR);
      instance.SetDestructor(&destruct_maplEintcOmaplETStringcOLong64_tgRsPgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<int,map<TString,Long64_t> > >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<int,map<TString,Long64_t> >*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplEintcOmaplETStringcOLong64_tgRsPgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<int,map<TString,Long64_t> >*)0x0)->GetClass();
      maplEintcOmaplETStringcOLong64_tgRsPgR_TClassManip(theClass);
   return theClass;
   }

   static void maplEintcOmaplETStringcOLong64_tgRsPgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<int,map<TString,Long64_t> > : new map<int,map<TString,Long64_t> >;
   }
   static void *newArray_maplEintcOmaplETStringcOLong64_tgRsPgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<int,map<TString,Long64_t> >[nElements] : new map<int,map<TString,Long64_t> >[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p) {
      delete ((map<int,map<TString,Long64_t> >*)p);
   }
   static void deleteArray_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p) {
      delete [] ((map<int,map<TString,Long64_t> >*)p);
   }
   static void destruct_maplEintcOmaplETStringcOLong64_tgRsPgR(void *p) {
      typedef map<int,map<TString,Long64_t> > current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<int,map<TString,Long64_t> >

namespace ROOT {
   static TClass *maplETStringcOintgR_Dictionary();
   static void maplETStringcOintgR_TClassManip(TClass*);
   static void *new_maplETStringcOintgR(void *p = 0);
   static void *newArray_maplETStringcOintgR(Long_t size, void *p);
   static void delete_maplETStringcOintgR(void *p);
   static void deleteArray_maplETStringcOintgR(void *p);
   static void destruct_maplETStringcOintgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<TString,int>*)
   {
      map<TString,int> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<TString,int>));
      static ::ROOT::TGenericClassInfo 
         instance("map<TString,int>", -2, "map", 96,
                  typeid(map<TString,int>), DefineBehavior(ptr, ptr),
                  &maplETStringcOintgR_Dictionary, isa_proxy, 0,
                  sizeof(map<TString,int>) );
      instance.SetNew(&new_maplETStringcOintgR);
      instance.SetNewArray(&newArray_maplETStringcOintgR);
      instance.SetDelete(&delete_maplETStringcOintgR);
      instance.SetDeleteArray(&deleteArray_maplETStringcOintgR);
      instance.SetDestructor(&destruct_maplETStringcOintgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<TString,int> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<TString,int>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplETStringcOintgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<TString,int>*)0x0)->GetClass();
      maplETStringcOintgR_TClassManip(theClass);
   return theClass;
   }

   static void maplETStringcOintgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplETStringcOintgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,int> : new map<TString,int>;
   }
   static void *newArray_maplETStringcOintgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,int>[nElements] : new map<TString,int>[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplETStringcOintgR(void *p) {
      delete ((map<TString,int>*)p);
   }
   static void deleteArray_maplETStringcOintgR(void *p) {
      delete [] ((map<TString,int>*)p);
   }
   static void destruct_maplETStringcOintgR(void *p) {
      typedef map<TString,int> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<TString,int>

namespace ROOT {
   static TClass *maplETStringcOdoublegR_Dictionary();
   static void maplETStringcOdoublegR_TClassManip(TClass*);
   static void *new_maplETStringcOdoublegR(void *p = 0);
   static void *newArray_maplETStringcOdoublegR(Long_t size, void *p);
   static void delete_maplETStringcOdoublegR(void *p);
   static void deleteArray_maplETStringcOdoublegR(void *p);
   static void destruct_maplETStringcOdoublegR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<TString,double>*)
   {
      map<TString,double> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<TString,double>));
      static ::ROOT::TGenericClassInfo 
         instance("map<TString,double>", -2, "map", 96,
                  typeid(map<TString,double>), DefineBehavior(ptr, ptr),
                  &maplETStringcOdoublegR_Dictionary, isa_proxy, 0,
                  sizeof(map<TString,double>) );
      instance.SetNew(&new_maplETStringcOdoublegR);
      instance.SetNewArray(&newArray_maplETStringcOdoublegR);
      instance.SetDelete(&delete_maplETStringcOdoublegR);
      instance.SetDeleteArray(&deleteArray_maplETStringcOdoublegR);
      instance.SetDestructor(&destruct_maplETStringcOdoublegR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<TString,double> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<TString,double>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplETStringcOdoublegR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<TString,double>*)0x0)->GetClass();
      maplETStringcOdoublegR_TClassManip(theClass);
   return theClass;
   }

   static void maplETStringcOdoublegR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplETStringcOdoublegR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,double> : new map<TString,double>;
   }
   static void *newArray_maplETStringcOdoublegR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,double>[nElements] : new map<TString,double>[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplETStringcOdoublegR(void *p) {
      delete ((map<TString,double>*)p);
   }
   static void deleteArray_maplETStringcOdoublegR(void *p) {
      delete [] ((map<TString,double>*)p);
   }
   static void destruct_maplETStringcOdoublegR(void *p) {
      typedef map<TString,double> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<TString,double>

namespace ROOT {
   static TClass *maplETStringcOTStringgR_Dictionary();
   static void maplETStringcOTStringgR_TClassManip(TClass*);
   static void *new_maplETStringcOTStringgR(void *p = 0);
   static void *newArray_maplETStringcOTStringgR(Long_t size, void *p);
   static void delete_maplETStringcOTStringgR(void *p);
   static void deleteArray_maplETStringcOTStringgR(void *p);
   static void destruct_maplETStringcOTStringgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<TString,TString>*)
   {
      map<TString,TString> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<TString,TString>));
      static ::ROOT::TGenericClassInfo 
         instance("map<TString,TString>", -2, "map", 96,
                  typeid(map<TString,TString>), DefineBehavior(ptr, ptr),
                  &maplETStringcOTStringgR_Dictionary, isa_proxy, 0,
                  sizeof(map<TString,TString>) );
      instance.SetNew(&new_maplETStringcOTStringgR);
      instance.SetNewArray(&newArray_maplETStringcOTStringgR);
      instance.SetDelete(&delete_maplETStringcOTStringgR);
      instance.SetDeleteArray(&deleteArray_maplETStringcOTStringgR);
      instance.SetDestructor(&destruct_maplETStringcOTStringgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<TString,TString> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<TString,TString>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplETStringcOTStringgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<TString,TString>*)0x0)->GetClass();
      maplETStringcOTStringgR_TClassManip(theClass);
   return theClass;
   }

   static void maplETStringcOTStringgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplETStringcOTStringgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,TString> : new map<TString,TString>;
   }
   static void *newArray_maplETStringcOTStringgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,TString>[nElements] : new map<TString,TString>[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplETStringcOTStringgR(void *p) {
      delete ((map<TString,TString>*)p);
   }
   static void deleteArray_maplETStringcOTStringgR(void *p) {
      delete [] ((map<TString,TString>*)p);
   }
   static void destruct_maplETStringcOTStringgR(void *p) {
      typedef map<TString,TString> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<TString,TString>

namespace ROOT {
   static TClass *maplETStringcOLong64_tgR_Dictionary();
   static void maplETStringcOLong64_tgR_TClassManip(TClass*);
   static void *new_maplETStringcOLong64_tgR(void *p = 0);
   static void *newArray_maplETStringcOLong64_tgR(Long_t size, void *p);
   static void delete_maplETStringcOLong64_tgR(void *p);
   static void deleteArray_maplETStringcOLong64_tgR(void *p);
   static void destruct_maplETStringcOLong64_tgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<TString,Long64_t>*)
   {
      map<TString,Long64_t> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<TString,Long64_t>));
      static ::ROOT::TGenericClassInfo 
         instance("map<TString,Long64_t>", -2, "map", 96,
                  typeid(map<TString,Long64_t>), DefineBehavior(ptr, ptr),
                  &maplETStringcOLong64_tgR_Dictionary, isa_proxy, 0,
                  sizeof(map<TString,Long64_t>) );
      instance.SetNew(&new_maplETStringcOLong64_tgR);
      instance.SetNewArray(&newArray_maplETStringcOLong64_tgR);
      instance.SetDelete(&delete_maplETStringcOLong64_tgR);
      instance.SetDeleteArray(&deleteArray_maplETStringcOLong64_tgR);
      instance.SetDestructor(&destruct_maplETStringcOLong64_tgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<TString,Long64_t> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const map<TString,Long64_t>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplETStringcOLong64_tgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const map<TString,Long64_t>*)0x0)->GetClass();
      maplETStringcOLong64_tgR_TClassManip(theClass);
   return theClass;
   }

   static void maplETStringcOLong64_tgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplETStringcOLong64_tgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,Long64_t> : new map<TString,Long64_t>;
   }
   static void *newArray_maplETStringcOLong64_tgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) map<TString,Long64_t>[nElements] : new map<TString,Long64_t>[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplETStringcOLong64_tgR(void *p) {
      delete ((map<TString,Long64_t>*)p);
   }
   static void deleteArray_maplETStringcOLong64_tgR(void *p) {
      delete [] ((map<TString,Long64_t>*)p);
   }
   static void destruct_maplETStringcOLong64_tgR(void *p) {
      typedef map<TString,Long64_t> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class map<TString,Long64_t>

namespace {
  void TriggerDictionaryInitialization_AnalysisCamROOTLibDict_Impl() {
    static const char* headers[] = {
"AnalysisCamROOT/TChannelInfo.h",
0
    };
    static const char* includePaths[] = {
"..",
"/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/sw/lcg/releases/LCG_81e/ROOT/6.04.16/x86_64-slc6-gcc49-opt/include",
"/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/sw/lcg/releases/LCG_81e/ROOT/6.04.16/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/x86_64-slc6-gcc49-opt/",
0
    };
    static const char* fwdDeclCode = 
R"DICTFWDDCLS(
#pragma clang diagnostic ignored "-Wkeyword-compat"
#pragma clang diagnostic ignored "-Wignored-attributes"
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
extern int __Cling_Autoloading_Map;
class __attribute__((annotate("$clingAutoload$AnalysisCamROOT/LinkDef.h")))  TChannelInfo;
)DICTFWDDCLS";
    static const char* payloadCode = R"DICTPAYLOAD(

#ifndef G__VECTOR_HAS_CLASS_ITERATOR
  #define G__VECTOR_HAS_CLASS_ITERATOR 1
#endif

#define _BACKWARD_BACKWARD_WARNING_H
#include "AnalysisCamROOT/TChannelInfo.h"

#undef  _BACKWARD_BACKWARD_WARNING_H
)DICTPAYLOAD";
    static const char* classesHeaders[]={
"TChannelInfo", payloadCode, "@",
nullptr};

    static bool isInitialized = false;
    if (!isInitialized) {
      TROOT::RegisterModule("AnalysisCamROOTLibDict",
        headers, includePaths, payloadCode, fwdDeclCode,
        TriggerDictionaryInitialization_AnalysisCamROOTLibDict_Impl, {}, classesHeaders);
      isInitialized = true;
    }
  }
  static struct DictInit {
    DictInit() {
      TriggerDictionaryInitialization_AnalysisCamROOTLibDict_Impl();
    }
  } __TheDictionaryInitializer;
}
void TriggerDictionaryInitialization_AnalysisCamROOTLibDict() {
  TriggerDictionaryInitialization_AnalysisCamROOTLibDict_Impl();
}
