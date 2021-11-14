feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    visit('/add_bookmark')
    fill_in('url', with: 'www.gov.org.uk')
    fill_in('title', with: 'Gov')
    click_button('Submit')
    expect(page).to have_link('Gov', href: 'www.gov.org.uk')

    first('.bookmark').click_button('Delete')
    expect(page).not_to have_link('Gov', href: 'www.gov.org.uk')
  end
end