# note: using URL encoding 
filter_df <- function(locat.X = 25.76,locat.Y = 121.03,type = "國民小學",sport_list){
  df <- sport_list[[type]] 
  locat.X <- rep(locat.X, time=length(df['wgs84aX']))
  locat.Y <- rep(locat.X, time=length(df['wgs84aY']))
  dist <- sqrt((locat.X - df['wgs84aX'])^2 + (locat.Y - df['wgs84aY'])^2 )
  colnames(dist) <- 'distance'
  df['distance'] <- dist
  df <- df[order(df['distance']),] 
  return(list(name = URLencode(df[1,'G_title']),
              intro = URLencode(df[1,'G_Intro']),
              X = df[1,'wgs84aX'],
              Y = df[1,'wgs84aY']))
}

