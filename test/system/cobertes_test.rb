require "application_system_test_case"

class CobertesTest < ApplicationSystemTestCase
  setup do
    @coberta = cobertes(:one)
  end

  test "visiting the index" do
    visit cobertes_url
    assert_selector "h1", text: "Cobertes"
  end

  test "creating a Coberta" do
    visit cobertes_url
    click_on "New Coberta"

    fill_in "Ambit", with: @coberta.ambit
    fill_in "Descripcio", with: @coberta.descripcio
    fill_in "Entitat", with: @coberta.entitat_id
    fill_in "Nom", with: @coberta.nom
    fill_in "Percentatge", with: @coberta.percentatge
    fill_in "Superficie", with: @coberta.superficie
    click_on "Create Coberta"

    assert_text "Coberta was successfully created"
    click_on "Back"
  end

  test "updating a Coberta" do
    visit cobertes_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @coberta.ambit
    fill_in "Descripcio", with: @coberta.descripcio
    fill_in "Entitat", with: @coberta.entitat_id
    fill_in "Nom", with: @coberta.nom
    fill_in "Percentatge", with: @coberta.percentatge
    fill_in "Superficie", with: @coberta.superficie
    click_on "Update Coberta"

    assert_text "Coberta was successfully updated"
    click_on "Back"
  end

  test "destroying a Coberta" do
    visit cobertes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coberta was successfully destroyed"
  end
end
