require 'rails_helper'

describe "Index paper page", type: :feature do
  it "should exist at 'papers_path' and render without error" do
    visit papers_path
  end
  #should contain a table with title, venue and year for each paper
  it "should have a table with title, venue and year for each paper" do
    #create an author in the database as @alan to test the show page and save it
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_text('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(page).to have_text('Mind 49: 433-460')
    expect(page).to have_text('1950')
    expect(page).to have_link('Show', href: paper_path(@paper))
  end
  #should contain a link to add a new paper
  it "should have a link to add a new paper" do
    visit papers_path
    expect(page).to have_link('New', href: new_paper_path)
  end
  #should contain a link to edit each paper
  it "should have a link to edit each paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link('Edit', href: edit_paper_path(@paper))
  end
  #should contain a link to delete each paper
  it "should have a link to delete each paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link('Delete', href: paper_path(@paper))
  end
  #check if from papers from different years only one is shown, if the scope is used
  it "should only show one paper from a year if the scope is used" do
    @paper = FactoryBot.create :paper
    @paper2 = FactoryBot.create :paper2
    visit papers_path
    expect(page).to have_text('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(page).to have_text('COMPUTING MACHINERY AND INTELLIGENCE2')
    visit papers_path(year: 1950)
    expect(page).to have_text('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(page).not_to have_text('COMPUTING MACHINERY AND INTELLIGENCE2')
  end
end