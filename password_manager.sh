#!/bin/bash

echo "パスワードマネージャーへようこそ！"
# 要件整理
# welcomeメッセージの追加、選択肢を出す
# 入力が"Add Password,Get Password,Exit"以外なら再度入力を求める
# Add Passwordが入力されたらデータ登録の処理
# Get Passwordが入力されたら
# サービス名の入力を求める
# data.txtから検索してヒットしたら表示
# なければ"そのサービスは登録されていません。"とし最初の選択肢に
# Exitが入力されたら"Thank you!"と表示しプログラム終了

echo -n "サービス名を入力してください："

read service_name
while [ -z "$service_name" ]
do
  echo -n "空文字は入力できません,サービス名を再度入力してください："
  read service_name
done


echo -n "ユーザー名を入力してください："

read user_name
while [ -z "$user_name" ]
do
  echo -n "空文字は入力できません,ユーザー名を再度入力してください："
  read user_name
done


echo -n "パスワードを入力してください："

read password
while [ -z "$password" ]
do
  echo -n "空文字は入力できません,パスワードを再度入力してください："
  read password
done


echo "$service_name:$user_name:$password" >> ./data.txt
echo "Thank you!"

