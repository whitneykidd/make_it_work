require 'rails_helper'

RSpec.describe "on a project's show page" do
    before(:each) do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    end

    it "can see the name, material, and challenge theme that the project belongs to" do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@news_chic.material}")
      expect(page).to have_content("#{@recycled_material_challenge.theme}")

  end
end