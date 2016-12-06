# echo "cleanup GeneralCamTools GeneralCamTools-02-00-00-branch in /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtGeneralCamToolstempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtGeneralCamToolstempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe cleanup -sh -pack=GeneralCamTools -version=GeneralCamTools-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools  $* >${cmtGeneralCamToolstempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe cleanup -sh -pack=GeneralCamTools -version=GeneralCamTools-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools  $* >${cmtGeneralCamToolstempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtGeneralCamToolstempfile}
  unset cmtGeneralCamToolstempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtGeneralCamToolstempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtGeneralCamToolstempfile}
unset cmtGeneralCamToolstempfile
return $cmtcleanupstatus

