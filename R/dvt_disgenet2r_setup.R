#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)

library(disgenet2r)

# Get API key
disgenet_api_key <- get_disgenet_api_key(
  email = args[1], 
  password = args[2])

# Set environment to use API key
Sys.setenv(DISGENET_API_KEY= disgenet_api_key)
