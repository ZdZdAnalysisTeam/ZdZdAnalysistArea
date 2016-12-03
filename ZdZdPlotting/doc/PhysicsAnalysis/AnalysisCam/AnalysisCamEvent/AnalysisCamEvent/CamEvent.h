#ifndef ANALYSISCAM_CAMEVENT_H
#define ANALYSISCAM_CAMEVENT_H

#include "CamObject.h"
#include "CamDeque.h"
#include "CamVector.h"

#include "xAODEventInfo/EventInfo.h"

class AthAlgorithm;class AthAlgTool;

//CamEvent object can have parents, but the event() method stops here

class CamEvent: public CamObject {

   public:
      using CamObject::operator=;

      static bool isSimulation(CamObject& c); //helper method for CamEvent that use xAOD::EventInfo

      static bool AutoCreateObjects; //says whether objects/deques should be made in get calls
      CamEvent();
      CamEvent(AthAlgorithm* caller);
      CamEvent(AthAlgTool* caller);
      ~CamEvent();

      virtual CamEvent* event() { return this; }

      void clear();

      bool hasVector(std::string name);
      bool hasDeque(std::string name);
      bool hasObject(std::string name);

      CamVector* createVector(std::string name,const xAOD::IParticleContainer* cont=0);
      CamDeque* createDeque(std::string name, const xAOD::IParticleContainer* cont=0);
      CamObject* createObject(std::string name);

      CamVector* addVector(CamVector *vector,std::string name="");
      CamDeque* addDeque(CamDeque *deque,std::string name="");
      CamObject* addObject(CamObject *object,std::string name="");

      CamVector* getVector(std::string name);
      CamDeque* getDeque(std::string name);
      CamObject* getObject(std::string name);

      //special accessor for MET objects
      CamObject* getMETObject(const std::string& containerName, const std::string& term="Final");

      void changeName(CamObject* obj, std::string newName); ///change the name of something in the event

      std::string getObjectName(CamObject* obj); ///find the name of this object

      virtual std::string applyTool(std::string toolName,std::string label="",std::string option="");
      virtual std::string applyService(std::string toolName,std::string label="",std::string option="");

      //typecast operators for CamEvent -> xAOD::EventInfo .. warning: potentially unsafe!!!
      operator const xAOD::EventInfo& () { return *(static_cast<const xAOD::EventInfo*>(m_xAODParticle)); }
      operator const xAOD::EventInfo* () { return (static_cast<const xAOD::EventInfo*>(m_xAODParticle)); }

      std::map<std::string,CamObject*>* getObjectMap() { return &m_objects; }
   protected:
      //std::map<std::string,CamDeque> m_deques;

      std::map<std::string,CamObject*> m_objects;
      
   public:
        //ClassDef(CamEvent,1)
};
CLASS_DEF( CamEvent , 115756999 , 1 )


#endif