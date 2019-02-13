#Mon Feb  4 15:12:26 2019"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.GaudiHandles import *
from AthenaCommon.Configurable import *

class ZdZdPlottingAlg( ConfigurableAlgorithm ) :
  __slots__ = { 
    'OutputLevel' : 0, # int
    'Enable' : True, # bool
    'ErrorMax' : 1, # int
    'ErrorCounter' : 0, # int
    'ExtraInputs' : [], # list
    'ExtraOutputs' : [], # list
    'AuditAlgorithms' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditReinitialize' : False, # bool
    'AuditRestart' : False, # bool
    'AuditExecute' : False, # bool
    'AuditFinalize' : False, # bool
    'AuditBeginRun' : False, # bool
    'AuditEndRun' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'Timeline' : True, # bool
    'MonitorService' : 'MonitorSvc', # str
    'RegisterForContextService' : False, # bool
    'IsClonable' : False, # bool
    'Cardinality' : 1, # int
    'NeededResources' : [  ], # list
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'THistSvc' : ServiceHandle('THistSvc/THistSvc'), # GaudiHandle
    'RootStreamName' : '/ANALYSIS', # str
    'RootDirName' : '', # str
    'HistNamePrefix' : '', # str
    'HistNamePostfix' : '', # str
    'HistTitlePrefix' : '', # str
    'HistTitlePostfix' : '', # str
    'DebugEventNumber' : 0, # int
    'ChannelInfoFile' : '', # str
    'DoLowMassSelection' : False, # bool
    'DoValidationRegions' : True, # bool
    'UsePileupWeight' : True, # bool
    'UseEWcorrWeight' : True, # bool
    'UseScaleFactorWeight' : True, # bool
    'TestPileupWeight' : False, # bool
    'DoTriggerEfficiency' : False, # bool
  }
  _propertyDocDct = { 
    'DoTriggerEfficiency' : """ If true, will calculate trigger efficiency on MC """,
    'UseScaleFactorWeight' : """ If true, will use lepton scale factor weight """,
    'DoLowMassSelection' : """ If true, will do the modified cutflow for low mass analysis """,
    'ChannelInfoFile' : """ Specify the merged file containing the sum of weights info """,
    'TestPileupWeight' : """ If true, will use pileupWeight-1 and not use scale factor weight """,
    'DebugEventNumber' : """ Specify a debug event number and when it hits it, will print filename and also go verbose mode for main execute """,
    'HistTitlePostfix' : """ The postfix for the histogram THx title """,
    'UsePileupWeight' : """ If true, will use pileup reweighting weight """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
    'DoValidationRegions' : """ If true, will also do the validation regions cutflow """,
    'IsClonable' : """ Thread-safe enough for cloning? """,
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'THistSvc' : """ Handle to a THistSvc instance: it will be used to write ROOT objects to ROOT files """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'RootStreamName' : """ Name of the output ROOT stream (file) that the THistSvc uses """,
    'HistTitlePrefix' : """ The prefix for the histogram THx title """,
    'HistNamePostfix' : """ The postfix for the histogram THx name """,
    'RootDirName' : """ Name of the ROOT directory inside the ROOT file where the histograms will go """,
    'UseEWcorrWeight' : """ If true, will use pileup reweighting weight """,
    'Cardinality' : """ How many clones to create """,
    'HistNamePrefix' : """ The prefix for the histogram THx name """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(ZdZdPlottingAlg, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'ZdZdPlotting'
  def getType( self ):
      return 'ZdZdPlottingAlg'
  pass # class ZdZdPlottingAlg
