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
    fill_in "Longitud contacte marc opac", with: @forat.longitud_contacte_marc_opac
    fill_in "Longitud contacte marc vidre", with: @forat.longitud_contacte_marc_vidre
    fill_in "Nom", with: @forat.nom
    fill_in "Numero", with: @forat.numero
    fill_in "Percentatge", with: @forat.percentatge
    fill_in "Superficie marc", with: @forat.superficie_marc
    fill_in "Superficie opaca", with: @forat.superficie_opaca
    fill_in "Superficie total", with: @forat.superficie_total
    fill_in "Superficie transparent", with: @forat.superficie_transparent
    fill_in "Transmitancia linial marc opac", with: @forat.transmitancia_linial_marc_opac
    fill_in "Transmitancia linial marc vidre", with: @forat.transmitancia_linial_marc_vidre
    fill_in "Transmitancia marc", with: @forat.transmitancia_marc
    fill_in "Transmitancia opaca", with: @forat.transmitancia_opaca
    fill_in "Transmitancia transparent", with: @forat.transmitancia_transparent
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
    fill_in "Longitud contacte marc opac", with: @forat.longitud_contacte_marc_opac
    fill_in "Longitud contacte marc vidre", with: @forat.longitud_contacte_marc_vidre
    fill_in "Nom", with: @forat.nom
    fill_in "Numero", with: @forat.numero
    fill_in "Percentatge", with: @forat.percentatge
    fill_in "Superficie marc", with: @forat.superficie_marc
    fill_in "Superficie opaca", with: @forat.superficie_opaca
    fill_in "Superficie total", with: @forat.superficie_total
    fill_in "Superficie transparent", with: @forat.superficie_transparent
    fill_in "Transmitancia linial marc opac", with: @forat.transmitancia_linial_marc_opac
    fill_in "Transmitancia linial marc vidre", with: @forat.transmitancia_linial_marc_vidre
    fill_in "Transmitancia marc", with: @forat.transmitancia_marc
    fill_in "Transmitancia opaca", with: @forat.transmitancia_opaca
    fill_in "Transmitancia transparent", with: @forat.transmitancia_transparent
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
