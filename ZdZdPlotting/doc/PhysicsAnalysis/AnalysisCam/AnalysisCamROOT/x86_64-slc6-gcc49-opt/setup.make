----------> uses
# use AtlasPolicy AtlasPolicy-*  (no_version_directory)
#   use ExternalPolicy ExternalPolicy-* External (no_version_directory)
#     use PlatformPolicy PlatformPolicy-* External (no_version_directory)
#       use GaudiPolicy *  (no_version_directory)
#         use LCG_Settings *  (no_version_directory)
#         use Python * LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.7.9.p1)
#           use LCG_Configuration v*  (no_version_directory)
#           use LCG_Settings v*  (no_version_directory)
#         use tcmalloc * LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.4)
#           use LCG_Configuration v*  (no_version_directory)
#           use LCG_Settings v*  (no_version_directory)
#           use libunwind v* LCG_Interfaces (no_version_directory) (native_version=5c2cade)
#             use LCG_Configuration v*  (no_version_directory)
#             use LCG_Settings v*  (no_version_directory)
#         use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#           use LCG_Configuration v*  (no_version_directory)
#           use LCG_Settings v*  (no_version_directory)
#           use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=6.04.16)
#       use AtlasCommonPolicy AtlasCommonPolicy-*  (no_version_directory)
#         use LCG_Platforms *  (no_version_directory)
#         use AtlasDoxygen AtlasDoxygen-* Tools (no_version_directory) (native_version=)
#           use LCG_Settings *  (no_version_directory)
#           use LCG_Configuration *  (no_version_directory)
#             use LCG_Platforms *  (no_version_directory)
#     use Mac105_Compat Mac105_Compat-* External (no_version_directory) (native_version=1.0.0)
#       use AtlasExternalArea AtlasExternalArea-* External (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#         use PlatformPolicy PlatformPolicy-* External (no_version_directory)
#       use PlatformPolicy PlatformPolicy-* External (no_version_directory)
#   use AtlasCxxPolicy AtlasCxxPolicy-*  (no_version_directory)
#     use GaudiPolicy v*  (no_auto_imports) (no_version_directory)
#     use ExternalPolicy ExternalPolicy-* External (no_version_directory)
#     use AtlasCompilers AtlasCompilers-* External (no_version_directory)
#       use LCG_Platforms *  (no_version_directory)
#     use CheckerGccPlugins CheckerGccPlugins-* External (no_version_directory) (native_version=CheckerGccPlugins-00-01-84)
#       use ExternalPolicy ExternalPolicy-* External (no_version_directory)
#       use AtlasCompilers AtlasCompilers-* External (no_version_directory)
#   use AtlasCommonPolicy AtlasCommonPolicy-*  (no_version_directory)
#   use GaudiPolicy v*  (no_auto_imports) (no_version_directory)
#   use CodeCheck CodeCheck-* Tools (no_version_directory)
#   use AtlasDoxygen AtlasDoxygen-* Tools (no_version_directory) (native_version=)
# use AtlasROOT AtlasROOT-* External (no_version_directory)
#   use ExternalPolicy ExternalPolicy-* External (no_version_directory)
#   use ROOT v* LCG_Interfaces (no_version_directory) (native_version=6.04.16)
#     use LCG_Configuration v*  (no_version_directory)
#     use LCG_Settings v*  (no_version_directory)
#     use GCCXML v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=0.9.0_20131026)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.7.9.p1)
#     use xrootd v* LCG_Interfaces (no_version_directory) (native_version=4.2.3)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#
# Selection :
use CMT v1r25p20160527 (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22)
use CodeCheck CodeCheck-01-02-03 Tools (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use LCG_Platforms v1  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e)
use AtlasCompilers AtlasCompilers-00-00-25 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use LCG_Configuration v1  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e)
use LCG_Settings v1  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e)
use AtlasDoxygen AtlasDoxygen-00-04-10 Tools (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use AtlasCommonPolicy AtlasCommonPolicy-00-00-56  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use xrootd v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e)
use GCCXML v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e) (no_auto_imports)
use libunwind v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e) (no_auto_imports)
use tcmalloc v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e) (no_auto_imports)
use Python v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e) (no_auto_imports)
use ROOT v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e)
use Reflex v1 LCG_Interfaces (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e) (no_auto_imports)
use GaudiPolicy GaudiPolicy-15-05-00  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/GAUDI/v26r2p1-lcg81e)
use PlatformPolicy PlatformPolicy-00-00-20 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use AtlasExternalArea AtlasExternalArea-00-00-27 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use Mac105_Compat Mac105_Compat-00-00-01 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use ExternalPolicy ExternalPolicy-00-01-72 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use AtlasROOT AtlasROOT-02-03-28 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use CheckerGccPlugins CheckerGccPlugins-00-01-85 External (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use AtlasCxxPolicy AtlasCxxPolicy-00-00-77  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use AtlasPolicy AtlasPolicy-01-08-46-04  (/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22)
use CMTUSERCONTEXT v0 (/cvmfs/atlas.cern.ch/repo/tools/slc6/cmt)
----------> tags
x86_64-slc6-gcc49-opt (from CMTCONFIG) package [LCG_Platforms PlatformPolicy] implies [target-x86_64 target-slc6 target-gcc49 target-opt Linux slc6 64 gcc-4.9 opt x86_64-slc6-gcc49]
ATLAS (from arguments) package [GaudiPolicy] implies [use-shared-dir no-pyzip] applied [ExternalPolicy]
ManaCore (from arguments)
AthAnalysisBase (from arguments)
CMTv1 (from CMTVERSION)
CMTr25 (from CMTVERSION)
CMTp20160527 (from CMTVERSION)
Linux (from uname) package [CMT LCG_Platforms AtlasCxxPolicy AtlasPolicy] implies [Unix host-linux cpp_native_dependencies]
STANDALONE (from CMTSITE)
CMTUSERCONTEXT_no_config (from PROJECT) excludes [CMTUSERCONTEXT_config]
CMTUSERCONTEXT_no_root (from PROJECT) excludes [CMTUSERCONTEXT_root]
CMTUSERCONTEXT_cleanup (from PROJECT) excludes [CMTUSERCONTEXT_no_cleanup]
CMTUSERCONTEXT_scripts (from PROJECT) excludes [CMTUSERCONTEXT_no_scripts]
CMTUSERCONTEXT_no_prototypes (from PROJECT) excludes [CMTUSERCONTEXT_prototypes]
CMTUSERCONTEXT_with_installarea (from PROJECT) excludes [CMTUSERCONTEXT_without_installarea]
CMTUSERCONTEXT_without_version_directory (from PROJECT) excludes [CMTUSERCONTEXT_with_version_directory]
diboye_no_config (from PROJECT) excludes [diboye_config]
diboye_no_root (from PROJECT) excludes [diboye_root]
diboye_cleanup (from PROJECT) excludes [diboye_no_cleanup]
diboye_scripts (from PROJECT) excludes [diboye_no_scripts]
diboye_no_prototypes (from PROJECT) excludes [diboye_prototypes]
diboye_with_installarea (from PROJECT) excludes [diboye_without_installarea]
diboye_without_version_directory (from PROJECT) excludes [diboye_with_version_directory]
diboye (from PROJECT)
AthAnalysisBase_no_config (from PROJECT) excludes [AthAnalysisBase_config]
AthAnalysisBase_no_root (from PROJECT) excludes [AthAnalysisBase_root]
AthAnalysisBase_cleanup (from PROJECT) excludes [AthAnalysisBase_no_cleanup]
AthAnalysisBase_scripts (from PROJECT) excludes [AthAnalysisBase_no_scripts]
AthAnalysisBase_no_prototypes (from PROJECT) excludes [AthAnalysisBase_prototypes]
AthAnalysisBase_with_installarea (from PROJECT) excludes [AthAnalysisBase_without_installarea]
AthAnalysisBase_without_version_directory (from PROJECT) excludes [AthAnalysisBase_with_version_directory]
GAUDI_no_config (from PROJECT) excludes [GAUDI_config]
GAUDI_root (from PROJECT) excludes [GAUDI_no_root]
GAUDI_cleanup (from PROJECT) excludes [GAUDI_no_cleanup]
GAUDI_scripts (from PROJECT) excludes [GAUDI_no_scripts]
GAUDI_prototypes (from PROJECT) excludes [GAUDI_no_prototypes]
GAUDI_with_installarea (from PROJECT) excludes [GAUDI_without_installarea]
GAUDI_without_version_directory (from PROJECT) excludes [GAUDI_with_version_directory]
LCGCMT_no_config (from PROJECT) excludes [LCGCMT_config]
LCGCMT_no_root (from PROJECT) excludes [LCGCMT_root]
LCGCMT_cleanup (from PROJECT) excludes [LCGCMT_no_cleanup]
LCGCMT_scripts (from PROJECT) excludes [LCGCMT_no_scripts]
LCGCMT_prototypes (from PROJECT) excludes [LCGCMT_no_prototypes]
LCGCMT_with_installarea (from PROJECT) excludes [LCGCMT_without_installarea]
LCGCMT_without_version_directory (from PROJECT) excludes [LCGCMT_with_version_directory]
x86_64 (from package CMT) package [LCG_Platforms] implies [host-x86_64] applied [CMT]
slc68 (from package CMT) package [LCG_Platforms PlatformPolicy] implies [host-slc6] applied [CMT]
gcc493 (from package CMT) applied [CMT]
Unix (from package CMT) package [LCG_Platforms] implies [host-unix] excludes [WIN32 Win32]
c_native_dependencies (from package CMT) activated GaudiPolicy
cpp_native_dependencies (from package CMT) activated GaudiPolicy
/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22:/cvmfs/atlas.cern.ch/repo/sw/tdaq/tdaqnotProject (from package ExternalPolicy) applied [ExternalPolicy]
target-unix (from package LCG_Settings) activated LCG_Platforms
target-x86_64 (from package LCG_Settings) activated LCG_Platforms
target-gcc49 (from package LCG_Settings) package [LCG_Platforms] implies [target-gcc4 target-lcg-compiler lcg-compiler target-c11] activated LCG_Platforms
host-x86_64 (from package LCG_Settings) activated LCG_Platforms
target-slc (from package LCG_Settings) package [LCG_Platforms] implies [target-linux] activated LCG_Platforms
target-gcc (from package LCG_Settings) activated LCG_Platforms
target-gcc4 (from package LCG_Settings) package [LCG_Platforms] implies [target-gcc] activated LCG_Platforms
target-lcg-compiler (from package LCG_Settings) activated LCG_Platforms
host-linux (from package LCG_Platforms) package [LCG_Platforms] implies [host-unix]
host-unix (from package LCG_Platforms)
host-slc6 (from package LCG_Platforms) package [LCG_Platforms] implies [host-slc]
host-slc (from package LCG_Platforms) package [LCG_Platforms] implies [host-linux]
target-opt (from package LCG_Platforms)
target-slc6 (from package LCG_Platforms) package [LCG_Platforms] implies [target-slc]
target-linux (from package LCG_Platforms) package [LCG_Platforms] implies [target-unix]
lcg-compiler (from package LCG_Platforms)
target-c11 (from package LCG_Platforms)
ROOT_GE_5_15 (from package LCG_Configuration) applied [LCG_Configuration]
ROOT_GE_5_19 (from package LCG_Configuration) applied [LCG_Configuration]
ROOT_GE_6_00 (from package LCG_Configuration) applied [LCG_Configuration]
use-shared-dir (from package GaudiPolicy)
do_genconf (from package GaudiPolicy) applied [AtlasPolicy] activated AtlasPolicy
no-pyzip (from package GaudiPolicy)
separate-debug (from package AtlasCommonPolicy) excludes [no-separate-debug] applied [AtlasCommonPolicy]
NICOS (from package AtlasCommonPolicy) package AtlasCommonPolicy excludes [NICOSrel_nightly] applied [AtlasCommonPolicy]
LCGCMT_INSTALLED (from package PlatformPolicy) applied [PlatformPolicy ExternalPolicy]
block-tdaqc (from package PlatformPolicy) applied [PlatformPolicy ExternalPolicy]
opt (from package PlatformPolicy) package [AtlasPolicy] implies [optimized]
gcc (from package PlatformPolicy)
64 (from package PlatformPolicy) package [PlatformPolicy] implies [target-64]
gcc-4.9 (from package PlatformPolicy) package [PlatformPolicy] implies [gcc49x gcc49 gcc]
gcc49x (from package PlatformPolicy)
gcc49 (from package PlatformPolicy)
slc6 (from package PlatformPolicy)
x86_64-slc6-gcc49 (from package PlatformPolicy)
target-64 (from package PlatformPolicy)
asNeeded (from package PlatformPolicy) applied [PlatformPolicy]
CheckerGccPlugins_project_AthAnalysisBase (from package CheckerGccPlugins) applied [CheckerGccPlugins]
optimized (from package AtlasPolicy) package [AtlasPolicy] implies [opt]
HasAthenaRunTime (from package AtlasPolicy) applied [AtlasPolicy]
SITE_ (from package AtlasPolicy) applied [AtlasPolicy]
ROOTBasicLibs (from package AtlasROOT) applied [AtlasROOT]
ROOTMathLibs (from package AtlasROOT) applied [AnalysisCamROOT] activated AnalysisCamROOT
ROOTGraphicsLibs (from package AtlasROOT) applied [AnalysisCamROOT] activated AnalysisCamROOT
ROOTTableLibs (from package AtlasROOT) applied [AnalysisCamROOT] activated AnalysisCamROOT
ROOTRooFitLibs (from package AtlasROOT) applied [AnalysisCamROOT] activated AnalysisCamROOT
no_pack_dist_check (from package AnalysisCamROOT) applied [AnalysisCamROOT]
----------> CMTPATH
# Add path /cvmfs/atlas.cern.ch/repo/tools/slc6/cmt from CMTUSERCONTEXT
# Add path /afs/cern.ch/work/d/diboye/ZdZdTestArea from initialization
# Add path /cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22 from initialization
# Add path /cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/GAUDI/v26r2p1-lcg81e from ProjectPath
# Add path /cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/LCGCMT/LCGCMT_81e from ProjectPath
