# echo "setup AnalysisCamROOT AnalysisCamROOT-02-00-00-branch in /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtAnalysisCamROOTtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtAnalysisCamROOTtempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=AnalysisCamROOT -version=AnalysisCamROOT-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -no_cleanup $* >${cmtAnalysisCamROOTtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=AnalysisCamROOT -version=AnalysisCamROOT-02-00-00-branch -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam  -no_cleanup $* >${cmtAnalysisCamROOTtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtAnalysisCamROOTtempfile}
  unset cmtAnalysisCamROOTtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtAnalysisCamROOTtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtAnalysisCamROOTtempfile}
unset cmtAnalysisCamROOTtempfile
return $cmtsetupstatus

