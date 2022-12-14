require 'rails_helper'

 describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render without error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
   end
   it "should have text inputs for an author's first name, last name, and homepage" do
     visit new_author_path
     # these are the standard names given to inputs by the Rails form builder
     expect(page).to have_field('author[first_name]')
     expect(page).to have_field('author[last_name]')
     expect(page).to have_field('author[homepage]')
   end
   #filling the form and submitting it should create a new author in the database
   it "should create a new author in the database" do
      visit new_author_path
      page.fill_in 'author[first_name]', with: 'Alan'
      page.fill_in 'author[last_name]', with: 'Turing'
      page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
      find('input[type="submit"]').click
      #check if the author is in the database
      expect(Author.where(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')).to exist
   end
   #fill in form with missing last name and check if the error message is displayed
   it "should display an error message when last name is missing" do
     visit new_author_path
     page.fill_in 'author[first_name]', with: 'Alan'
     page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
     find('input[type="submit"]').click
     expect(page).to have_text("Last name can't be blank")
   end

 end
