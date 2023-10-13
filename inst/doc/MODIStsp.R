## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE------------------
#  install.packages("remotes")
#  library(remotes)
#  install_github("ropensci/MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE------------------
#  install.packages("MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE------------------
#  library(devtools)
#  install_github("ropensci/MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE------------------
#  install.packages("MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE------------------
#  library(devtools)
#  install_github("ropensci/MODIStsp")

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE, caption=FALSE----
#  library(MODIStsp)
#  MODIStsp()

## ----GUIfig, echo=FALSE, fig.align="center", fig.width=10, message=FALSE, warning=FALSE----
  library(png)
  library(grid)
  library(knitr)
  img <- readPNG("GUI_1.PNG")
  grid.raster(img)

## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE----------------------
#  library(MODIStsp)
#  MODIStsp_get_prodlayers("M*D13Q1")

## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE----------------------
#  library(MODIStsp)
#  
#  # **NOTE** Output files of examples are saved to file.path by setting out_folder to $tempdir.
#  
#  # --> See name and available layers for product M*D13Q1
#  # MODIStsp_get_prodlayers("M*D13A2")
#  
#  # --> Launch the processing
#  MODIStsp(
#    gui             = FALSE,
#    out_folder      = "$tempdir",
#    selprod         = "Vegetation_Indexes_16Days_1Km (M*D13A2)",
#    bandsel         = c("EVI", "NDVI"),
#    quality_bandsel = "QA_usef",
#    indexes_bandsel = "SR",
#    user            = "mstp_test" ,
#    password        = "MSTP_test_01",
#    start_date      = "2020.06.01",
#    end_date        = "2020.06.15",
#    verbose         = FALSE,
#    parallel        = FALSE
#  )
#  
#  # Outputs are in this case in subfolder "MODIStsp/VI_16Days_1Km_v61" of
#  # `base::tempdir()`:
#  
#  out_fold <- file.path(tempdir(), "MODIStsp/VI_16Days_1Km_v61/")
#  list.files(out_fold)
#  list.files(file.path(out_fold ,"EVI"))
#  list.files(file.path(out_fold ,"QA_usef"))

## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE----------------------
#  library(MODIStsp)
#  
#  # **NOTE** Output files of examples are saved to file.path(tempdir(), "MODIStsp").
#  
#  # --> Specify the path to a valid options file saved in advance from MODIStsp GUI
#  # Here we use a test json file saved in MODIStsp installation folder which
#  # downloads and processed 3 MOD13A2 images over the Como Lake (Lombardy, Italy)
#  # and retrieves NDVI and EVI data, plus the Usefulness Index Quality Indicator.
#  
#  opts_file <- system.file("testdata/test_MOD13A2.json", package = "MODIStsp")
#  
#  # --> Launch the processing
#  MODIStsp(gui = FALSE, opts_file = opts_file, verbose = FALSE, parallel = FALSE)
#  
#  # Outputs are in this case in subfolder "MODIStsp/VI_16Days_1Km_v61" of
#  # tempdir():
#  
#  out_fold <- file.path(tempdir(), "MODIStsp/VI_16Days_1Km_v61")
#  list.files(out_fold)
#  list.files(file.path(out_fold ,"EVI"))

## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE----------------------
#  
#  opts_files <- c(system.file("testdata/test_MOD13A2.json", package = "MODIStsp"),
#                  system.file("testdata/test_MOD10A2.json", package = "MODIStsp"))
#  
#  for (opts_file in opts_files) {
#    MODIStsp(gui = FALSE, opts_file = opts_file, verbose = FALSE, parallel = FALSE)
#  }
#  
#  # MOD13A2 ouptuts
#  out_fold <- file.path(tempdir(), "MODIStsp/VI_16Days_1Km_v61")
#  list.files(out_fold)
#  list.files(file.path(out_fold ,"NDVI"))
#  
#  # MOD10A2 ouptuts
#  out_fold <- file.path(tempdir(), "MODIStsp/Surf_Temp_8Days_1Km_v61")
#  list.files(out_fold)
#  list.files(file.path(out_fold ,"LST_Night_1km"))

## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE----------------------
#  # Run the tool using the settings previously saved in a specific option file
#  # and specifying the extent from a spatial file allows to re-use the same
#  # processing settings to perform download and reprocessing on a different area
#  library(MODIStsp)
#  opts_file    <- system.file("testdata/test_MOD13A2.json", package = "MODIStsp")
#  spatial_file <- system.file("testdata/lakeshapes/garda_lake.shp", package = "MODIStsp")
#  MODIStsp(
#    gui = FALSE,
#    opts_file = opts_file,
#    spatmeth = "file",
#    spafile = spatial_file,
#    verbose = FALSE,
#    parallel = FALSE
#  )
#  
#  # --> Create a character array containing a list of shapefiles (or other spatial files)
#  extent_list <- list.files(system.file("testdata/lakeshapes/", package = "MODIStsp"), full.names = TRUE, "\\.shp$")
#  
#  extent_list
#  
#  # --> Loop on the list of spatial files and run MODIStsp using each of them to
#  # automatically define the output extent (A separate output folder is created for
#  # each input spatial file).
#  
#  for (single_shape in extent_list) {
#    MODIStsp(
#      gui = FALSE,
#      opts_file = opts_file,
#      spatmeth = "file",
#      spafile = single_shape,
#      verbose = FALSE,
#      parallel = FALSE
#    )
#  }
#  
#  # output files are placed in separate folders:
#  
#  outfiles_garda <- list.files(
#    file.path(tempdir(), "MODIStsp/garda_lake/VI_16Days_1Km_v61/EVI"),
#    full.names = TRUE)
#  outfiles_garda
#  
#  library(raster)
#  plot(raster(outfiles_garda[1]))
#  
#  outfiles_iseo <- list.files(
#    file.path(tempdir(), "MODIStsp/iseo_lake/VI_16Days_1Km_v61/EVI"),
#    full.names = TRUE)
#  outfiles_iseo
#  
#  plot(raster(outfiles_iseo[1]))
#  

## ----eval=FALSE, tidy=TRUE, highlight=TRUE------------------------------------
#  library(raster)
#  modistsp_file <- "/my_outfolder/EVI/MOD13Q1_2005_137_EVI.tif"
#  my_raster     <- raster(modistsp_file)

## ----eval=FALSE---------------------------------------------------------------
#  in_virtual_file <- "/my_outfolder/Time_Series/RData/Terra/EVI/MOD13Q1_MYD13Q1_NDVI_49_2000_353_2015_RData.RData"
#  indata          <- get(load(in_virtual_file))

## ---- eval=FALSE--------------------------------------------------------------
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

