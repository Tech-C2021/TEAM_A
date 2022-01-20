require 'active_record'

ActiveRecord::Base.establish_connection( 
  adapter:  "postgresql", 
  host:     "postgresql", #ローカルのDBに接続します。
  username: "root", #ユーザー名
  password: "root",  #設定したMySQLのパスワード
  database: "kakaku",  #接続したいDB名
)


class MobilePhone < ActiveRecord::Base
  
end
