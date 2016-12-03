# echo "setup AnalysisCamROOT AnalysisCamROOT-02-00-00-branch in /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527
endif
source ${CMTROOT}/mgr/setup.csh
set cmtAnalysisCamROOTtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtAnalysisCamROOTtempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=AnalysisCamROOT -version=AnalysisCamROOT-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -no_cleanup $* >${cmtAnalysisCamROOTtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=AnalysisCamROOT -version=AnalysisCamROOT-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -no_cleanup $* >${cmtAnalysisCamROOTtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtAnalysisCamROOTtempfile}
  unset cmtAnalysisCamROOTtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtAnalysisCamROOTtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtAnalysisCamROOTtempfile}
unset cmtAnalysisCamROOTtempfile
exit $cmtsetupstatus

