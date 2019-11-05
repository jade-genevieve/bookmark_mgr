require "pg"

def persisted_data(id:)
  connection = PG.connect(dbname: "bookmarks_mgr_test")
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
