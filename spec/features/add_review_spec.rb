require_relative 'features_helper'

feature 'Add review' do
  given!(:book) { FactoryGirl.create(:book) }
  given(:user) { FactoryGirl.create(:user) }
  
  scenario 'authenticated user can add review' do
    sign_in(user)
    visit(book_path(book))
    click_on('Leave a Review')
    
    fill_in('review[rating]', with: '5')
    fill_in('Text review', with: 'Great book.')
    click_on('Add')
    
    expect(page).to have_content('Great book.')
    expect(page).to have_content(user.username)
  end
end