require 'rails_helper'

describe "Show paper page", type: :feature do
  it "should exist at 'paper_path'" do
    #create an paper in the database as @alan to test the show page and save it
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
    expect(page).to have_text('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(page).to have_text('Mind 49: 433-460')
    expect(page).to have_text('1950')
  end
  #a paper with an author should show the author's name on the page
  it "should show the author's name on the page" do
    @paper = FactoryBot.create :paper
    #make Alan Turing and make him the author of the paper
    @alan = FactoryBot.create :author
    @paper.authors << @alan

    visit paper_path(@paper)
    expect(page).to have_text('Alan Turing')
  end
end
