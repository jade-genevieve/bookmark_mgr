require "pg"

feature "Viewing bookmarks" do
  scenario "A user can see bookmarks" do
    # connection = PG.connect(dbname: "bookmarks_mgr_test")

    # Add the test data
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.bbc.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.bbc.com", title: "BBC")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit("/bookmarks")

    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("BBC", href: "http://www.bbc.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end
