require "pg"

feature "Viewing bookmarks" do
  scenario "A user can see bookmarks" do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.bbc.com", title: "BBC")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit("/bookmarks")

    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("BBC", href: "http://www.bbc.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end
