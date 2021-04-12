#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

#mkdir -p docs/.vuepress/dist-gitee

# 生成静态文件
yarn run build


#cp -rf docs/.vuepress/dist docs/.vuepress/dist-gitee

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io
# git push -f git@github.com:7revor/7revor.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

git remote add origin https://github.com/agangdundan/mydocs.git
git branch -M gh-pages
# 如果使用 travis 持续集成
git push -f https://${access_token}@github.com/agangdundan/mydocs.git

yarn run build-gitee
cd docs/.vuepress/dist-gitee
git init
git add -A
git remote add origin https://gitee.com/agangdundan/mydocs.git
git branch -M gh-pages
# 推送至gitee
git push -f https://userName:${access_token_gitee}@gitee.com/agangdundan/mydocs.git


cd -
