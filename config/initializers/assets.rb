# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Dir.glob("#{Rails.root}/app/assets/images/progress_icons/**/").each do |path|
  Rails.application.config.assets.paths << path
end
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( point_graph.js  footprint_line_graph.js footprint_pie_graph.js)