require "application_system_test_case"

class LampadesTest < ApplicationSystemTestCase
  setup do
    @lampada = lampades(:one)
  end

  test "visiting the index" do
    visit lampades_url
    assert_selector "h1", text: "Lampades"
  end

  test "creating a Lampada" do
    visit lampades_url
    click_on "New Lampada"

    fill_in "Ambit", with: @lampada.ambit
    fill_in "Descripcio", with: @lampada.descripcio
    fill_in "Entitat", with: @lampada.entitat_id
    fill_in "Numero", with: @lampada.numero
    fill_in "Potencia", with: @lampada.potencia
    fill_in "Tipologia", with: @lampada.tipologia
    click_on "Create Lampada"

    assert_text "Lampada was successfully created"
    click_on "Back"
  end

  test "updating a Lampada" do
    visit lampades_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @lampada.ambit
    fill_in "Descripcio", with: @lampada.descripcio
    fill_in "Entitat", with: @lampada.entitat_id
    fill_in "Numero", with: @lampada.numero
    fill_in "Potencia", with: @lampada.potencia
    fill_in "Tipologia", with: @lampada.tipologia
    click_on "Update Lampada"

    assert_text "Lampada was successfully updated"
    click_on "Back"
  end

  test "destroying a Lampada" do
    visit lampades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lampada was successfully destroyed"
  end
end
