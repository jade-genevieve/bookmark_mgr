require "bookmark"

describe Bookmark do
  describe ".all" do
    it "contains bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://wwww.makersacademy.com")
      expect(bookmarks).to include("http://wwww.bbc.com")
      expect(bookmarks).to include("http://wwww.google.com")
    end
  end
end
