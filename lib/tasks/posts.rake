namespace :posts do
    desc "Import posts"
    task :import => :environment do
        importer = PostImporter.new
        importer.import
    end
end
