# Markdown
set :markdown_engine, :redcarpet
set :markdown,
  fenced_code_blocks: true,
  smartypants: true,
  disable_indented_code_blocks: true,
  prettify: true,
  tables: true,
  with_toc_data: true,
  no_intra_emphasis: true

# Assets
set :css_dir, "stylesheets"
set :js_dir, "javascripts"
set :images_dir, "images"
set :fonts_dir, "fonts"

# Activate the syntax highlighter
activate :syntax
ready do
  # require './lib/multilang.rb'
end

activate :sprockets

activate :autoprefixer do |config|
  config.browsers = ["last 2 version", "Firefox ESR"]
  config.cascade = false
  config.inline = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

activate :livereload

# Build Configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  # activate :relative_assets
  # activate :gzip
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = "developer-betternow-site"
  s3_sync.region = "eu-west-1"
  s3_sync.version_bucket = true
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567
