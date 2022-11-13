require 'rails_helper'
describe "Show author page", type: :feature do
  it "should exist at 'author_path'" do
    #create an author in the database as @alan to test the show page and save it
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.org/Alan_Turing')

  end

end