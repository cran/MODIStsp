## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE-------------
#  library(devtools)
#  install_github("lbusett/MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE-------------
#  install.packages("gWidgetsRGtk2")
#  library(gWidgetsRGtk2)

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE-------------
#  install.packages("MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE-------------
#  library(devtools)
#  install_github("lbusett/MODIStsp")

## ----eval = FALSE--------------------------------------------------------
#  library(RGtk2)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("MODIStsp")
#  MODIStsp()

## ----eval = FALSE--------------------------------------------------------
#  library(devtools)
#  install_github("lbusett/MODIStsp", ref = "master")
#  MODIStsp()

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE, caption=FALSE----
#  library(MODIStsp)
#  MODIStsp()

## ----GUIfig, echo=FALSE, fig.align="center", fig.heigth=7.5, message=FALSE, warning=FALSE----
  library(png)
  library(grid)
  library(knitr)
  img <- readPNG("MAIN_GUI.png")
  grid.raster(img)

## ----proc_layers, echo=FALSE, fig.align="center", message=FALSE, warning=FALSE, paged.print=FALSE----
  library(png)
  library(grid)
  img <- readPNG('SELECT_GUI.png')
  grid.raster(img)

## ----indexfig, echo=FALSE, fig.height=2.3, fig.width=6, message=FALSE, warning=FALSE, fig.align="center"----
  library(png)
  library(grid)
  img <- readPNG('NEWIND_GUI.png')
  grid.raster(img)

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  library(MODIStsp)
#  
#  # **NOTE** Output files of examples are saved to file.path(tempdir(), "MODIStsp").
#  # You can run the examples with `gui = TRUE` to set a different output folder!
#  
#  # --> Specify the path to a valid options file saved in advance from MODIStsp GUI
#  # Here we use a test json file saved in MODIStsp installation folder which
#  # downloads and processed 3 MOD13A2 images over the Como Lake (Lombardy, Italy)
#  # and retrieves NDVI and EVI data, plus the Usefulness Index Quality Indicator.
#  
#  options_file <- system.file("testdata/test_MOD13A2.json", package = "MODIStsp")
#  
#  # --> Launch the processing
#  MODIStsp(gui = FALSE, options_file = options_file, verbose = FALSE)
#  
#  # Outputs are in this case in subfolder "MODIStsp/VI_16Days_1Km_v6" of `base::tempdir()`:
#  
#  out_fold <- file.path(tempdir(), "MODIStsp/VI_16Days_1Km_v6")
#  list.files(out_fold)
#  #> [1] "EVI"         "NDVI"        "QA_usef"     "Time_Series"
#  
#  list.files(file.path(out_fold ,"EVI"))
#  #> [1] "MOD13A2_EVI_2016_161.tif" "MOD13A2_EVI_2016_177.tif"

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  
#  opts_files <- c(system.file("testdata/test_MOD13A2.json", package = "MODIStsp"),
#                  system.file("testdata/test_MOD10A2.json", package = "MODIStsp"))
#  
#  for (opts_file in opts_files) {
#    MODIStsp(gui = FALSE, options_file = opts_file)
#  }
#  
#  # MOD13A2 ouputs
#  out_fold <- file.path(tempdir(), "MODIStsp/VI_16Days_1Km_v6")
#  list.files(out_fold)
#  #> [1] "EVI"         "NDVI"        "QA_usef"     "Time_Series"
#  list.files(file.path(out_fold ,"EVI"))
#  #> [1] "MOD13A2_EVI_2016_161.tif" "MOD13A2_EVI_2016_177.tif"
#  
#  # MOD10A2 ouputs
#  out_fold <- file.path(tempdir(), "MODIStsp/Surf_Temp_8Days_1Km_v6")
#  list.files(out_fold)
#  #> [1] "Days_Clear"    "LST_Day_1km"   "LST_Night_1km" "Time_Series"
#  
#  list.files(file.path(out_fold ,"LST_Night_1km"))
#  #> [1] "MOD11A2_LST_Night_1km_2016_153.tif" "MOD11A2_LST_Night_1km_2016_161.tif"
#  #> [3] "MOD11A2_LST_Night_1km_2016_169.tif" "MOD11A2_LST_Night_1km_2016_177.tif"

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  
#  # Run the tool using the settings previously saved in a specific option file
#  # and specifying the extent from a spatial file allows to re-use the same
#  # processing settings to perform download and reprocessing on a different area
#  library(MODIStsp)
#  options_file <- system.file("testdata/test_MOD13A2.json", package = "MODIStsp")
#  spatial_file <- system.file("testdata/lakeshapes/garda_lake.shp", package = "MODIStsp")
#  MODIStsp(gui = FALSE, options_file = options_file,
#           spatial_file_path = spatial_file, verbose = FALSE)
#  
#  # --> Create a character array containing a list of shapefiles (or other spatial files)
#  extent_list = list.files(system.file("testdata/lakeshapes/", package = "MODIStsp"),
#                           full.names = TRUE, "\\.shp$")
#  extent_list
#  
#  #> [1] "D:/Documents/Source/git/MODIStsp/inst/testdata/lakeshapes/garda_lake.shp"
#  #> [2] "D:/Documents/Source/git/MODIStsp/inst/testdata/lakeshapes/iseo_lake.shp"
#  
#  # --> Loop on the list of spatial files and run MODIStsp using each of them to
#  # automatically define the output extent (A separate output folder is created for
#  # each input spatial file).
#  
#  for (single_shape in extent_list) {
#    MODIStsp(gui = FALSE, options_file = options_file,
#             spatial_file_path = single_shape )
#  }
#  
#  # output files are placed in separate folders. For example here you can see how to
#  # access a list of produced files and plot one of them:
#  outfiles_garda <- list.files(
#    file.path(tempdir(), "MODIStsp/garda_lake/VI_16Days_1Km_v6/EVI"),
#    full.names = TRUE)
#  library(raster)
#  plot(raster(outfiles_garda[1]))
#  
#  outfiles_iseo <- list.files(
#    file.path(tempdir(), "MODIStsp/iseo_lake/VI_16Days_1Km_v6/EVI"),
#    full.names = TRUE)
#  plot(raster(outfiles_iseo[1]))
#  

## ----eval=FALSE, tidy=TRUE, highlight=TRUE-------------------------------
#  library(raster)
#  modistsp_file <- "/my_outfolder/EVI/MOD13Q1_2005_137_EVI.tif"
#  my_raster     <- raster(modistsp_file)

## ----eval=FALSE----------------------------------------------------------
#  in_virtual_file <- "/my_outfolder/Time_Series/RData/Terra/EVI/MOD13Q1_MYD13Q1_NDVI_49_2000_353_2015_RData.RData"
#  indata          <- get(load(in_virtual_file))

## ---- eval=FALSE---------------------------------------------------------
#    #Set the input paths to raster and shape file
#    infile    <- 'myoutfolder/Time_Series/RData/Mixed/MOD13Q1_MYD13Q1_NDVI_49_2000_353_2015_RData.RData'
#    shpname   <- 'path_to_file/rois.shp'
#    #Set the start/end dates for extraction
#    startdate <- as.Date("2010-01-01")
#    enddate   <- as.Date("2014-12-31")
#    #Load the RasterStack
#    inrts     <- get(load(infile))
#    # Compute average and St.dev
#    dataavg   <- MODIStsp_extract(inrts, shpname, startdate, enddate, FUN = 'mean', na.rm = T)
#    datasd    <- MODIStsp_extract (inrts, shpname, startdate, enddate, FUN = 'sd', na.rm = T)
#    # Plot average time series for the polygons
#    plot.xts(dataavg)

