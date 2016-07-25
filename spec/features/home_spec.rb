require_relative 'features_helper'

feature 'Home', js: true do
  given!(:book) { create(:book_with_order, quantity: 2).decorate }
  given!(:book2) { create(:book_with_order, title: 'Some book').decorate }
  
  it 'test' do
    expect(page).to have_selector :css, 'div.book-slider'
  end
  
  scenario 'user can see best sellers' do
    visit(root_path)
    
    within('.book-slider') do
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.price)
      expect(page).to have_content(book.description)
      # expect(page).to have_content(book.author.full_name)
    end
  end
  
  scenario 'user can navigate between carousel items' do
    visit(root_path)

    within('.book-slider') do
      find('.bx-next').click

      expect(page).to have_content(book2.title)
      expect(page).to_not have_content(book.title)
    end
  end

  # scenario 'user can add best sellers to cart' do
  #   visit(root_path)

  #   within('.carousel') do
  #     click_on('Add to cart')
  #   end

  #   expect(page).to have_current_path(cart_path)
  #   expect(page).to have_content(book.title)
  #   expect(page).to have_content(book.price)
  # end
end