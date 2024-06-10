rm(list = ls())

devtools::install_github('atorus-research/dataset-json-hackathon')

library(xportrjson)
library(this.path)
library(tidyverse)

homeDir <- dirname(this.path())
setwd(homeDir)

JSONdatasets <- list.files(pattern = 'json')

for (dataset in JSONdatasets) {
  if (dataset %in% c('ex.json', 'lb.json', 'pc.json')) {next}
  Data <- xportrjson::read_dataset_json(dataset)
  print(dataset)
  print(head(Data))
}
