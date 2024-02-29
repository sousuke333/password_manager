#!/bin/bash
# 登録時にファイルを暗号化
# 情報照会時にファイルを復号化

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
  echo $'\n'
  echo "パスワードの追加は成功しました。"
}

registration_information_inquiry() {
  echo -n "サービス名を入力してください："
  read search_name
  if [ -n "$(grep "^$search_name:" ./data.txt)" ]; then
    grep "^$search_name:" ./data.txt | while read line; do
      echo -n "サービス名："
      echo $line | awk -F':' '{print $1}'

      echo -n "ユーザー名："
      echo $line | awk -F':' '{print $2}'

      echo -n "パスワード："
      echo $line | awk -F':' '{print $3}'
      echo $'\n'
    done
  else
    echo "そのサービスは登録されていません。"
  fi
}

echo "パスワードマネージャーへようこそ！"
while :; do
  echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read action
  case $action in
  "Add Password")
    register_password
    ;;
  "Get Password")
    registration_information_inquiry
    ;;
  "Exit")
    echo "Thank you!"
    break
    ;;
  *)
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    ;;
  esac
done
