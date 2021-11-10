feature 'adding a bookmark' do
  scenario 'submitting bookmark and seeing it displayed' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/add_bookmark')
    fill_in('url_1', with: 'www.gov.org.uk')
    expect(click_button('Submit'))
  end
end