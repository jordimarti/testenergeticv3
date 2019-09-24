require "application_system_test_case"

class ComponentCobertesTest < ApplicationSystemTestCase
  setup do
    @component_coberta = component_cobertes(:one)
  end

  test "visiting the index" do
    visit component_cobertes_url
    assert_selector "h1", text: "Component Cobertes"
  end

  test "creating a Component coberta" do
    visit component_cobertes_url
    click_on "New Component Coberta"

    fill_in "Coberta", with: @component_coberta.coberta_id
    fill_in "Conductivitat", with: @component_coberta.conductivitat
    fill_in "Gruix", with: @component_coberta.gruix
    fill_in "Nom", with: @component_coberta.nom
    fill_in "Posicio", with: @component_coberta.posicio
    fill_in "Resistencia termica", with: @component_coberta.resistencia_termica
    click_on "Create Component coberta"

    assert_text "Component coberta was successfully created"
    click_on "Back"
  end

  test "updating a Component coberta" do
    visit component_cobertes_url
    click_on "Edit", match: :first

    fill_in "Coberta", with: @component_coberta.coberta_id
    fill_in "Conductivitat", with: @component_coberta.conductivitat
    fill_in "Gruix", with: @component_coberta.gruix
    fill_in "Nom", with: @component_coberta.nom
    fill_in "Posicio", with: @component_coberta.posicio
    fill_in "Resistencia termica", with: @component_coberta.resistencia_termica
    click_on "Update Component coberta"

    assert_text "Component coberta was successfully updated"
    click_on "Back"
  end

  test "destroying a Component coberta" do
    visit component_cobertes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Component coberta was successfully destroyed"
  end
end
