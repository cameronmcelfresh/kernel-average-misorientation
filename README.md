# kernel-average-misorientation
Kernel Average Misorientation Analysis of EBSD Patterns



## Getting Started
This collection of MATLAB scripts was developed to perform kernel-average misorientation analysis of raw EBSD patterns. Misorientation mapping can help better understand subgrain structure and processes such as dynamic recrystallization and pseudo-strain measurements. This code is currently designed to handle cubic structure and pure samples. 

If you are unfamiliar with the math behind crystallographic misorientation analysis, there background math section below may be helpful. 


## Installing
The script **main_kernel_calc.m** controls the entirity of the analysis. The following provided functions must be in the same directory as the main script to run:
- ebsd_parse.m
- euler_convert.m
- euler2rotationmatrix.m
- KAM_calc.m
- KAM_clean.m
- plot_KAM.m

## KAM Analysis
Varying EBSD detectors/softwares may vary in the structure of their raw EBSD data output. This script expects a .txt with a format resembling that given in the example file Ni.txt. 

#Phase0:\
#Name: Nickel (New)\
#Spacegroup: F m#ovl3m\
#A: 3.524\
#B: 3.524\
#C: 3.524\
#Alpha: 9E1\
#Beta: 9E1\
#Gamma: 9E1\
#Orientations:\
#Index Phase	x	y	phi1	PHI	phi2	Bands	BC	GrainIndex\
0	1	0	0	1.434201877E2	2.390389414E1	2.467704713E2	12	163	-1\
1	1	1	0	1.43549729E2	2.422165518E1	2.469476464E2	12	177	-1\
2	1	2	0	1.439342243E2	2.405383045E1	2.465798271E2	12	180	-1\
3	1	3	0	1.445457072E2	2.380896362E1	2.465767945E2	12	180	-1
4	1	4	0	1.445333411E2	2.394108922E1	2.46444562E2	11	178	-1
5	1	5	0	1.442472109E2	2.368202045E1	2.463594578E2	11	185	-1
6	1	6	0	1.437432727E2	2.346567406E1	2.471365148E2	10	162	-1
7	1	7	0	1.443801434E2	2.353161058E1	2.468962834E2	11	135	-1

...etc

However the most import feature of the raw EBSD file is the phi, PHI, and phi2 values for each pixel with respect to its index number. If the raw data for each pixel can be extracted (or provided), the rest of the table can be user generated. 

#### Input


#### Output



## Just a little bit of background math



## Modifying the Code




  
