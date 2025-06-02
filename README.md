### Note from the ModelDB Administrator: the below is a snapshot of the
[authors web site](http://web.njit.edu/~matveev/Scripts/LeapFrog/)
taken on April 13th, 2009.
___

# MATLAB code: leap-frog spiking due to non-weak inhibition

|                                       |                                                     |                                                     |                                                     |                                                     |
|---------------------------------------|-----------------------------------------------------|-----------------------------------------------------|-----------------------------------------------------|-----------------------------------------------------|
| **MATLAB code: leap-frog spiking due to non-weak inhibition** |                                                     |                                                     |                                                     |                                                     |
| [Calcium Calculator](http://web.njit.edu/%7Ematveev/calc.html) | [Teaching](http://web.njit.edu/%7Ematveev/Courses/courses.html) | [Publications](http://web.njit.edu/%7Ematveev/publications.html) | [Homepage](http://web.njit.edu/%7Ematveev/index.html) | [NJIT Math Dept](http://m.njit.edu/)                 |

The MATLAB scripts posted below reproduce any of the activity states shown in Fig. 1 of the manuscript:

|                                                                                                 |
|-------------------------------------------------------------------------------------------------|
| Myongkeun Oh and Victor Matveev (2009)
**Loss of phase-locking in non-weakly coupled inhibitory networks of type-I model neurons**
*Journal of Computational Neuroscience*, **26**(2): 303-320.
[DOI](http://dx.doi.org/10.1007/s10827-008-0112-8)                                                  |

Please place all files in the same directory before running the main simulation script **LeapFrogMovie.m**

---

|                                                                                          |                                                                                                                                                          |
|------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| ♦ [LeapFrogMovie.m](http://web.njit.edu/%7Ematveev/Scripts/LeapFrog/LeapFrogMovie.m)     | This m-script illustrates the geometry of the alternating-order (leap-frog / leader switching) spiking shown in Figure 1. By changing the parameter variable `Params`, any of the activity states in Figure 1 can be reproduced. |
| ♦ [MLode.m](http://web.njit.edu/%7Ematveev/Scripts/LeapFrog/MLode.m)                     | This ODE m-file implements the model equations (Eqs. 1-3).                                                                                               |
| ♦ [Vnullcline.m](http://web.njit.edu/%7Ematveev/Scripts/LeapFrog/Vnullcline.m)           | Calculates the V-nullcline; used by the main LeapFrogMovie script above.                                                                                 |

---

Supported in part by the **National Science Foundation** grants
**DMS 0417416** and **DMS 0817703** to Victor Matveev

---

[Victor Matveev](http://web.njit.edu/%7Ematveev)

This server is running a
[Redhat](http://www.redhat.com/) distribution of 
[Linux](https://www.linux.org/).

---
Last modified: April 12, 2009

Converted README to Markdown: June 2, 2025
