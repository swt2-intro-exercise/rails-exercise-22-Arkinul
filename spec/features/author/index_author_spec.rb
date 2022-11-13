require 'rails_helper'
  #test for an index view of all authors
describe "Index author page", type: :feature do
  #should contain a table with name an homepage for each author
  #should exist at 'authors_path' and render without error
  it "should exist at 'authors_path' and render without error" do
    visit authors_path
  end
  it "should have a table with name and homepage for each author" do
    #create an author in the database as @alan to test the show page and save it
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.org/Alan_Turing')
    expect(page).to have_link('Show', href: author_path(@alan))
  end
  #should contain a link to add a new author
  it "should have a link to add a new author" do
    visit authors_path
    expect(page).to have_link('New', href: new_author_path)
  end
  #should contain a link to edit each author
  it "should have a link to edit each author" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_link('Edit', href: edit_author_path(@alan))
  end
  #should contain a link to delete each author
  it "should have a link to delete each author" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_link('Delete', href: author_path(@alan))
  end
  #after an author has been deleted, the author.count should be one less than before
  it "should delete an author" do
    @alan = FactoryBot.create :author
    visit authors_path
    count = Author.count
    #click on the delete link and confirm the deletion
    find_link('Delete', href: author_path(@alan)).click
    expect(Author.count).to eq(count-1)
  end
end
