require_relative "./lib/database_connection"

if ENV["ENVIRONMENT"] == "test"
  DatabaseConnection.setup("bookmarks_mgr_test")
else
  DatabaseConnection.setup("bookmark_mgr")
end
