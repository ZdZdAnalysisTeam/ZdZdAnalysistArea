# echo "setup ZdZdPlotting ZdZdPlotting-00-00-00 in /afs/cern.ch/work/d/diboye/ZdZdTestArea"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/CMT/v1r25p20160527
endif
source ${CMTROOT}/mgr/setup.csh
set cmtZdZdPlottingtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtZdZdPlottingtempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=ZdZdPlotting -version=ZdZdPlotting-00-00-00 -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea  -no_cleanup $* >${cmtZdZdPlottingtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=ZdZdPlotting -version=ZdZdPlotting-00-00-00 -path=/afs/cern.ch/work/d/diboye/ZdZdTestArea  -no_cleanup $* >${cmtZdZdPlottingtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtZdZdPlottingtempfile}
  unset cmtZdZdPlottingtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtZdZdPlottingtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtZdZdPlottingtempfile}
unset cmtZdZdPlottingtempfile
exit $cmtsetupstatus

