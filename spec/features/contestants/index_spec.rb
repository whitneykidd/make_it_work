require 'rails_helper'

RSpec.describe "on the contestatnts index page" do
    before(:each) do
      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      
      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    end

    it "see a list of all contestants with project names that contestant has been on" do
      visit "/contestants/"

      expect(page).to have_content("#{@jay.name}")
      expect(page).to have_content("#{@gretchen.name}")
      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@upholstery_tux.name}")

  end
end

