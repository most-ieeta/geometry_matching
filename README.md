# Geometry matching tools

In this respository we have two versions of a geometry matching routine. The main difference between then is that the *standalone version* is configured to show the mathing results graphically, while the *SPT Datalab version* is configured to execute less work and provide a quicker response, which is required to execute geometry matching in batch mode through SPT-DataLab.

## Usage notes

The code can be run through Octave or Matlab.

### Standalone version

The main function is *calc_and_write_correlations*. It performs the matching between two geometries in files whose name must follow the pattern: name_*5-digit-0-padded-number*.png.pof

Each file the must store geometries coordinates, one pair of X-Y coordinates per line with a space between them, like in the following example:

```
763 211
759 213
742 214
717 215
713 215
```

The *calc_and_write_correlations* function requires three parameters: (i) the file name prefix (which may contain the path to the file), (ii) the number of the first file and (iii) the number of the second file. Hence running the following code in Octave results in the matching between the geometry in the file *data/dataset1/image_00001.png.pof* and the geometry in the file *data/dataset1/image_00002.png.pof*

```
eval calc_and_write_correlations('data/dataset1/image_, 1, 2);
```

The output of the function execution would contain a file *.corr* file and a *.tsv* (which would be *image_00001_00002.corr* and *image_00001_00002.tsv* for the above sample call).

The *.corr* file contains the coordinates for all the points of the first geometry and the coordinates of the corresponding points in the second geometry. The file contains one point of the first geometry per line and four columns of coordinates (the first two are from the first geometry and last two are from the second geometry) as in the following example.

```
776 212 775 212
770 214 773 214
742 214 745 214
730 216 731 216
727 214 727 216
```

The *.tsv* file contains the point number for all the points of the first geometry and the corresponding point numbers on the second geometry. The file contains one point of the first geometry per line and two columns (the first column is the point number in the first geometry and the second is the number of the matching point in the second geometry) as in the following example.

```
1 2
2 3
3 4
4 5
5 6
6 6
```


### SPT-DataLab version

The main function is *calc_and_write_sptdatalab*. The overall matching mechanism of this version is the same of the *standalone version*. But this version is configured to do not show graphic outputs and to generate less output files than the *standalone version* in order to achieve higher performance and to be integrated into [SPT-DataLab](https://github.com/most-ieeta/SPT-DataLab) - as described [here](https://github.com/most-ieeta/SPT-DataLab). 

## Reference

This code based on the following work: 

> O. van Kaick, G. Hamarneh, H. Zhang, P. Wighton
"Contour Correspondence via Ant Colony Optimization"
Proc. 15th Pacific Conference on Computer Graphics and Applications (Pacific Graphics 2007), pp. 271-280, 2007.
http://dx.doi.org/10.1109/PG.2007.56

Source-code available at:

https://www.mathworks.com/matlabcentral/fileexchange/24094-contour-correspondence-via-ant-colony-optimization




## MoST Project

This repository is part of the **MoST - Modeling, Querying and Interactive Visualization of Spatiotemporal Data** project. This work is being developed at IEETA (Institute of Electronics and Informatics Engineering of Aveiro) and DETI (Departament of Electronic, Telecommunications and Informatics) from the University of Aveiro (www.ua.pt) and is partially funded by National Funds through the FCT (Foundation for Science and Technology) in the context of projects UID/CEC/00127/2013 and POCI-01-0145-FEDER-032636. The institutions participating in this project are the Institute of Electronics and Informatics Engineering of Aveiro (IEETA) and the Research Group on Emissions, Modelling and Climate Change (GEMAC), both from the University of Aveiro, and the INESC TEC.

To more information about the MoST project, visit the [MoST website: http://most.web.ua.pt/](http://most.web.ua.pt/).
