#!/bin/bash

# 入力の際バリデーションを掛けて適切な入力までループする

echo "パスワードマネージャーへようこそ！"

echo -n "サービス名を入力してください："

read service_name

echo -n "ユーザー名を入力してください："

read user_name

echo -n "パスワードを入力してください："

read password

echo "$service_name:$user_name:$password" >> ./data.txt
echo "Thank you!"

