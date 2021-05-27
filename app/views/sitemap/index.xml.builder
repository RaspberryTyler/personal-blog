# app/views/index.xml.builder

base_url = "#{request.protocol}#{request.host_with_port}"

xml.instruct! :xml, :version=>"1.0"
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml << (render :partial => 'sitemap/pages', locals: {pages: @pages, base_url: base_url})
  xml << (render :partial => 'sitemap/journal_entries', locals: {entries: @journal_entries, base_url: base_url})
end