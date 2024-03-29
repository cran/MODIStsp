### Test 2: test of geometric routines.                                 ####
#   The test works on the same local product of test 1, performing geometric
#   operations (clipping on the extent of Avalon peninsula and resampling
#   resolution to 1000m). Output files are in ENVI format.

test_that(
  "Tests on MODIStsp", {
    skip_on_cran()
    # skip_on_travis()
    skip_if(!"HDF4" %in% sf::st_drivers("raster")$name)
    
    suppressWarnings(MODIStsp(test = 2)) # FIXME manage the returned warning:
    # "GDAL Message 1: All options related to creation ignored in update mode"
    message("MODIStsp Test 2: Processing works when changing projection and
            resolution")
    out_files_dat  <- list.files(
      file.path(tempdir(), "MODIStsp/Surf_Temp_8Days_GridSin_v61"),
      pattern = "[0-9]{3}\\.dat$", recursive = TRUE, full.names = TRUE)

    # same checks as before on file size and raster stats
    file_sizes_dat <- file.info(out_files_dat)$size
    expect_equal(file_sizes_dat, c(52000, 26000))
    means <- unlist(
      lapply(out_files_dat,
             FUN = function(x) {
               mean(raster::getValues(raster::raster(x)), na.rm = T)
             })
    )
    expect_equal(means, c(13420.67, 1.72),
                 tolerance = 0.01, scale = 1)

    # additional checks on output projection and resolution
    message("MODIStsp Test 2: Output projection and resolution are properly
            set")
    r <- raster::raster(out_files_dat[1])
    # expect_true(grepl(
    #   "+proj=utm +zone=22 +datum=WGS84 +units=m +no_defs", #nolint,
    #   sf::st_crs(r)$input,
    #   fixed=TRUE
    # ))
    expect_equal(raster::res(r), c(1000, 1000))
    unlink(out_files_dat)
  })
