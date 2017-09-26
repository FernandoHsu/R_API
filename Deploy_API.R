getwd()
work_dir <- "/Users/cheweihsu/Project/R_API"
setwd(work_dir)

#' Return the air quality (png file)
#' @get /air
function(){
  source(paste0(work_dir,'/','Deploy_API.R'))
  if(airquality[2,5]==1){
    list(air.quality = 'good')
  }else if(airquality[2,5]==2){
    list(air.quality = 'notice')
  }else{
    list(air.quality = 'danger')
  }
}

#' Return the recommanded sport center
#' @param sport.type Filter if the sport.type is provided
#' @param locat.X,locat.Y Filter if the location is provided
#' @get /sport
function(sport.type, locat.X, locat.Y){
  load(paste0(work_dir,'/','data/sport_list.RData'))
  source(paste0(work_dir,'/','filter_df_function.R'))
  
  locat.X <- as.numeric(locat.X)
  locat.Y <- as.numeric(locat.Y)
  if(!missing(sport.type)){
    if(sport.type=='swim'){
      filter_df(locat.X, locat.Y, type = "游泳",sport_list)
    }else if(sport.type=='walk'){
      filter_df(locat.X, locat.Y, type = "步道",sport_list)
    }else if(sport.type=='basketball'){
      filter_df(locat.X, locat.Y, type = "籃球",sport_list)
    }else if(sport.type=='run'){
      filter_df(locat.X, locat.Y, type = "國民中學",sport_list)
    }else if(sport.type=='bike'){
      filter_df(locat.X, locat.Y, type = "自行車",sport_list)
    }else if(sport.type=='baseball'){
      filter_df(locat.X, locat.Y, type = "棒球",sport_list)
    }else if(sport.type=='golf'){
      filter_df(locat.X, locat.Y, type = "高爾夫",sport_list)
    }else if(sport.type=='badminten'){
      filter_df(locat.X, locat.Y, type = "羽球",sport_list)
    }else if(sport.type=='softball'){
      filter_df(locat.X, locat.Y, type = "壘球",sport_list)
    }else{
      filter_df(locat.X, locat.Y, type = "運動中心",sport_list)
    }
  }else{
    list(message='error! you must input sport.type and location')
  }
  
}




