
#include "GaudiKernel/DeclareFactoryEntries.h"

#include "../xAODLumiSvc.h"
#include "../ChannelInfoTool.h"

DECLARE_TOOL_FACTORY(ChannelInfoTool)

DECLARE_SERVICE_FACTORY(xAODLumiSvc)

DECLARE_FACTORY_ENTRIES(GeneralCamTools) {

   DECLARE_SERVICE(xAODLumiSvc)
   DECLARE_TOOL(ChannelInfoTool)

}