getwd()
work_dir <- "/Users/cheweihsu/Project/R_API"
setwd(work_dir)

### API Control ####
# https://github.com/Microsoft/AzureSMR
# use the above package to control azure



### Deploy the API ####
if(!require(plumber)){
  install.packages('plumber')
}else{
  library(plumber)
}

r <- plumb(paste0(work_dir,'/','Deploy_API.R'))
r
#r$run(port=8000) 
r$run(host = "40.71.188.11", port = 80)

# http://localhost:8000/air
# http://localhost:8000/sport?sport.type=swim&locat.X=120&locat.Y=25

### Microsoft R server ####
### stackover flow solution
#https://stackoverflow.com/questions/43366098/hosting-or-deploy-r-rest-apis
### Overview the whole solution
#https://blogs.msdn.microsoft.com/mlserver/2017/05/11/1885/
### Guide to R server and {mrsdeploy} package
#https://docs.microsoft.com/zh-tw/machine-learning-server/operationalize/concept-operationalize-deploy-consume
### Install R clinet on windows
#https://docs.microsoft.com/zh-tw/machine-learning-server/r-client/install-on-windows
### Install R server on windows
#https://docs.microsoft.com/zh-tw/machine-learning-server/install/r-server-install-windows
### Publish R web service
#https://docs.microsoft.com/zh-tw/machine-learning-server/operationalize/quickstart-publish-r-web-service
### create REST API
#https://blogs.msdn.microsoft.com/mlserver/2017/02/24/rest-calls-using-postman-for-r-server-o16n/
