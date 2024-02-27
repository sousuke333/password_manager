#!/bin/bash

echo "パスワードマネージャーへようこそ！"

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

