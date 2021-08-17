pages.each do |page|
  xml.url do
    xml.loc base_url+page
  end  
end