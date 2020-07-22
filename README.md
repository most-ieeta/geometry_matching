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

The *calc_and_write_correlations* function requires three parameters: (i) the file name prefix (which may contain the path to the file), (ii) the number of the first file and (iii) the number of the second file. Hence running *eval calc_and_write_correlations('data/dataset1/image_, 1, 2);* in Octave results in the matching between the geometry in the file * data/dataset1/image_00001.png.pof* and the geometry in the file *data/dataset1/image_00002.png.pof*



## Reference

This code was originally based on the following work: 

> O. van Kaick, G. Hamarneh, H. Zhang, P. Wighton
"Contour Correspondence via Ant Colony Optimization"
Proc. 15th Pacific Conference on Computer Graphics and Applications (Pacific Graphics 2007), pp. 271-280, 2007.
http://dx.doi.org/10.1109/PG.2007.56

Source-code available at:

https://www.mathworks.com/matlabcentral/fileexchange/24094-contour-correspondence-via-ant-colony-optimization




## MoST Project

This repository is part of the **MoST - Modeling, Querying and Interactive Visualization of Spatiotemporal Data** project. This work is being developed at IEETA (Institute of Electronics and Informatics Engineering of Aveiro) and DETI (Departament of Electronic, Telecommunications and Informatics) from the University of Aveiro (www.ua.pt) and is partially funded by National Funds through the FCT (Foundation for Science and Technology) in the context of projects UID/CEC/00127/2013 and POCI-01-0145-FEDER-032636. The institutions participating in this project are the Institute of Electronics and Informatics Engineering of Aveiro (IEETA) and the Research Group on Emissions, Modelling and Climate Change (GEMAC), both from the University of Aveiro, and the INESC TEC.

To more information about the MoST project, visit the [MoST website: http://most.web.ua.pt/](http://most.web.ua.pt/).
