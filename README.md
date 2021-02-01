# ツナグ

「人材が余剰している会社」と「人材が不足している現場」をマッチングさせるサービス  

## Description

ユーザーが所属する会社を登録し、会社内で余剰している人材の情報・会社で施工している現場で人材が不足している情報を登録する事ができます。
登録後、余剰している人材の情報の公開期間と人材が不足している現場の工期が一致した場合、それぞれの情報が表示されます。  

## Requirement

ruby 2.5.1  
Rails 5.2.1  
Bundler version 2.0.2  
psql (PostgreSQL) 13.1  

## App URL

https://fierce-dawn-62884.herokuapp.com/

## Usage

$ git clone https://github.com/keitarou516/MatchingApp.git  
$ cd MatchingApp  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s  
👉 http://localhost:3000  
