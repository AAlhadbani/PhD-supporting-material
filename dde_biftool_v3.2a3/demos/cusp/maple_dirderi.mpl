## Create directional derivatives with maple
#
# If command line maple is in the path this file can be called with
# >maple maple_dirderi.mpl
#
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

#
restart:
# if the file is called inside a worksheet, uncomment the interface line
curdir:=currentdir();
#curdir:=interface(worksheetdir);
# load library for creating directional derivatives of DDE-Biftool
# functionals
read(FileTools[JoinPath]([curdir,"..","..","external_tools","ddebiftool_deri.mpl"]));
# enter desired file name for matlab function file
filename:="cusp_dirderi.m";
file:=FileTools[JoinPath]([curdir,filename]);
# enter functional (for sd-ddes in full functional form, for
# constant-delay dde x[j,k] is the jth component with delay number k-1)
alpha:=u->1/(1+exp(-4*u))-1/2;
f0:=Vector([
-x[1,1]+p[1]*alpha(x[1,2])-p[2]*x[2,2]+p[4],
-x[2,1]+p[3]*alpha(x[1,2])+p[5]]);
# call of derivative genrating routine
# fcnstr is text of matlab file, formula is maple expression with derivatives
fcnstr,formula:=ddebiftool_deri[dirderi](f0,1,5):
formula;
# save string to file
fd := fopen(file, WRITE):
fprintf(fd,fcnstr):
fclose(fd):
quit

