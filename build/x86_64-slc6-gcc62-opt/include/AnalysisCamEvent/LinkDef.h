#define ANALYSISCAMEVENT_ANALYSISCAMEVENTDICT_H

//this define is needed in 2.4 series, for dictionary compilation 
#define GAUDI_V20_COMPAT

#include "AnalysisCamEvent/CamEvent.h"
#include "AnalysisCamEvent/CamDeque.h"
#include "AnalysisCamEvent/CamVector.h"
#include "AnalysisCamEvent/CamObject.h"

#pragma link C++ class CamObject+;
#pragma link C++ class CamVector+;
#pragma link C++ class CamDeque+;
#pragma link C++ class CamEvent+;
