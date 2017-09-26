require(tidyverse)
require(magrittr)

getwd()
setwd('/Users/cheweihsu/Project')
airquality <- read.csv('http://data.ntpc.gov.tw/od/data/api/919CD829-18C4-434C-82DF-958C54CB0CE8?$format=csv')
airquality <- airquality[airquality$chName %in% c('PM10','PM2.5'),]
airquality %<>% mutate(standard = c(125, 35),
                       level = ifelse(unit < standard,1,
                                      ifelse(unit < standard*1.2,2,3))) 
airquality <- airquality[,names(airquality) %in% c('chName','value','unit','standard','level')]
