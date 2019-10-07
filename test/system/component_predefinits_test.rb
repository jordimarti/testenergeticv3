require "application_system_test_case"

class ComponentPredefinitsTest < ApplicationSystemTestCase
  setup do
    @component_predefinit = component_predefinits(:one)
  end

  test "visiting the index" do
    visit component_predefinits_url
    assert_selector "h1", text: "Component Predefinits"
  end

  test "creating a Component predefinit" do
    visit component_predefinits_url
    click_on "New Component Predefinit"

    fill_in "Conductivitat", with: @component_predefinit.conductivitat
    fill_in "Densitat", with: @component_predefinit.densitat
    fill_in "Familia", with: @component_predefinit.familia
    fill_in "Gruix", with: @component_predefinit.gruix
    fill_in "Nom", with: @component_predefinit.nom
    fill_in "Resistencia termica", with: @component_predefinit.resistencia_termica
    click_on "Create Component predefinit"

    assert_text "Component predefinit was successfully created"
    click_on "Back"
  end

  test "updating a Component predefinit" do
    visit component_predefinits_url
    click_on "Edit", match: :first

    fill_in "Conductivitat", with: @component_predefinit.conductivitat
    fill_in "Densitat", with: @component_predefinit.densitat
    fill_in "Familia", with: @component_predefinit.familia
    fill_in "Gruix", with: @component_predefinit.gruix
    fill_in "Nom", with: @component_predefinit.nom
    fill_in "Resistencia termica", with: @component_predefinit.resistencia_termica
    click_on "Update Component predefinit"

    assert_text "Component predefinit was successfully updated"
    click_on "Back"
  end

  test "destroying a Component predefinit" do
    visit component_predefinits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Component predefinit was successfully destroyed"
  end
end
