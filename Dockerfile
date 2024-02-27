FROM arm64v8/ruby:2.1

# 设置工作目录
WORKDIR /app

# # 复制 Gemfile 和 Gemfile.lock 文件到容器中
COPY Gemfile Gemfile.lock entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh
# # 安装依赖的Gem
RUN bundle install

# RUN gem sources --remove https://rubygems.org/ && \ 
# gem sources -a https://mirrors.cloud.tencent.com/rubygems/ && \ 
# gem install redis-stat

# 设置容器启动命令
ENTRYPOINT ["/app/entrypoint.sh"]
