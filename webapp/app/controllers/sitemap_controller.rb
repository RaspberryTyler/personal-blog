class SitemapController < ApplicationController
  def index
    @pages = ['']
    @journal_entries = Post.all
    @base_url = unless ENV.fetch('RAILS_BASE_URL').empty?
      ENV.fetch('RAILS_BASE_URL')
    else
      "#{request.protocol}#{request.host_with_port}"
    end

    respond_to do |format|
      format.xml
    end
  end
end