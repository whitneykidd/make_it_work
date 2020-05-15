require 'rails_helper'

RSpec.describe "on a project's show page" do
    before(:each) do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    end

    it "can see the name, material, and challenge theme that the project belongs to" do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@news_chic.material}")
      expect(page).to have_content("#{@recycled_material_challenge.theme}")
    end
    it "can see the number of contestants on this project" do 
      visit "/projects/#{@news_chic.id}"
      expect(page).to have_content("Number of Contestants: 2")
    end
end

# User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )