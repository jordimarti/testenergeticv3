require "application_system_test_case"

class ComponentMursTest < ApplicationSystemTestCase
  setup do
    @component_mur = component_murs(:one)
  end

  test "visiting the index" do
    visit component_murs_url
    assert_selector "h1", text: "Component Murs"
  end

  test "creating a Component mur" do
    visit component_murs_url
    click_on "New Component Mur"

    fill_in "Conductivitat", with: @component_mur.conductivitat
    fill_in "Gruix", with: @component_mur.gruix
    fill_in "Mur", with: @component_mur.mur_id
    fill_in "Nom", with: @component_mur.nom
    fill_in "Resistencia termica", with: @component_mur.resistencia_termica
    click_on "Create Component mur"

    assert_text "Component mur was successfully created"
    click_on "Back"
  end

  test "updating a Component mur" do
    visit component_murs_url
    click_on "Edit", match: :first

    fill_in "Conductivitat", with: @component_mur.conductivitat
    fill_in "Gruix", with: @component_mur.gruix
    fill_in "Mur", with: @component_mur.mur_id
    fill_in "Nom", with: @component_mur.nom
    fill_in "Resistencia termica", with: @component_mur.resistencia_termica
    click_on "Update Component mur"

    assert_text "Component mur was successfully updated"
    click_on "Back"
  end

  test "destroying a Component mur" do
    visit component_murs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Component mur was successfully destroyed"
  end
end
