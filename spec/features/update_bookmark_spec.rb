feature '.update' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'www.gov.org.uk', title: 'Gov')
    visit('/bookmarks')
    expect(page).to have_link('Gov', href: 'www.gov.org.uk')

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq "/edit_bookmark/#{bookmark.id}"

    fill_in('title', with: 'Example')
    fill_in('url', with: 'www.example.com')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Gov', href: 'www.gov.org.uk')
    expect(page).to have_link('Example', href: 'www.example.com')
  end
end