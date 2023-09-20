
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

## Introduction

This dataset contains a summary of the weekly volumetric output of pumps
monitored using Smart Handpump sensors for 2014 and 2015 in Kwale,
Kenya.[^1][^2]

Notes:

1.  The accuracy of these volume figures should be considered to be +/-
    20%.
2.  The dataset has gaps due to variable signal, and some attrition due
    to damage and vandalism.
3.  Not all pumps in the study area were under monitoring.

## Data

The package provides access to three datasets `location`,
`weeklyvol2014`, and `weeklyvol2015`.

``` r
library(waterpumpkwale)
```

### `location` data

The `location` data set has 6 variables and 299 observations. They
record 299 hand pumps location information. For an overview of the
variable names, see the following table.

| variable_name | variable_type | description                             |
|:--------------|:--------------|:----------------------------------------|
| pumpid        | character     | ID number of the water pump             |
| description   | character     | Name of the pump location               |
| x_arc1960     | double        | Longitude in Arc 1960 coordinate system |
| y_rc1960      | double        | Latitude in Arc 1960 coordinate system  |
| lat_wgs84     | double        | Latitude in WGS 84 coordinate system    |
| long_wgs84    | double        | Longitude in WGS 84 coordinate system   |

### `weeklyvol2014` and `weeklyvol2015` data

The `weeklyvol2014` data set has 53 variables and 324 observations. The
`weeklyvol2015` data set has 53 variables and 297 observations.

These two datasets follow the same structure and we here use
`weeklyvol2014` as an illustration. For an overview of the variable
names, see the following table.

| variable_name | variable_type | description                                          |
|:--------------|:--------------|:-----------------------------------------------------|
| pumpid        | character     | ID number of the water pump                          |
| n             | double        | Each column indicates the week number 1, 2, 3, …, 52 |

## Example

We can have a look where the hand pumps locate in Kwale using the
dataset `location`. For more data exploration, you may check out [a
detailed example here]().

``` r
library(leaflet)
# customize marker icon 
handpumpicon <- makeIcon(
  iconUrl = "https://cdn-icons-png.flaticon.com/512/5984/5984318.png",
  iconWidth = 30, iconHeight = 30
)

# Display an interactive map
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

<figure>
<img src="man/figures/README-location.png"
alt="Screenshot of hand pump location map" />
<figcaption aria-hidden="true">Screenshot of hand pump location
map</figcaption>
</figure>

## License

Data are available as
[CC-BY](https://github.com/openwashdata/waterpumpkwale/blob/main/LICENSE.md).

## Citation

If you use the data or the package, consider to cite this package with
the following information to give credits for authors of the dataset!

``` r
citation("waterpumpkwale")
#> Warning in citation("waterpumpkwale"): could not determine year for
#> 'waterpumpkwale' from package DESCRIPTION file
#> To cite package 'waterpumpkwale' in publications use:
#> 
#>   Thomson P, Hope R, Foster T, Zhong M (????). _waterpumpkwale: Weekly
#>   volume of water pumped for handpumps monitored with Smart Handpump
#>   technology, Kwale County, Kenya_. R package version 0.0.0.9000.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {waterpumpkwale: Weekly volume of water pumped for handpumps monitored with Smart Handpump technology, Kwale County, Kenya},
#>     author = {Patrick Thomson and Rob Hope and Tim Foster and Mian Zhong},
#>     note = {R package version 0.0.0.9000},
#>   }
```

### Related References

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

[^1]: Grants that permitted the data collection include: Groundwater
    Risk Management for Growth and Development project (NE/M008894/1)
    funded by NERC/ESRC/DFID’s UPGro programme; New mobile citizens and
    waterpoint sustainability in rural Africa (ES/J018120/1) ESRC-DFID;
    Groundwater Risks and Institutional Responses for Poverty Reduction
    in Rural Africa (NE/L001950/1) funded by NERC/ESRC/DFID’s UPGro
    programme.

[^2]: More information of the data sources:
    <https://metadata.bgs.ac.uk/geonetwork/srv/eng/catalog.search#/metadata/9ed6c5d2-124b-50ed-e054-002128a47908>,
    <https://webapps.bgs.ac.uk/services/ngdc/accessions/index.html?simpleText=upgro>
