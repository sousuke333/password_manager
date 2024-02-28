#!/bin/bash
register_password() {
  echo -n "サービス名を入力してください："
  read service_name
  while [ -z "$service_name" ]; do
    echo -n "空文字は入力できません,サービス名を再度入力してください："
    read service_name
  done

  echo -n "ユーザー名を入力してください："
  read user_name
  while [ -z "$user_name" ]; do
    echo -n "空文字は入力できません,ユーザー名を再度入力してください："
    read user_name
  done

  echo -n "パスワードを入力してください："
  read password
  while [ -z "$password" ]; do
    echo -n "空文字は入力できません,パスワードを再度入力してください："
    read password
  done

  echo "$service_name:$user_name:$password" >>./data.txt
  echo "Thank you!"
}

# 要件整理
# 入力に対してのループ処理
# パスワード照会のロジック

echo "パスワードマネージャーへようこそ！"
# 入力が"Add Password,Get Password,Exit"以外なら再度入力を求める、ケースでループがよさそう
while :; do
  echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read action
  case $action in
  "Add Password") echo "Add Passwordが入力されました" ;;
  "Get Password") echo "Get Passwordが入力されました" ;;
  "Exit")
    echo "Exitが入力されました"
    break
    ;;
  "")
    echo "選択肢のいずれかを入力してください"
    ;;
  esac
done
# Add Passwordが入力されたらデータ登録の処理
# register_password

# Get Passwordが入力されたら
# echo "サービス名を入力してください："
# サービス名の入力を求める
# grepでサービス名をdata.txtから取得して表示

# なければ"そのサービスは登録されていません。"とし最初の選択肢に
# echo "そのサービスは登録されていません。"
# Exitが入力されたら"Thank you!"と表示しプログラム終了
