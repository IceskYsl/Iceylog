## Iceylog
Iceylog是一款基于Ruby 1.9.3 + Rails3 + MongoDB，支持Markdown语法的个人博客系统～

###系统特色
* 开源
* 基于Ruby 1.9.3 + Rails3 + MongoDB
* 支持 Markdown
* 支持 Disqus
* 尽可能的简单和轻量级
* 支持简单的配置

###系统功能
* 支持文章（post）√
* 支持页面（page） √
* 支持友情链接 √
* 文章支持分类和标签√
* 文章按月归档√
* 文章按tag查看√
* 支持google自定义搜索√
* 支持评论（Disqus）√
* 支持图片上传√
* 代码高亮 √
* 分类合并√
* RSS输出√

###更新纪录
* 2012.8.18: 添加文章的版权作者和链接信息;
* 2012.7.29: 添加RSS订阅功能;
* 2012.7.08: 添加post和page的阅读次数;
* 2012.7.08: 添加分类合并功能;
* 2012.7.08: 添加代码高亮功能(pygments.rb+Redcarpet);
* 2012.7.08: 添加后台图片管理功能；
* 2012.7.08: 添加发布文章时上传图片功能；
* 2012.7.07: 添加发布文章时的预览功能；
* 2012.7.01: 添加按月归档功能；
* 2012.6.30: 添加数据统计功能；
* 2012.6.29: 添加按照tag查看文章功能；
* 2012.6.27: 添加Disqus的评论支持；

## Install

### Ruby 1.9.3

+ rvm list
+ rvm use ruby-1.9.3-rc1
+ bundle  install

### MongoDB
+ ./bin/mongod  --dbpath /datas/dbs/monogdb/   --fork -logpath /var/log/mongodb.log

### git
+ git clone git://github.com/IceskYsl/Iceylog.git online_20120624
+ ln -s ./online_20120624  current
+ cd current
+ RAILS_ENV=production rake -T
+ RAILS_ENV=production rake db:seed
+ RAILS_ENV=production bundle exec rake assets:precompile 
+ bundle exec unicorn  -E production -D
=>http://host:8080/



###Mac OS X
brew install ImageMagick

 

