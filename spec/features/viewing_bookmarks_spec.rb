feature "Viewing bookmarks" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content "woo"
  end

  scenario "user can see bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "http://wwww.makersacademy.com"
    expect(page).to have_content "http://wwww.bbc.com"
    expect(page).to have_content "http://wwww.google.com"
  end
end
