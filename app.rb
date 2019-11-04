require "sinatra"

class BookmarkManager < Sinatra::Base
  get "/" do
    "woo"
  end

  run! if app_file == $0
end
