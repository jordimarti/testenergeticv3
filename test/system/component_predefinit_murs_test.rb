require "application_system_test_case"

class ComponentPredefinitMursTest < ApplicationSystemTestCase
  setup do
    @component_predefinit_mur = component_predefinit_murs(:one)
  end

  test "visiting the index" do
    visit component_predefinit_murs_url
    assert_selector "h1", text: "Component Predefinit Murs"
  end

  test "creating a Component predefinit mur" do
    visit component_predefinit_murs_url
    click_on "New Component Predefinit Mur"

    fill_in "Conductivitat", with: @component_predefinit_mur.conductivitat
    fill_in "Densitat", with: @component_predefinit_mur.densitat
    fill_in "Familia", with: @component_predefinit_mur.familia
    fill_in "Nom", with: @component_predefinit_mur.nom
    click_on "Create Component predefinit mur"

    assert_text "Component predefinit mur was successfully created"
    click_on "Back"
  end

  test "updating a Component predefinit mur" do
    visit component_predefinit_murs_url
    click_on "Edit", match: :first

    fill_in "Conductivitat", with: @component_predefinit_mur.conductivitat
    fill_in "Densitat", with: @component_predefinit_mur.densitat
    fill_in "Familia", with: @component_predefinit_mur.familia
    fill_in "Nom", with: @component_predefinit_mur.nom
    click_on "Update Component predefinit mur"

    assert_text "Component predefinit mur was successfully updated"
    click_on "Back"
  end

  test "destroying a Component predefinit mur" do
    visit component_predefinit_murs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Component predefinit mur was successfully destroyed"
  end
end
