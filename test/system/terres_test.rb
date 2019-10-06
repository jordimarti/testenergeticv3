require "application_system_test_case"

class TerresTest < ApplicationSystemTestCase
  setup do
    @terra = terres(:one)
  end

  test "visiting the index" do
    visit terres_url
    assert_selector "h1", text: "Terres"
  end

  test "creating a Terra" do
    visit terres_url
    click_on "New Terra"

    fill_in "Ambit", with: @terra.ambit
    fill_in "Descripcio", with: @terra.descripcio
    fill_in "Entitat", with: @terra.entitat_id
    fill_in "Nom", with: @terra.nom
    fill_in "Percentatge", with: @terra.percentatge
    fill_in "Profunditat", with: @terra.profunditat
    fill_in "Superficie", with: @terra.superficie
    fill_in "Transmitancia terra", with: @terra.transmitancia_terra
    click_on "Create Terra"

    assert_text "Terra was successfully created"
    click_on "Back"
  end

  test "updating a Terra" do
    visit terres_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @terra.ambit
    fill_in "Descripcio", with: @terra.descripcio
    fill_in "Entitat", with: @terra.entitat_id
    fill_in "Nom", with: @terra.nom
    fill_in "Percentatge", with: @terra.percentatge
    fill_in "Profunditat", with: @terra.profunditat
    fill_in "Superficie", with: @terra.superficie
    fill_in "Transmitancia terra", with: @terra.transmitancia_terra
    click_on "Update Terra"

    assert_text "Terra was successfully updated"
    click_on "Back"
  end

  test "destroying a Terra" do
    visit terres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Terra was successfully destroyed"
  end
end
