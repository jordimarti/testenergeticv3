require "application_system_test_case"

class CertificacionsTest < ApplicationSystemTestCase
  setup do
    @certificacio = certificacions(:one)
  end

  test "visiting the index" do
    visit certificacions_url
    assert_selector "h1", text: "Certificacions"
  end

  test "creating a Certificacio" do
    visit certificacions_url
    click_on "New Certificacio"

    fill_in "Ambit", with: @certificacio.ambit
    fill_in "Demanda", with: @certificacio.demanda
    fill_in "Emissions", with: @certificacio.emissions
    fill_in "Entitat", with: @certificacio.entitat_id
    fill_in "Lletra demanda", with: @certificacio.lletra_demanda
    fill_in "Lletra emissions", with: @certificacio.lletra_emissions
    check "Visible" if @certificacio.visible
    click_on "Create Certificacio"

    assert_text "Certificacio was successfully created"
    click_on "Back"
  end

  test "updating a Certificacio" do
    visit certificacions_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @certificacio.ambit
    fill_in "Demanda", with: @certificacio.demanda
    fill_in "Emissions", with: @certificacio.emissions
    fill_in "Entitat", with: @certificacio.entitat_id
    fill_in "Lletra demanda", with: @certificacio.lletra_demanda
    fill_in "Lletra emissions", with: @certificacio.lletra_emissions
    check "Visible" if @certificacio.visible
    click_on "Update Certificacio"

    assert_text "Certificacio was successfully updated"
    click_on "Back"
  end

  test "destroying a Certificacio" do
    visit certificacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Certificacio was successfully destroyed"
  end
end
