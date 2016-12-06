#Sat Nov 19 20:07:23 2016"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.GaudiHandles import *
from GaudiKernel.Proxy.Configurable import *

class ChannelInfoTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'OutputFilename' : '', # str
    'WriteToStreams' : [  ], # list
    'PrintCutflow' : True, # bool
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(ChannelInfoTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'GeneralCamTools'
  def getType( self ):
      return 'ChannelInfoTool'
  pass # class ChannelInfoTool

class xAODLumiSvc( ConfigurableService ) :
  __slots__ = { 
    'OutputLevel' : 7, # int
    'AuditServices' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'AuditReInitialize' : False, # bool
    'AuditReStart' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'RequireLumi' : False, # bool
    'WriteXML' : False, # bool
  }
  _propertyDocDct = { 
    'RequireLumi' : """ Data must have at least one lumi string """,
    'WriteXML' : """ If true, will write an XML file too """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(xAODLumiSvc, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'GeneralCamTools'
  def getType( self ):
      return 'xAODLumiSvc'
  pass # class xAODLumiSvc
