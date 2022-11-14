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
end
