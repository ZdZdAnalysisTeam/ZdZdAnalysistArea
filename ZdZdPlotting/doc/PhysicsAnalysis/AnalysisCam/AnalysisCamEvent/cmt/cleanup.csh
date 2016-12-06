# echo "cleanup AnalysisCamEvent AnalysisCamEvent-02-00-00-branch in /afs/cern.ch/work/d/diboye/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527
endif
source ${CMTROOT}/mgr/setup.csh
set cmtAnalysisCamEventtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtAnalysisCamEventtempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=AnalysisCamEvent -version=AnalysisCamEvent-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -quiet -without_version_directory $* >${cmtAnalysisCamEventtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=AnalysisCamEvent -version=AnalysisCamEvent-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -quiet -without_version_directory $* >${cmtAnalysisCamEventtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtAnalysisCamEventtempfile}
  unset cmtAnalysisCamEventtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtAnalysisCamEventtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtAnalysisCamEventtempfile}
unset cmtAnalysisCamEventtempfile
exit $cmtcleanupstatus

