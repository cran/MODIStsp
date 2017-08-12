
-   [MODIStsp](#modistsp)
    -   [Important News ! MODIStsp content migrated to our new website !](#important-news-modistsp-content-migrated-to-our-new-website)
    -   [Problems and Issues](#problems-and-issues)
    -   [<i class="fa fa-desktop" aria-hidden="true"></i> System Requirements](#system-requirements)
    -   [<i class="fa fa-windows" aria-hidden="true"></i> Installing on Windows](#installing-on-windows)
    -   [<i class="fa fa-linux" aria-hidden="true"></i> Installing on Linux Systems](#installing-on-linux-systems)
    -   [<i class="fa fa-apple" aria-hidden="true"></i> Installing on Mac](#installing-on-mac)

[![](https://www.r-pkg.org/badges/version-ago/MODIStsp)](https://cran.r-project.org/package=MODIStsp) [![](http://cranlogs.r-pkg.org/badges/grand-total/MODIStsp?color=red)](https://cran.r-project.org/package=MODIStsp) [![Travis-CI Build Status](https://travis-ci.org/lbusett/MODIStsp.svg?branch=master)](https://travis-ci.org/lbusett/MODIStsp) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.290683.svg)](http://doi.org/10.5281/zenodo.290683)
[![Coverage Status](https://img.shields.io/codecov/c/github/lbusett/MODIStsp/master.svg)](http://codecov.io/github/lbusett/MODIStsp?branch=master)

MODIStsp
========

MODIStsp is a "R" package devoted to automatizing the creation of time series of rasters derived from MODIS Land Products data. MODIStsp allows to perform several preprocessing steps (e.g., download, mosaicing, reprojection and resize) on MODIS data available within a given time period. Users have the ability to select which specific layers of the original MODIS HDF files they want to process. They also can select which additional Quality Indicators should be extracted from the aggregated MODIS Quality Assurance layers and, in the case of Surface Reflectance products, which Spectral Indexes should be computed from the original reflectance bands. For each output layer, outputs are saved as single-band raster files corresponding to each available acquisition date. Virtual files allowing access to the entire time series as a single file can be also created. All processing parameters can be easily selected with a user-friendly GUI, although non-interactive execution exploiting a previously created Options File is possible. Stand-alone execution outside an "R" environment is also possible, allowing to use scheduled execution of MODIStsp to automatically update time series related to a MODIS product and extent whenever a new image is available.

*MODIStsp is developed and maintained by L.Busetto and L.Ranghetti, from the Institute of Remote Sensing of Environment - National Research Council - Italy (CNR-IREA)*

Important News ! MODIStsp content migrated to our new website !
---------------------------------------------------------------

-   11/08/2017 - MODIStp 1.3.3 was released today. It provides improvements in processing speed, as well as the usual bug fixes (thanks to all the users that signalled problems !). Check the [Release Notes](https://github.com/lbusett/MODIStsp/releases/tag/v1.3.3) for further details !

-   25/07/2017 - As of today, **most of the content related to MODIStsp has been moved to our new website at [lbusett.github.io/MODIStsp](http://lbusett.github.io/MODIStsp/)**, which provides a much better user interface and ease of access to MODIStsp-related information. From now on, please **consult the new website for detailed and updated information on the package**.

-   Also our previous FAQ page on github containing info for solving common installation, downloading and processing problems and issues was discontinued and **migrated at [lbusett.github.io/MODIStsp/articles/faq.html](http://lbusett.github.io/MODIStsp/articles/faq.html)**.

Problems and Issues
-------------------

-   Please **report any issues** you may encounter in our [issues page on github <i class="fa fa-github-square" aria-hidden="true"></i>](https://github.com/lbusett/MODIStsp/issues).

<i class="fa fa-desktop" aria-hidden="true"></i> System Requirements
--------------------------------------------------------------------

`MODIStsp` requires [R](https://cran.r-project.org) v &gt;= 3.2.1 and [GDAL](http://www.gdal.org) (Geospatial Data Abstraction Library) v &gt;= 1.11.1 **with support for HDF4 raster format** to be installed in your system. Brief instructions for installing R and GDAL can be found [HERE](http://lbusett.github.io/MODIStsp/articles/installation.html#installing-r-and-gdal).

------------------------------------------------------------------------

<i class="fa fa-windows" aria-hidden="true"></i> Installing on Windows
----------------------------------------------------------------------

You can install the stable version of `MODIStsp` from CRAN:

`install.packages("MODIStsp")`

, or the development version (containing the latest improvements and bug fixes) from github:

``` r
library(devtools)
install_github("lbusett/MODIStsp")
```

Note that **if the `GTK+` library is not already installed on your system, installation may fail**. In that case, please install and load the `gWidgetsRGtk2` library beforehand:

``` r
install.packages("gWidgetsRGtk2")
library(gWidgetsRGtk2)
```

Upon loading `gWidgetsRGtk2`, an error window will probably appear. This signals that library "GTK+" is not yet installed on your system or is not on your PATH. To install itpress "OK". A new window dialog window will appear, asking if you want to install "GTK+". Select "Install GTK" and then "OK" . Windows will download and install the GTK+ library. When it finishes, the RSession should be restarted and you should be ready to go !

In case RStudio doesn't automatically restart or continuously asks to install GTK+ again, kill it form "Task Manager" (or restart the R session from RStudio "Session" menu), reload RStudio and the try to reload `gWidgetsRGtk2`. If it loads correctly, you should be ready to go.

If it still fails, try downloading the GTK+ bundle from:

<http://ftp.gnome.org/pub/gnome/binaries/win64/gtk+/2.22/gtk+-bundle_2.22.1-20101229_win64.zip> (OR <http://ftp.gnome.org/pub/gnome/binaries/win32/gtk+/2.22/gtk+-bundle_2.22.1-20101227_win32.zip> if on Win32)

, unzip the archive on a folder of your choice (e.g., `C:\\Program Files\\GTK+`), then add the path to its "bin" subfolder (e.g., `C:\\Program Files\\GTK+\\bin\\` to your system PATH environment variable.

Restart your system and try loading again `gWidgetsRGtk2`: if it loads ok, you should be ready to install `MODIStsp`

<i class="fa fa-linux" aria-hidden="true"></i> Installing on Linux Systems
--------------------------------------------------------------------------

To install `MODIStsp` on Linux, you have to first install the following required dependencies:

-   `Cairo` &gt;= 1.0.0, `ATK` &gt;= 1.10.0, `Pango` &gt;= 1.10.0, `GTK+` &gt;= 2.8.0, `GLib` &gt;= 2.8.0 (required by package `RGtk2`)
-   `Curl` (required by package `curl`)
-   `GDAL` &gt;= 1.6.3, `PROJ.4` &gt;= 4.4.9 (required by package `rgdal`)

On *Debian and Ubuntu-based* systems, to install those packages open a terminal and type:

``` bash
sudo apt-get install r-cran-cairodevice r-cran-rgtk2 libcairo2-dev libatk1.0-dev libpango1.0-dev 
libgtk2.0-dev libglib2.0-dev libcurl4-openssl-dev libgdal-dev libproj-dev
```

On *rpm-base systems*, to install packages open a terminal and type:

``` bash
sudo yum install libcairo2-devel libatk1.0-devel libpango1.0-devel gtk2 gtk2-devel 
glib2-devel libcurl-devel gdal-devel proj proj-devel proj-epsg proj-nad
```

Then, you can install the stable version of MODIStsp from CRAN:

``` r
install.packages("MODIStsp")
```

, or the development version (containing the latest improvements and bug fixes) from github;

``` r
library(devtools)
install_github("lbusett/MODIStsp")
```

<i class="fa fa-apple" aria-hidden="true"></i> Installing on Mac
----------------------------------------------------------------

**NOTE: The following installation notes were kindly provided by a MODIStsp user and should be valid for MODIStsp installation on R 3.4.0 and above with Mac OSX Sierra. Since we are not working on Mac we were not able yet to check this, but we hope it may be useful at least to put you in the right direction if you have installation problems)**

Installing MODIStsp requires many dependencies:

For installation on MAC OSX sierra, there are three main issues: - As outlined here in the comment by **tobybot11** (<https://gist.github.com/sebkopf/9405675>), Rgtk requires the x11 libraries/headers (gdk/gdkx.h specifically) and doesn't work with the quartz libraries/headers which now are the default for GTK - When installing the dependencies gWidgetsRGtk2 and cairoDevice from CRAN you need to choose the version "OS X Mavericks binaries" and not "Package source" - You have to be sure that gdal is installed with HDF4 support.

1 - Update to R &gt; 3.4 if needed, then update all packages

``` r
# update packages
update.packages()
# install the development version of devtools:
install.packages(c("devtools"))
devtools::install_github("hadley/devtools")
```

2 - Now, install RGtk2 using Homebrew (<https://gist.github.com/sebkopf/9405675>). First, ensure you have cairo installed with "--with-x11". Open a terminal and run:

``` bash
brew uninstall cairo --ignore-dependencies
brew install --with-x11 cairo 
```

next, edit the configure options for GTK to require x11 rather than Quartz:

``` bash
brew edit gtk+
```

in the def install section, remove the reference to quartz and switch to:

    --with-gdktarget=x11,
    --enable-x11-backend

Now install:

``` bash
brew install --build-from-source --verbose gtk+ 
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib/pkgconfig/gtk+-2.0.pc:/opt/X11/lib/pkgconfig
```

3 - next, install `RGtk2`. Since install.packages("Rgtk2") is not going to work, go [here](https://cran.r-project.org/package=RGtk2), download RGtk2\_2.20.33.tar.gz and, from a terminal run:

``` bash
R CMD INSTALL RGtk2_2.20.33.tar.gz
```

Now, open R and run:

``` r
library(RGtk2)
```

hopefully, `RGTk2` will load without errors !

4 - Install packages `gWidgetsRGtk2` and `cairoDevice`

**Very important !!!!** from CRAN, download the **"OS X Mavericks binaries"** for [gWidgetsRGtk2](https://cran.r-project.org/package=gWidgetsRGtk2) and [cairoDevice](https://cran.r-project.org/package=cairoDevice)( not "Package source"). Save both to Frameworks/R.framework/3.4..., open R and run the code below (This will also install cairoDevice)

``` r
install.packages("gWidgetsRGtk2", lib="~/Library/Frameworks/R.framework/Versions/3.4/Resources/library/gWidgetsRGtk2")
library(gWidgetsRGtk2)
library(cairoDevice)
```

*(This will work for R version 3.4, mac OS X Sierra)*

5 - Install GDAL with HDF4 support

Check that gdal is installed with hdf4 support. From a terminal:

``` bash
> gdal-config --formats 
```

if gdal is installed, check what drivers are installed: the list should include hdf4.

If gdal is not yet installed or hdf4 is not supproted, install/reinstall it following these [notes](http://r-sig-geo.2731867.n2.nabble.com/OSX-rgdal-GDAL-drivers-and-HDF4-td7588400.html)

``` bash
> brew install hdf4 
# prefer hdf4 links over NetCDF 
> brew link --overwrite hdf4 
> brew install gdal --complete --enable-unsupported --with-hdf4 
# check what drivers are installed, list should now include hdf4: 
> gdal-config --formats 
```

6 - Install rgdal

since rgdal is not usually looking in "/usr/local/lib"" you must include that with `install.packages()`:

``` r
install.packages('rgdal',
                 type = "source",configure.args = c(
                   '--with-proj-include=/usr/local/include',
                   '--with-proj-lib=/usr/local/lib')
                 )
```

7 - Finally, install MODIStsp from CRAN or GitHub:

``` r
install.packages("MODIStsp")
MODIStsp()
```

OR

``` r
library(devtools) 
install_github("lbusett/MODIStsp", ref = "master")
MODIStsp()
```
