# Luo_Lab_Sample_Code

This repository stores useful sample codes I used in Ray Luo lab at UCI. Assisted Model Building with Energy Refinement ([AMBER](http://ambermd.org/)) software package is used in our lab for molecular dynamics simulation.

 - [1MD_prep](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/1MD_prep): Scripts for MD input files preparation. Package required: tleap
 - [2Minimization](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/2Minimization): Scripts for free energy minimization before MD.
 - [3MD](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/3MD): Scripts for MD (Heating + NPT ensemble + NVT ensemble).
 - [4RMSD](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/4RMSD): Input files for trajectory RMSD calculation. Package required: cpptraj
 - [5MMPBSA_prep](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/5MMPBSA_prep): Scripts for MMPBSA input files preparation. Package required: tleap, cpptraj
 - [6MMPBSA](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/6MMPBSA): Scripts for MMPBSA calculation.
 - [7Native_Contacts](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/7Native_Contacts): Scripts for calculating the fraction of frames for each contacting atom pairs with reference to the first frame. Package required: cpptraj
 - [8Analysis_prep](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/8Analysis_prep): Scripts for preparing stability score of each trajectory, RMSD images, MMPBSA images, MMPBSA data points sample.
 - [9Score_Analysis](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/9Score_Analysis): Based on the stability scores, analysing the most probable candidate of binding poses for different ligands.
 - [10MMPBSA_Analysis](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/10MMPBSA_Analysis): Based on the sampled MMPBSA data points, testing hypotheses using t-test.
 - [11Visualization](https://github.com/ShijiZ/Luo_Lab_Sample_Code/tree/master/11Visualization): Scripts for easier MD trajectory visualization. Software required: VMD, chimera
 
