require 'rails_helper'
describe "Show author page", type: :feature do
  it "should exist at 'author_path'" do
    #create an author in the database to test the show page
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    visit author_path(@alan)
    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.org/Alan_Turing')

  end


end