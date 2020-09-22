# 用途
#   从仓库中历史中永久删除文件
# 参考
#   https://docs.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository
#   https://docs.github.com/en/github/managing-large-files/removing-files-from-a-repositorys-history

files="*.zip"

# 把现有提交的记录删除
git rm --cached $files
# 重新提交 覆盖上一次提交
git commit --amend -CHEAD
# ===================
# 从历史中永久移除
# ===================
# 递归删除符合类型的文件
git filter-branch --force --index-filter \
    "git rm --cached --ignore-unmatch $files" \
    --prune-empty --tag-name-filter cat -- --all

# # # 递归删除指定目录下的所有文件
# # git filter-branch --force --index-filter \
# #     "git rm -r --cached --ignore-unmatch 工具" \
# #     --prune-empty --tag-name-filter cat -- --all

# # 垃圾回收
git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now

# 强推覆盖GitHub存储库以及所有已推送的分支
git push origin --force --all
# 对Git标签进行强制推送 从标记的发行版中删除文件
git push origin --force --tags

# 查看状态
git stash show

# 寻找文件
# find .git/objects -type f
# .git/objects/7f/a055b2d22855b67287e4e30d9a91584c8b27c1
# 递归显示文件大小 大小自动匹配
# du -ah    # 此处略去了无关输出
#  54M    ./.git/objects/7f/a055b2d22855b67287e4e30d9a91584c8b27c1
#  77M    ./bigfile
# 132M    .
