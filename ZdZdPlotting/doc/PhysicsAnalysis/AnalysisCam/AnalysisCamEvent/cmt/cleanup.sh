# echo "cleanup AnalysisCamEvent AnalysisCamEvent-02-00-00-branch in /afs/cern.ch/work/d/diboye/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtAnalysisCamEventtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtAnalysisCamEventtempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe cleanup -sh -pack=AnalysisCamEvent -version=AnalysisCamEvent-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -quiet -without_version_directory $* >${cmtAnalysisCamEventtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe cleanup -sh -pack=AnalysisCamEvent -version=AnalysisCamEvent-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -quiet -without_version_directory $* >${cmtAnalysisCamEventtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtAnalysisCamEventtempfile}
  unset cmtAnalysisCamEventtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtAnalysisCamEventtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtAnalysisCamEventtempfile}
unset cmtAnalysisCamEventtempfile
return $cmtcleanupstatus

