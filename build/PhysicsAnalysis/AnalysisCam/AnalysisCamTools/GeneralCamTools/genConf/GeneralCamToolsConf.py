#Fri Nov  2 16:14:44 2018"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.GaudiHandles import *
from AthenaCommon.Configurable import *

class ChannelInfoTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'ExtraInputs' : [], # list
    'ExtraOutputs' : [], # list
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'OutputFilename' : '', # str
    'WriteToStreams' : [  ], # list
    'PrintCutflow' : False, # bool
  }
  _propertyDocDct = { 
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
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
