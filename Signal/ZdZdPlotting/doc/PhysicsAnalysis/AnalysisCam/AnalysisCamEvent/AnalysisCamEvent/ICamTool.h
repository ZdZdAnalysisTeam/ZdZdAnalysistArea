#ifndef _ICAMTOOL_
#define _ICAMTOOL_


//----------------------------------------------------------
//object definition interface
//----------------------------------------------------------
#include "GaudiKernel/IAlgTool.h"

class CamObject;
class CamDeque;
class CamEvent;
class CamVector;

static const InterfaceID IID_ICamTool( "ICamTool", 1, 0 );

class ICamTool : virtual public IAlgTool {

   public:
      static const InterfaceID& interfaceID() { return IID_ICamTool; };

      //label should usually be modified to match the name of the object this thing creates in the CamEvent
      virtual StatusCode apply(CamEvent* event, std::string& label, std::string option)=0;
      virtual StatusCode apply(CamDeque* deque, std::string& label, std::string option)=0;
      virtual StatusCode apply(CamObject* object, std::string& label, std::string option)=0;
      virtual StatusCode apply(CamVector* vector, std::string& label, std::string option)=0;

      //these ones are applies with no effective return info, other than the StatusCode
      virtual StatusCode apply(CamEvent* event, std::string option)=0;
      virtual StatusCode apply(CamDeque* deque, std::string option)=0;
      virtual StatusCode apply(CamObject* object, std::string option)=0;
      virtual StatusCode apply(CamVector* vector, std::string option)=0;


      virtual void* get(std::string name="")=0;

};

#endif