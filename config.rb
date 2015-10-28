###
# Compass
###

# compass_config do |config|
  # Require any additional compass plugins here.
  # config.add_import_path "bower_components/foundation/scss"
  
  # Set this to the root of your project when deployed:
  # config.http_path = "/"
  # config.css_dir = "stylesheets"
  # config.sass_dir = "stylesheets"
  # config.images_dir = "images"
  # config.javascripts_dir = "javascripts"

  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed

  # To enable relative paths to assets via compass helper functions. Uncomment:
  # relative_assets = true

  # To disable debugging comments that display the original location of your selectors. Uncomment:
  # line_comments = false


  # If you prefer the indented syntax, you might want to regenerate this
  # project again passing --syntax sass, or you can uncomment this:
  # preferred_syntax = :sass
  # and then run:
  # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

# end

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

sprockets.append_path 'assets/semantic/dist'  # to load semantic into application.js

# %w(assets/semantic/dist assets/images/semantic-ui).each do |path|
#   next if sprockets.appended_paths.include? path

#   sprockets.append_path path
# end



###
# Helpers
###

helpers do
  def discover_title(page = current_page)
    page.data.title || page.render({layout: false}).match(/<h1>([\s\S]{1,})<\/h1>/) do |m|
      m ? m[1] : page.url.split(/\//).last.titleize
    end
  end
end


configure :development do
  activate :livereload, ignore:         # Reload the browser automatically whenever files change
  config[:file_watcher_ignore] += [     # ignore certian pesky dirs
    /dist\/components\//,
    /node_modules\//
    ]       
  activate :directory_indexes           # Pretty URLs
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
