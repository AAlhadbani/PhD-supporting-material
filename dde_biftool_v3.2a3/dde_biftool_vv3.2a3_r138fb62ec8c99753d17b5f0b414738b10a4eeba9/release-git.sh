#!/bin/bash
#
set -e 
#
# Check arguments
if [[ $# -lt 3 ]]; then
    echo "Usage: $0 codefolder releasefolder version [testprog]"
    echo " * calls git archive for latest commit of codefolder, putting export of codefolder into exportdir=releasefolder/dde_biftool_v{version}_r{gitcommit}"
    echo " * copies export to maindir=releasefolder/dde_biftool_v{version}"
    echo " * compiles manual, cover and other docs and copies them into newly created folder doc,"
    echo " * replaces Id lines and updates (c) lines with {version}(gitcommit)"
    echo " * insert {version} and {gitcommit} into Readme.html and creates Readme.txt from Readme.html"
    echo " * if testprog is given applies testprog to all demos (in temporary folder test)"
    echo "    possible choices for testprog: {matlab octave}"
    echo " * removes folders not intended for distribution"
    echo " * zips maindir into dde_biftool_v{version}.zip"
    echo " "
    echo " used programs:"
    echo " bash, git, pdflatex, bibtex, python (tested with 2.6), unix2dos, html2text"
    echo " for testing {matlab, octave}"
    exit
fi
codefolder=`cd $1;pwd`
releasebase=`cd $2;pwd`
version=$3
# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec > >(tee "$releasebase/logfile_v$version.txt")
if [[ $# -lt 4 ]]; then
    dotest=0
else
    dotest=1
    cmd=$4
fi
# obtain current revision number
cd $codefolder
echo codefolder: $codefolder
revision=`git rev-parse HEAD`
echo revision in $codefolder: $revision
# generate names for folders and files
name="dde_biftool_v"$version
zip=$name".zip"

# export to exportdir
exportdir=$releasebase"/"$name"_r"$revision
echo exportdir: $exportdir
mkdir -p $exportdir
rm -rf $exportdir/*
cp -Turp $codefolder $exportdir
#
# set (c) line in all m files
cd $exportdir
python $exportdir/tools/c_insert.py $exportdir $version
#
destdir="$name"
destdir=$releasebase/$destdir
docdir=$destdir/doc
license=$destdir/tools/license.txt
# copy everything over to destdir
echo destdir: $destdir
mkdir -p $destdir
rm -rf $destdir/*
cp -Turp $exportdir $destdir
cd $destdir
#
# set year in license.txt
year=`date +%G`
sed -i -- "s/|year|/$year/g" $license
#
# compile manuals
mkdir -p $docdir
cd $destdir/manual
cp -p $license ./license.txt
tex="manual Changes-v3"
echo '\newcommand{\version}{'$version'}' >version.tex

for x in $tex; do
    pdflatex $x && pdflatex $x && pdflatex $x && \
    bibtex $x && pdflatex $x && pdflatex $x && mv $x".pdf" $docdir
done
mv Addendum_Manual_DDE-BIFTOOL_2_03.pdf $docdir

nmfm="nmfm_extension_manual"
cd $destdir/manual/$nmfm
tex="nmfm_extension_description"
pdflatex $tex && pdflatex $tex && pdflatex $tex && \
    bibtex $tex && pdflatex $tex && pdflatex $tex && mv $tex".pdf" $docdir


# insert license and set version in readme
cd $destdir
nr=`awk -- '/\|license\|/{print NR}' Readme.html`
awk -- "NR<$nr"'{print $0}' Readme.html >tmp.txt
awk -- 'BEGIN{RS="\r\n"}{if(NF==0)print "<br><br>";else print $0}' $license >>tmp.txt
awk -- "NR>$nr"'{print $0}' Readme.html >>tmp.txt
sed  -- "s/|version|/$version/g" tmp.txt > Readme.html
rm -f tmp.txt
html2text Readme.html >Readme.txt
unix2dos Readme.txt

#
# if testing required perform tests of demos
if [[ $dotest -eq 1 ]]; then
    mkdir $destdir/test
    python $destdir/tools/test_demos.py $destdir $cmd
fi
#
# remove folders not intended for distribution (except tools)
rm -rf  manual FilesChangedAndAdded_V203 system test development
#
# create index.html in folders which don't have them
i=0
for i in `find "$destdir" -mindepth 1 -type d`; do
    index=$i"/index.html"
    if [[ ! ( -f $index ) ]]; then
	echo creating $index
	bash $destdir/tools/create_index_html.sh $destdir/tools/index_template.html $version $i
    fi
done
rm -rf tools etc tests development 
find $destdir \( -name ".git" -o -name ".gitignore" -o -name ".gitmodules" -o -name ".gitattributes" \) -exec rm -rf -- {} +
# zip
cd $releasebase
rm -rf $zip
zip -r $zip $name
