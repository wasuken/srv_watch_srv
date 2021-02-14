# README

## 留意点

今回はプロトタイプということで、一種類しかデータ取得しない。

ということでCPU温度一直線のロジックで書いてく。

本来ならば何か値を受け取って、それによって参照するlog派生クラスを変更する。

つまり、文字列を渡すことによって、適切なlog派生クラスを返す関数が必要になると思われる。

## テーブル定義

すべてのテーブルにid, created\_at, updated_at入ってるものとする。

### logs

* date_point

	* type: datetime

	いつ取得したか。

* name

  * type: text

  本当はUniqueにするべき。

* value

	* type: float

	観測値

### servers

* name

	* type: text

* ip_address

	* type: text

* mac_address

	* type: text

* other_info

	* type: text

### server_logs

* server_id

	* type: integer

* log_id

	* type: integer
