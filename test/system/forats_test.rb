require "application_system_test_case"

class ForatsTest < ApplicationSystemTestCase
  setup do
    @forat = forats(:one)
  end

  test "visiting the index" do
    visit forats_url
    assert_selector "h1", text: "Forats"
  end

  test "creating a Forat" do
    visit forats_url
    click_on "New Forat"

    fill_in "Ambit", with: @forat.ambit
    fill_in "Descripcio", with: @forat.descripcio
    fill_in "Entitat", with: @forat.entitat_id
    fill_in "Nom", with: @forat.nom
    fill_in "Part opaca", with: @forat.part_opaca
    fill_in "Part transparent", with: @forat.part_transparent
    fill_in "Percentatge", with: @forat.percentatge
    fill_in "Superficie", with: @forat.superficie
    click_on "Create Forat"

    assert_text "Forat was successfully created"
    click_on "Back"
  end

  test "updating a Forat" do
    visit forats_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @forat.ambit
    fill_in "Descripcio", with: @forat.descripcio
    fill_in "Entitat", with: @forat.entitat_id
    fill_in "Nom", with: @forat.nom
    fill_in "Part opaca", with: @forat.part_opaca
    fill_in "Part transparent", with: @forat.part_transparent
    fill_in "Percentatge", with: @forat.percentatge
    fill_in "Superficie", with: @forat.superficie
    click_on "Update Forat"

    assert_text "Forat was successfully updated"
    click_on "Back"
  end

  test "destroying a Forat" do
    visit forats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forat was successfully destroyed"
  end
end
