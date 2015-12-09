# Will not show leaflet map in "Viewer" tab of RStudio if script is "sourced".

library(leaflet)

ipinfo.csv <- "data/www_cubagob_cu/ipinfo.csv"

if (file.exists(ipinfo.csv) == TRUE) {
  ipinfo <- read.csv(ipinfo.csv, stringsAsFactors=FALSE)
  
  leaflet() %>% addTiles() %>% 
    addPolylines(ipinfo$longitude, ipinfo$latitude) %>%
    addCircleMarkers(ipinfo$longitude, ipinfo$latitude, 
                     color = '#ff0000', popup=paste(ipinfo$city, 
                                                    ipinfo$region_code,
                                                    ipinfo$country_code))
}