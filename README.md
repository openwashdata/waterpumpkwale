
<!-- README.md is generated from README.Rmd. Please edit that file -->

# waterpumpkwale

<!-- badges: start -->

[![License: CC BY
4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

<!-- badges: end -->

The goal of `waterpumpkwale` is to provide datasets for monitoring
weekly volume of hand pumps in Kwale, Kenya. This package contains
valuable information of geo-locations of hand pumps in Kwale as well as
monitoring data recorded in year 2014 and 2015. The data is collected
part of the project [UPGro](https://upgro.org) (Unlocking the Potential
of Groundwater for the Poor) which aimed to improve the evidence and
understanding of groundwater across Sub-Saharan Africa to help tackle
poverty.

## Installation

You can install the development version of waterpumpkwale from
[GitHub](https://github.com/waterpumpkwale) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/waterpumpkwale")
```

Alternatively, you can download the individual datasets as CSV or XLSX
file from the table below.

| dataset       | CSV                                                                                                    | XLSX                                                                                                     |
|---------------|--------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| location      | [Download CSV](https://github.com/openwashdata/waterpumpkwale/raw/main/inst/extdata/location.csv)      | [Download XLSX](https://github.com/openwashdata/waterpumpkwale/raw/main/inst/extdata/location.xlsx)      |
| weeklyvol2014 | [Download CSV](https://github.com/openwashdata/waterpumpkwale/raw/main/inst/extdata/weeklyvol2014.csv) | [Download XLSX](https://github.com/openwashdata/waterpumpkwale/raw/main/inst/extdata/weeklyvol2014.xlsx) |
| weeklyvol2015 | [Download CSV](https://github.com/openwashdata/waterpumpkwale/raw/main/inst/extdata/weeklyvol2015.csv) | [Download XLSX](https://github.com/openwashdata/waterpumpkwale/raw/main/inst/extdata/weeklyvol2015.xlsx) |

# Introduction

This dataset contains a summary of the weekly volumetric output of pumps
monitored using Smart Handpump sensors for 2014 and 2015.[^1][^2]

Notes:

1.  The accuracy of these volume figures should be considered to be +/-
    20%.
2.  The dataset has gaps due to variable signal, and some attrition due
    to damage and vandalism.
3.  Not all pumps in the study area were under monitoring.

### References

\[1\] P. Thomson, R. Hope, and T. Foster, “GSM-enabled remote monitoring
of rural handpumps: a proof-of-concept study,” Journal of
Hydroinformatics, vol. 14, no. 4, pp. 829–839, 05 2012. \[Online\].
Available: <https://doi.org/10.2166/hydro.2012.183>

\[2\] Behar, J., Guazzi, A., Jorge, J., Laranjeira, S., Maraci, M.A.,
Papastylianou, T., Thomson, P., Clifford, G.D. and Hope, R.A., 2013.
Software architecture to monitor handpump performance in rural Kenya. In
Proceedings of the 12th International Conference on Social Implications
of Computers in Developing Countries, Ochos Rios, Jamaica. pp. 978 (Vol.
991).

## Data

The package provides access to three datasets `location`,
`weeklyvol2014`, and `weeklyvol2015`.

``` r
library(waterpumpkwale)
```

    The `waterpumpkwale` data set has {ncol(waterpumpkwale)} variables and {nrow(waterpumpkwale)} observations. For an overview of the variable names, see the following table.  

``` r
waterpumpkwale
```

    #> Rows: 10 Columns: 5
    #> ── Column specification ────────────────────────────────────────────────────────
    #> Delimiter: ","
    #> chr (5): directory, file_name, variable_name, variable_type, description
    #> 
    #> ℹ Use `spec()` to retrieve the full column specification for this data.
    #> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

| variable_name | variable_type | description                             |
|:--------------|:--------------|:----------------------------------------|
| pumpid        | character     | ID number of the water pump             |
| description   | character     | Name of the pump location               |
| x_arc1960     | double        | Longitude in Arc 1960 coordinate system |
| y_rc1960      | double        | Latitude in Arc 1960 coordinate system  |
| lat_wgs84     | double        | Latitude in WGS 84 coordinate system    |
| long_wgs84    | double        | Longitude in WGS 84 coordinate system   |

## Example

``` r
library(leaflet)
# customize marker icon 
handpumpicon <- makeIcon(
  iconUrl = "https://cdn-icons-png.flaticon.com/512/5984/5984318.png",
  iconWidth = 30, iconHeight = 30
)


leaflet(options = leafletOptions(crs = leafletCRS(proj4def = "WGS84"))) |>
  addProviderTiles("OpenStreetMap") |>
  addMarkers(
    data = location,
    lng = ~`long_wgs84`,
    lat = ~`lat_wgs84`,
    popup = ~pumpid,
    label = ~`description`,
    icon = handpumpicon
  ) 
  
```

## License

Data are available as
[CC-BY](https://github.com/openwashdata/waterpumpkwale/blob/main/LICENSE.md).

## Citation

``` r
citation()
#> To cite R in publications use:
#> 
#>   R Core Team (2023). _R: A Language and Environment for Statistical
#>   Computing_. R Foundation for Statistical Computing, Vienna, Austria.
#>   <https://www.R-project.org/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {R: A Language and Environment for Statistical Computing},
#>     author = {{R Core Team}},
#>     organization = {R Foundation for Statistical Computing},
#>     address = {Vienna, Austria},
#>     year = {2023},
#>     url = {https://www.R-project.org/},
#>   }
#> 
#> We have invested a lot of time and effort in creating R, please cite it
#> when using it for data analysis. See also 'citation("pkgname")' for
#> citing R packages.
```

[^1]: Grants that permitted the data collection include: Groundwater
    Risk Management for Growth and Development project (NE/M008894/1)
    funded by NERC/ESRC/DFID’s UPGro programme; New mobile citizens and
    waterpoint sustainability in rural Africa (ES/J018120/1) ESRC-DFID;
    Groundwater Risks and Institutional Responses for Poverty Reduction
    in Rural Africa (NE/L001950/1) funded by NERC/ESRC/DFID’s UPGro
    programme.

[^2]: More information of the data sources:
    <https://webapps.bgs.ac.uk/services/ngdc/accessions/index.html?simpleText=upgro>
