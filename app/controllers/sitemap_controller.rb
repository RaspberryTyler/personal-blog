class SitemapController < ApplicationController
  def index
    @pages = ['']
    @journal_entries = Post.all

    respond_to do |format|
      format.xml
    end
  end
end