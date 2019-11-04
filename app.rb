require "sinatra"
require "./lib/bookmark.rb"

class BookmarkManager < Sinatra::Base
  get "/" do
    "woo"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
