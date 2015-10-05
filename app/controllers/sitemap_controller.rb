class SitemapController < ApplicationController

def index
    @static_pages = [root_url]

    @movies = Movie.all
    @series = Series.all

    respond_to do |format|
      format.xml
    end
  end

end
