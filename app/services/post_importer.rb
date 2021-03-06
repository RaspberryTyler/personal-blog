class PostImporter
    def import
        puts "Deleting existing posts..."
        Post.delete_all
        puts "Importing posts..."

        unsafe_loader = ->(string) { YAML.load(string) }

        content_directories = [
            {
                directory: Rails.root.join('app', 'content', '*.md'),
                status: 'published'
            },

            # I'm not sure if this fancy filtering is actually necessary since
            # drafts don't get committed to version control anyway.
            *([{
                directory: Rails.root.join('app', 'content', 'drafts', '*.md'),
                status: 'draft'
            }] if ENV.fetch("RAILS_ENV", "development") != 'production')
        ]

        for item in content_directories
            directory, status = item.values_at(:directory, :status)
            Dir.glob(directory) do |filename|
                # https://github.com/waiting-for-dev/front_matter_parser/issues/3
                parsed = FrontMatterParser::Parser.parse_file(filename, loader: unsafe_loader)
                expected_filename = "#{parsed['published']}_#{parsed['slug']}.md"
                observed_filename = File.basename(filename)

                if expected_filename != observed_filename
                    path = File.dirname(filename)
                    expected_filepath = "#{path}/#{expected_filename}"
                    observed_filepath = filename

                    if File.exists? expected_filepath
                        raise "Trying to rename #{expected_filename} to #{observed_filename}, but #{observed_filename} already exists."
                    end

                    File.rename(observed_filepath, expected_filepath)
                    puts "Renamed #{observed_filename} to #{expected_filename}"
                end

                print "Creating #{parsed['title']}... "

                post = Post.new
                post.title = parsed['title']
                post.content = CommonMarker.render_html(parsed.content, :DEFAULT, [:table, :strikethrough, :tasklist])
                post.published = parsed['published']
                post.slug = parsed['slug']
                post.status = status
                post.save

                puts "Saved!"
            end
        end
    end
end