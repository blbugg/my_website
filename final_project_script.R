aus_df <- vroom("australian_shark_incident_database_public.csv")

aus_df1 <- aus_df %>% clean_names()

aus_df2 = select(aus_df1, -shark_identification_method, -uin, -site_category,
                 -site_category_comment, -shark_identification_method, 
                 -shark_identification_source, -shark_length_m, -basis_for_length,
                 -provocative_act, -no_sharks, -fish_speared,
                 -commercial_dive_activity,
                 -object_of_bite, -present_at_time_of_bite,
                 -direction_first_strike, -shark_behaviour, 
                 -victim_aware_of_shark, -shark_captured, -injury_location,
                 -injury_severity, -victim_gender, -victim_age, -victim_clothing,
                 -clothing_coverage, -dominant_clothing_colour,
                 -other_clothing_colour, -clothing_pattern, -fin_colour,
                 -diversionary_action_taken, -diversionary_action_outcome,
                 -people_3m, -people_3_15m, -depth_of_incident_m, -teeth_recovered,
                 -time_in_water_min, -water_temperature_c, -total_water_depth_m,
                 -water_visability_m, -distance_to_shore_m)

aus_df2 <- filter(aus_df2,latitude!=0)
leaflet(data = aus_df2) %>%
  addTiles() %>%
  addMarkers(lat=aus_df2$latitude, lng=aus_df2$longitude, clusterOptions =
               markerClusterOptions(),
             popup= paste("<strong>Date: </strong>", aus_df2$incident_year,"/",
                          aus_df2$incident_month,
                          "<br><br><strong>Place: </strong>",
                          aus_df2$location,"-",aus_df2$state,
                          "<br><strong>Latitude: </strong>", aus_df2$latitude,
                          "<br><strong>Longitude: </strong>",aus_df2$longitude,
                          "<br><strong>Species: </strong>",
                          aus_df$shark_common_name))