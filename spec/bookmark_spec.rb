require "bookmark"

describe Bookmark do
  describe ".all" do
    it "contains bookmarks" do
      connection = PG.connect(dbname: "bookmarks_mgr_test")

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com')")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bbc.com')")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com')")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.bbc.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
