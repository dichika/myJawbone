#' @export
getToken <- function(key=NULL, secret=NULL){
  endpoint <- httr::oauth_endpoint("token", "auth", "token",
                                  base_url = "https://jawbone.com/auth/oauth2")
  if(all(is.null(key), is.null(secret))){
    myapp <- httr::oauth_app("myapp",
                             Sys.getenv("JAWBONE_API_KEY"),
                             Sys.getenv("JAWBONE_CONSUMER_SECRET")
    )
  }else{
    myapp <- httr::oauth_app(appname, key, secret)
  }
  scope <- c("basic_read", "extended_read", "location_read",
             "friends_read", "mood_read", "move_read",
             "sleep_read", "meal_read", "weight_read",
             "generic_event_read")
  token <- httr::oauth2.0_token(endpoint, myapp,
                                scope = scope)
}
