class Bookmark
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmarks_mgr_test")
    else
      connection = PG.connect(dbname: "bookmark_mgr")
    end
    result = connection.exec ("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark["url"] }
  end
end
