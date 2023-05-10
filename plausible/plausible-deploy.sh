#!/bin/bash

set -e

echo -e "本脚本将帮助您使用 Docker Compose 快速部署 Plausible\nAuthor: Dejavu Moe\nPost:https://dejavu.moe/posts/plausible-selfhosted-with-docker-complete-guide/"
read -p "请按 Enter 键继续..." enter

if [[ "$(command -v docker)" == "" && "$(command -v docker compose)" == "" ]]; then
  echo "您的机器上尚未安装最新版的 Docker 和 Docker Compose 插件，执行中止"
  exit 1
else
  echo "开始执行脚本"
fi

echo "Plausible 相关的持久化数据将会被保存在 $(pwd)/container/plausible/"

if [ -d container ]; then
    echo "当前目录下已经存在 container 文件夹，跳过目录创建"
else
    mkdir container
    echo "已创建 container 文件夹"
fi

cd container
git init
git remote add origin https://github.com/DejavuMoe/self-hosted.git
git config --local core.sparsecheckout true
echo "plausible" >> .git/info/sparse-checkout
git pull --depth=1 origin master
cd plausible
echo "正在下载 geonames.csv.数据库..."
wget https://s3.eu-central-1.wasabisys.com/plausible-application/geonames.csv -P GeoIP/
echo -e "Plausible 所需的环境已经初始化完成\n请完成环境变量的填写\n之后在当前目录使用下面命令完成部署\nsudo docker compose up -d\n按任意键退出..."
read -n 1 -s -r -p ""
exit 0