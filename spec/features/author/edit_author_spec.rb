require 'rails_helper'
#edit author page should exist and render without error
describe "Edit author page", type: :feature do
  #edit author page should exist and render without error
  it "should exist at 'edit_author_path' and render without error" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end
end