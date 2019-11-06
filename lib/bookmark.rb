require "pg"
require_relative "database_connection"

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark["url"] }
  end

  def self.create(url:, title:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmarks_mgr_test")
    else
      connection = PG.connect(dbname: "bookmark_mgr")
    end
    result = connection.exec ("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

  def self.delete(id:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmarks_mgr_test")
    else
      connection = PG.connect(dbname: "bookmark_mgr")
    end
    connection.exec ("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmarks_mgr_test")
    else
      connection = PG.connect(dbname: "bookmark_mgr")
    end
    result = connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

  def self.find(id:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmarks_mgr_test")
    else
      connection = PG.connect(dbname: "bookmark_mgr")
    end
    result = connection.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end
end
