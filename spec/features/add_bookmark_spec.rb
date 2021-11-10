feature 'adding a bookmark' do
  scenario 'submitting bookmark and seeing it displayed' do
    visit('/add_bookmark')
    fill_in('url', with: 'www.gov.org.uk')
    click_button('Submit')
    
    expect(page).to have_content 'www.gov.org.uk'
  end
end