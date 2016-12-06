# echo "setup ZdZdPlotting ZdZdPlotting-00-00-00 in /afs/cern.ch/work/d/diboye/ZdZdTestArea"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtZdZdPlottingtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtZdZdPlottingtempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=ZdZdPlotting -version=ZdZdPlotting-00-00-00 -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea  -no_cleanup $* >${cmtZdZdPlottingtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=ZdZdPlotting -version=ZdZdPlotting-00-00-00 -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea  -no_cleanup $* >${cmtZdZdPlottingtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtZdZdPlottingtempfile}
  unset cmtZdZdPlottingtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtZdZdPlottingtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtZdZdPlottingtempfile}
unset cmtZdZdPlottingtempfile
return $cmtsetupstatus

