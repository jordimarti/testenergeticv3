require "application_system_test_case"

class ClimatitzacionsTest < ApplicationSystemTestCase
  setup do
    @climatitzacio = climatitzacions(:one)
  end

  test "visiting the index" do
    visit climatitzacions_url
    assert_selector "h1", text: "Climatitzacions"
  end

  test "creating a Climatitzacio" do
    visit climatitzacions_url
    click_on "New Climatitzacio"

    fill_in "Ambit", with: @climatitzacio.ambit
    fill_in "Entitat", with: @climatitzacio.entitat_id
    fill_in "Generacio", with: @climatitzacio.generacio
    fill_in "Percentatge captadors termics", with: @climatitzacio.percentatge_captadors_termics
    fill_in "Tipologia acs", with: @climatitzacio.tipologia_acs
    fill_in "Tipologia calefaccio 1", with: @climatitzacio.tipologia_calefaccio_1
    fill_in "Tipologia calefaccio 2", with: @climatitzacio.tipologia_calefaccio_2
    fill_in "Tipologia refrigeracio", with: @climatitzacio.tipologia_refrigeracio
    click_on "Create Climatitzacio"

    assert_text "Climatitzacio was successfully created"
    click_on "Back"
  end

  test "updating a Climatitzacio" do
    visit climatitzacions_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @climatitzacio.ambit
    fill_in "Entitat", with: @climatitzacio.entitat_id
    fill_in "Generacio", with: @climatitzacio.generacio
    fill_in "Percentatge captadors termics", with: @climatitzacio.percentatge_captadors_termics
    fill_in "Tipologia acs", with: @climatitzacio.tipologia_acs
    fill_in "Tipologia calefaccio 1", with: @climatitzacio.tipologia_calefaccio_1
    fill_in "Tipologia calefaccio 2", with: @climatitzacio.tipologia_calefaccio_2
    fill_in "Tipologia refrigeracio", with: @climatitzacio.tipologia_refrigeracio
    click_on "Update Climatitzacio"

    assert_text "Climatitzacio was successfully updated"
    click_on "Back"
  end

  test "destroying a Climatitzacio" do
    visit climatitzacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Climatitzacio was successfully destroyed"
  end
end
