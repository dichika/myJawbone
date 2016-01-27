#' @export
getSleepdata <- function(token){
  u <- sprintf("https://jawbone.com/nudge/api/v.1.1/users/@me/sleeps")
  res <- httr::GET(url = u,
                   httr::config(token = token))
  dat <- jsonlite::fromJSON(httr::content(res, as = "text"))
  result <- dat$data$items
  return(result)
}

#' @export
getSleepTickdata <- function(date, token){
  data_all <- getSleepdata(token)
  data_all$date <- as.Date(as.character(data_all$date), format="%Y%m%d")
  trg_id <- subset(data_all, date==date)
  u <- sprintf("https://jawbone.com/nudge/api/v.1.1/sleeps/%s/ticks", trg_id$xid)
  res <- httr::GET(url = u,
                   httr::config(token = token))
  dat <- jsonlite::fromJSON(httr::content(res, as = "text"))
  result <- dat$data$items
  result$time <- as.POSIXct(result$time, origin="1970-01-01")
  return(result)
}
