#!/bin/sh
# 将传入的参数拼接在 redis-stat 后面
# 检查是否有参数传递进来
if [ "$#" -gt 0 ]; then
    # 如果有参数，拼接到 redis-stat 命令后面
    exec redis-stat "$@"
else
    # 如果没有参数，直接执行 redis-stat
    exec redis-stat
fi