#!/usr/bin/env ruby

require 'fileutils'
require 'yaml'

posts = Dir["_posts/*md"]

categories = posts.flat_map do |post|
  YAML.load_file(post)["categories"]
end.compact.uniq

categories.each do |category|
  dir = File.join("categories", category.downcase.gsub(/\s+/, '-'))
  FileUtils.mkdir_p(dir)
  File.write(File.join(dir, "index.html"), <<-EOS)
---
layout: category
title: #{category}
---
  EOS
end
