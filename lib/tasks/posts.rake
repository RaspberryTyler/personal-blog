namespace :posts do
    desc "Import posts"
    task :import => :environment do
        puts "Deleting existing posts..."
        Post.delete_all
        puts "Importing posts..."
        markdown =  Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        unsafe_loader = ->(string) { YAML.load(string) }

        content_directories = [
            Rails.root.join('app', 'content', '*.md'),
            *(Rails.root.join('app', 'content', 'drafts', '*.md') if ENV.fetch("RAILS_ENV", "development") != 'production')
        ]

        for directory in content_directories
            Dir.glob(directory) do |filename|
                # https://github.com/waiting-for-dev/front_matter_parser/issues/3
                parsed = FrontMatterParser::Parser.parse_file(filename, loader: unsafe_loader)

                print "Creating #{parsed['title']}... "

                post = Post.new
                post.title = parsed['title']
                post.content = markdown.render(parsed.content)
                post.published = parsed['published']
                post.slug = parsed['slug']
                post.save

                puts "Saved!"
            end
        end
    end
end
