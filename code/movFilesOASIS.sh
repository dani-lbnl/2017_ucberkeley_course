#!/bin/bash
echo "Untar-ing OASIS database"
tar xvf oasis_cross-sectional_disc6.tar.gz
tar xvf oasis_cross-sectional_disc7.tar.gz
tar xvf oasis_cross-sectional_disc8.tar.gz
tar xvf oasis_cross-sectional_disc9.tar.gz
tar xvf oasis_cross-sectional_disc10.tar.gz
tar xvf oasis_cross-sectional_disc11.tar.gz
tar xvf oasis_cross-sectional_disc12.tar.gz

echo "Moving all discs to disc1 directory"
cp -r disc3/. disc1
cp -r disc4/. disc1
cp -r disc5/. disc1
cp -r disc6/. disc1
cp -r disc7/. disc1
cp -r disc8/. disc1
cp -r disc9/. disc1
cp -r disc10/. disc1
cp -r disc11/. disc1
cp -r disc12/. disc1
echo "---"
echo "mission done"

