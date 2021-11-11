feature 'adding a bookmark' do
  scenario 'submitting bookmark and seeing it displayed' do
    visit('/add_bookmark')
    fill_in('url', with: 'www.gov.org.uk')
    fill_in('title', with: 'Gov')
    click_button('Submit')
    
    expect(page).to have_link('Gov', href: 'www.gov.org.uk')
  end
end