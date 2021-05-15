namespace :posts do
    desc "I am the walrus"
    task :import => :environment do
        puts "Deleting existing posts..."
        Post.delete_all
        puts "Importing posts..."
        markdown =  Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        unsafe_loader = ->(string) { YAML.load(string) }
        Dir.glob(Rails.root.join('app', 'content', '*.md')) do |filename|
            # https://github.com/waiting-for-dev/front_matter_parser/issues/3
            parsed = FrontMatterParser::Parser.parse_file(filename, loader: unsafe_loader)
            post = Post.new
            post.title = parsed['title']
            post.content = markdown.render(parsed.content)
            post.published = parsed['published']
            post.slug = parsed['slug']
            post.save
        end
    end
end
