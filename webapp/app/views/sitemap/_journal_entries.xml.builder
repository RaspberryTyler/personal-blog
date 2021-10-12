entries.each do |entry|
  xml.url do
    xml.loc base_url + journal_entry_path(entry.slug)
  end  
end