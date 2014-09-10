# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( attachments.js )
Rails.application.config.assets.precompile += %w( ideas.js )
Rails.application.config.assets.precompile += %w( avatar_preview.js )
Rails.application.config.assets.precompile += %w( comments.js )
Rails.application.config.assets.precompile += %w( star-rating.js )
Rails.application.config.assets.precompile += %w( rating.js )
Rails.application.config.assets.precompile += %w( progressbar.gif )
Rails.application.config.assets.precompile += %w( loading.gif )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
