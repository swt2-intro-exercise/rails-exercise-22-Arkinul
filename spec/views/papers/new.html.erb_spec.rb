require 'rails_helper'


describe "New paper page", type: :feature do
  #new paper page should exist and render without error
  it "should exist at 'new_paper_path' and render without error" do
    visit new_paper_path
  end
  #should have text inputs for a paper's title, venue, and year
  it "should have text inputs for a paper's title, venue, and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end
  #filling the form and submitting it should create a new paper in the database
  it "should create a new paper in the database" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: '1950'
    find('input[type="submit"]').click
    #check if the paper is in the database
    expect(Paper.where(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: '1950')).to exist
  end
  #fill in form with missing title and check if the error message is displayed
  it "should display an error message when title is missing" do
    visit new_paper_path
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: '1950'
    find('input[type="submit"]').click
    expect(page).to have_text("Title can't be blank")
  end
end
