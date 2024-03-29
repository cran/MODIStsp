% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_files_existance.R
\name{check_files_existence}
\alias{check_files_existence}
\title{Check if all files required for a given date already exist}
\usage{
check_files_existence(
  out_prod_folder,
  file_prefix,
  yy,
  DOY,
  bandnames,
  bandsel_orig_choice,
  indexes_bandnames,
  indexes_bandsel,
  quality_bandnames,
  quality_bandsel,
  out_format
)
}
\arguments{
\item{out_prod_folder}{\code{character} MODIStsp output folder}

\item{file_prefix}{\code{character} File prefix of the processed product
(e.g., MOD13Q1)}

\item{yy}{\code{character} year}

\item{DOY}{\code{character} doy}

\item{bandnames}{\verb{character array} Bandnames of the MODIS product}

\item{bandsel_orig_choice}{\verb{numeric 0/1 array} Indicates which original MODIS
layers were selected for processing (does not contain names of bands needed
to compute SIs but not selected by the user!)}

\item{indexes_bandnames}{\verb{character array} Names of available spectral
indexes (standard + custom) available for the currently processed product}

\item{indexes_bandsel}{\verb{numeric 0/1 array} Indicates which spectral indexes
were selected for processing}

\item{quality_bandnames}{\verb{character array} Name of available Quality
Indicators for the currently processed product}

\item{quality_bandsel}{\verb{numeric 0/1 array} Indicates which Quality Indicators
were selected}

\item{out_format}{\code{character} GTiff or ENVI}
}
\value{
check - logical = 1 if all expected output files are already existing
}
\description{
Accessory function used to see if all expected out files for the
selected date are already present in the output folder. If all expected out
files are already present, check_files is set to TRUE, and the date is
skipped in MODIStsp_process.
}
\note{
License: GPL 3.0
}
\author{
Lorenzo Busetto, phD (2014-2017)

Luigi Ranghetti, phD (2015)
}
