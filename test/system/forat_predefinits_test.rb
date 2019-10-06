require "application_system_test_case"

class ForatPredefinitsTest < ApplicationSystemTestCase
  setup do
    @forat_predefinit = forat_predefinits(:one)
  end

  test "visiting the index" do
    visit forat_predefinits_url
    assert_selector "h1", text: "Forat Predefinits"
  end

  test "creating a Forat predefinit" do
    visit forat_predefinits_url
    click_on "New Forat Predefinit"

    fill_in "Descripcio", with: @forat_predefinit.descripcio
    fill_in "Entitat", with: @forat_predefinit.entitat_id
    fill_in "Longitud contacte vidre", with: @forat_predefinit.longitud_contacte_vidre
    fill_in "Nom", with: @forat_predefinit.nom
    fill_in "Numero forats", with: @forat_predefinit.numero_forats
    fill_in "Superficie marc", with: @forat_predefinit.superficie_marc
    fill_in "Superficie vidre", with: @forat_predefinit.superficie_vidre
    fill_in "Tipus marc", with: @forat_predefinit.tipus_marc
    fill_in "Tipus vidre", with: @forat_predefinit.tipus_vidre
    fill_in "Transmitancia marc", with: @forat_predefinit.transmitancia_marc
    fill_in "Transmitancia vidre", with: @forat_predefinit.transmitancia_vidre
    click_on "Create Forat predefinit"

    assert_text "Forat predefinit was successfully created"
    click_on "Back"
  end

  test "updating a Forat predefinit" do
    visit forat_predefinits_url
    click_on "Edit", match: :first

    fill_in "Descripcio", with: @forat_predefinit.descripcio
    fill_in "Entitat", with: @forat_predefinit.entitat_id
    fill_in "Longitud contacte vidre", with: @forat_predefinit.longitud_contacte_vidre
    fill_in "Nom", with: @forat_predefinit.nom
    fill_in "Numero forats", with: @forat_predefinit.numero_forats
    fill_in "Superficie marc", with: @forat_predefinit.superficie_marc
    fill_in "Superficie vidre", with: @forat_predefinit.superficie_vidre
    fill_in "Tipus marc", with: @forat_predefinit.tipus_marc
    fill_in "Tipus vidre", with: @forat_predefinit.tipus_vidre
    fill_in "Transmitancia marc", with: @forat_predefinit.transmitancia_marc
    fill_in "Transmitancia vidre", with: @forat_predefinit.transmitancia_vidre
    click_on "Update Forat predefinit"

    assert_text "Forat predefinit was successfully updated"
    click_on "Back"
  end

  test "destroying a Forat predefinit" do
    visit forat_predefinits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forat predefinit was successfully destroyed"
  end
end
