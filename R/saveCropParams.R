#'==============================================================================
#'                    saveCropParams: save crop parameters
#'==============================================================================
#'
#' This script aims to create a database of crop parameters of the SOLANUM 
#' model for different potato varieties.
#' 
#'==============================================================================


#-------------------------------------------------------------------------------
# Description of the crop parameters
#-------------------------------------------------------------------------------
CropParamsInfo <- c("wmax : Maximum canopy cover index (fraction)",
                    "tm   : Thermal time at the maximum canopy cover growth rate (C-day)",
                    "te   : Thermal time at the maximum canopy cover value (C-day)",
                    "A    : Maximum harvest index (fraction)",
                    "tu   : Thermal time at maximum tuber partition rate (C-day)",
                    "b    : Thermal time just before the tuber initiation process (C-day)",
                    "RUE  : Average radiation use efficiency (g/MJ)",
                    "DMc  : Dry matter concentration of tubers (fraction)")

CropParamsSymb <- c("wmax", "tm", "te", "A", "tu", "b", "RUE", "DMc")


#-------------------------------------------------------------------------------
# List of crop parameters for different varieties
#-------------------------------------------------------------------------------
CropParamsList <- list(
#                 wmax      tm      te      A      tu       b    RUE    DMc
  "AMA" =       c(0.98,  381.0,  704.3,  1.00,  391.7,  296.9,  1.20,  0.17),
  "BRE" =       c(0.95,  254.6,  658.8,  0.86,  550.7,  223.1,  1.11,  0.24),
  "HUE" =       c(0.80,  295.1,  633.9,  1.00,  523.2,  235.3,  1.28,  0.24),
  "POD" =       c(1.00,  287.7,  637.3,  0.85,  620.8,  159.3,  1.69,  0.23),
  "YUN" =       c(0.89,  191.7,  548.9,  1.07,  512.6,  266.1,  1.82,  0.18)
)

#CODE    te    tm wmax     b    tu    A  RUE  DMC
# AMA 704.3 381.0 0.98 296.9 391.7 1.00 1.20 0.17
# BRE 658.8 254.6 0.95 223.1 550.7 0.86 1.11 0.24
# HUE 633.9 295.1 0.80 235.3 523.2 1.00 1.28 0.24
# POD 637.3 287.7 1.00 159.3 620.8 0.85 1.69 0.23
# YUN 548.9 191.7 0.89 266.1 512.6 1.07 1.82 0.18

#CropParamsList <- list(
#  #                 wmax      tm      te      A      tu       b    RUE    DMc
#  "AMA" =       c(0.96,  481.2,  973.2,  0.90,  547.6,  273.2,  1.20,  0.17),
#  "BRE" =       c(0.95,  314.7,  946.8,  0.76,  700.8,  256.7,  1.11,  0.24),
#  "HUE" =       c(0.79,  371.6,  904.9,  0.89,  662.6,  269.7,  1.28,  0.24),
#  "POD" =       c(1.00,  350.1,  895.1,  0.80,  816.4,  204.0,  1.69,  0.23),
#  "YUN" =       c(0.88,  222.4,  784.0,  0.90,  628.1,  294.6,  1.82,  0.18)
#)


#-------------------------------------------------------------------------------
# Metadata of crop parameters for each variety
#-------------------------------------------------------------------------------
n = length(CropParamsList)

for(i in 1:n){
  names(CropParamsList[[i]]) = CropParamsSymb
  attr(CropParamsList[[i]], "VarietyName") = names(CropParamsList)[i]
  attr(CropParamsList[[i]], "CropParamsInfo") = CropParamsInfo
}

save(CropParamsList, file = "CropParamsList.Rdata")





