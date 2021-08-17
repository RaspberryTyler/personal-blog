require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Load the posts on server start and reload them on changes.
    # https://stackoverflow.com/questions/8543904/how-to-run-my-ruby-code-after-rails-server-start/8546460#8546460
    if defined?(Rails::Server) and ENV.fetch('RAILS_ENV', 'development') == "development"
      config.after_initialize do
        puts 'Listening for file changes...'
        importer = PostImporter.new
        importer.import
        listener = Listen.to(Rails.root.join('app','content')) do |modified, added, removed|
          puts(modified: modified, added: added, removed: removed)
          importer.import
        end
        listener.start
      end
    end
  end
end
