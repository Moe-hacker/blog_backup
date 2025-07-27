#!/bin/bash
BK_REPO=../blog_backup
BLOG_DIR=$(pwd)
rm -rvf ${BK_REPO}/*
cp -rv ./public ${BK_REPO}/
cp -rv ./source ${BK_REPO}/
cp -v ./_config.yml ${BK_REPO}/
cp -v ./node_modules/hexo-theme-butterfly/_config.yml  ${BK_REPO}/_config-butterfly.yml
cp -v ./package*.json ${BK_REPO}/
cp -rv ./push.sh ${BK_REPO}/
cp -v ./cmsg.py ${BK_REPO}/
cd ${BK_REPO}
git add .
while true; do
  CMSG=$(./cmsg.py || echo "up")
  echo "Commit message: $CMSG"
  read -p "Do you like this one? (y/n) " yn
  case $yn in
  [Yy]*) break ;;
  [Nn]*) continue ;;
  *) continue ;;
  esac
done
git commit -m "$CMSG"
git push
cd ${BLOG_DIR}
./node_modules/hexo/bin/hexo g
./node_modules/hexo/bin/hexo d
