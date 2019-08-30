Distributional Values
=====================

An implementation of Distributional Values that might eventually replace all current TruthValues.

Issues and Goals
----------------

One of the problems this is trying to solve is the combination of fuzzy and probabilistic logic. As both are used within OpenCog it is important to not only be able to clearly represent and distinguish them but also use them together in a combined for. That way no matter if the algorithm expects fuzzy or probabilistic logic values they can work on a DistributionalValue. Which improves interoperability.
Another issue this improves upon is the accuracy and detail of TruthValues albeit at the cost of higher complexity.
Going beyond TruthValues this would also allow us to store and work with other distributions not only about the Truthness of a something about any kind of attribute.

To approximate these arbitrary distributions we are going to use a Histogram and a second-order Dirichlet-Distribution to keep track of our uncertainty.
For this to work efficiently we have a couple of requirements that our implementation should fulfill:

 - The size should be linear in the number of bins in the Histogram as we might have millions of these Histograms anything more would be problematic.

 - Support for N-Dimensions to represent joint-distributions without increasing the complexity of the algorithms using the Histograms.

 - Low complexity for finding a given bin. Iterating over all bins would be to slow.

 - Being able to incrementally built the Histogram. As we can't store all observations we need to immediately include them in the corresponding Histograms. The difficulty here is that we need to be able to move bins around easily.
 
To reduce the complexity of algorithms working with this representation it is better to only store the centers of bins instead of proper Intervals as is common with Histograms. With this simplification and the requirements above it's more accurate to say that we are looking for a clustering algorithm with each bin corresponding to a cluster.

CoverTree
---------

Our base data Structure is a CoverTree. CoverTrees are designed to speed up nearest neighbor search. If we compare them to our requirements above we can see that they are all fulfilled. They are linear in size and because CoverTrees require only a distance metric to construct they work well in N-dimensions. The efficient nearest neighbor search allows us to quickly find a bin. And when we have to move a bin while incrementally building the Histogram this is doable. Since we move the bins only slightly (if we add a new data point it could move the bin closest to it in it's direction) in the normal case this should be doable without requiring a change in the trees structure, in the worst case it would only require a sub-section of the tree to moved or reinserted.

More detailed information can be found in the paper "Faster Cover Trees" by Mike Izbicki and Christian R. Shelton
https://izbicki.me/public/papers/icml2015-faster-cover-trees.pdf

CTHist
------

A Histogram based on a CoverTree. This is basically a CoverTree with some additions and alterations. Primarily that it has a maximum number of elements. This necessitates some changes to the insert function so when we have already inserted the max number of elements any additional data points will get merged with their nearest neighbor.
We also add a modified nearest neighbor search that considers direction. Which is necessary to find the Nodes surrounding a point, so we can average their values to get an approximation of the value at the given point. 
This is important for us because when we have multiple distributions about the same underlying variable the bins will likely not line up. So if we can remap one Distribution by taking the bins of the other and getting the averaged value for those bins in the Distribution we can solve this.
With this we have a way to represent Joint Probability Distributions where each Variable corresponds to a dimensions in the Histogram.

DistributionalValue
-------------------

A OpenCog Value representing a Dirichlet Distribution. Each category of this Distribution corresponds to a bin in the underlying CTHist/Histogram. 
Which are simplified such that each bin only stores the center of a interval. While this is somewhat less accurate it makes up for it by simplifying and speeding up certain calculations in higher dimensions.

ConditionalDV
-------------

Similar to a DistributionalValue but containing a second order CTHist were each node contains CTHist<double>.
Which allows a better TV representation for InheritanceLinks and other similar links.

DVFormulas
----------

Various formulas for doing calculations with DistributionalValues and ConditionalDVs that don't fit directly in either class.
