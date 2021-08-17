namespace :posts do
    desc "Import posts"
    task :import => :environment do
        importer = PostImporter.new
        importer.import
    end

    desc "New draft"
    task :draft, [:title] => :environment do |task, args|
        directory = Rails.root.join('app', 'content', 'drafts')
        title = args[:title]
        slug = title.parameterize
        date = Time.new.strftime("%Y-%m-%d")
        filename = "#{date}_#{slug}.md"
        filepath = "#{directory}/#{filename}"

        if File.exists? filepath
            raise "A post with this name already exists!"
        end

        puts filepath

        File.open(filepath, "w") do |f|
            f.puts("---")
            f.puts("title: \"#{title}\"")
            f.puts("slug: #{slug}")
            f.puts("tags: ")
            f.puts("published: #{date}")
            f.puts("---")
            # f.write("\n")
        end

        puts "New draft post #{filename} created!"
    end
end