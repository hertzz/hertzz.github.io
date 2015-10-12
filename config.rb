Time.zone = "Australia/Melbourne"

activate :blog do |blog|
  blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 350
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/images'

# Use redcarpet for formatting
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Use kramdown for formatting
# set :markdown_engine, :kramdown

# Syntax extension
activate :syntax

# Directory indexes
activate :directory_indexes

configure :development do
  activate :livereload
  set :debug_assets, true
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  activate :automatic_image_sizes
end
