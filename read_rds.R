######################################################################
## Tickers
vec_tickers <- c("AAPL", "GOOGL", "AMZN", "QQQ", "SPY", "NVDA")
# provided by Dr.Hua
# read iqfeed data from .rds files
for(ticker in vec_tickers)
{
  # ticker <- "AAPL"
  rds_folder <- paste0("../Data/raw/", ticker)
  files <- list.files(rds_folder, "*.rds", full.names=TRUE)
  files <- files[unlist(lapply(files, function(x){nchar(tail(strsplit(x, "/")[[1]],1)) == 11}))]
  dat <- NULL
  for (f in files)
  {
    dat <- rbind(dat, readRDS(f))
  }
  tot_dates <- lubridate::date(dat$time)
  dat <- dat[(tot_dates >= lubridate::as_date("2007-07-01")) & (tot_dates <= lubridate::as_date("2018-07-31")),]
  tot_minutes <- lubridate::hour(dat$time)*60+lubridate::minute(dat$time)
  dat <- dat[(tot_minutes > 9*60 + 30) & (tot_minutes < 16*60 + 1),]
  dim(dat)
  cat(ticker, nrow(dat), "\n")
  write.table(dat, paste0("../DATA/minutes/", ticker, ".csv"), row.names = FALSE, sep = ",")
}
################################################################