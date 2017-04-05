
# https://www.r-bloggers.com/shapefiles-in-r/


# load up area shape file:
library(maptools)
area <- readShapePoly("ne_10m_parks_and_protected_lands_area.shp")

# # or file.choose:
# area <- readShapePoly(file.choose())

library(RColorBrewer)
colors <- brewer.pal(9, "BuGn")

library(ggmap)
mapImage <- get_map(location = c(lon = -118, lat = 37.5),
  color = "color",
  source = "osm",
  # maptype = "terrain",
  zoom = 6)
area.points <- fortify(area)
ggmap(mapImage) +
  geom_polygon(aes(x = long,
      y = lat,
      group = group),
    data = area.points,
    color = colors[9],
    fill = colors[6],
    alpha = 0.5) +
labs(x = "Longitude",
  y = "Latitude")
