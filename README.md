# myJawbone

Jawbone APIからデータを取得するパッケージです。
自分の用途に必要な分（＋要望）にしか実装するつもりが無いのでmyFitbitとしています。

## Example

```r
library("myJawbone")
jawbone_token <- getToken("YOUR API KEY", "YOUR CONSUMER SECRET")

# 睡眠の統計値データ
getSleepdata(jawbone_token)

# 睡眠状態データ
getSleepTickdata("2016-01-27", jawbone_token)

```
