require "application_system_test_case"

class PropostesTest < ApplicationSystemTestCase
  setup do
    @proposta = propostes(:one)
  end

  test "visiting the index" do
    visit propostes_url
    assert_selector "h1", text: "Propostes"
  end

  test "creating a Proposta" do
    visit propostes_url
    click_on "New Proposta"

    fill_in "Ambit", with: @proposta.ambit
    fill_in "Cost optimista", with: @proposta.cost_optimista
    fill_in "Cost pessimista", with: @proposta.cost_pessimista
    fill_in "Data", with: @proposta.data
    fill_in "Descripcio", with: @proposta.descripcio
    fill_in "Emissions optimista", with: @proposta.emissions_optimista
    fill_in "Emissions pessimista", with: @proposta.emissions_pessimista
    fill_in "Entitat", with: @proposta.entitat_id
    fill_in "Estalvi optimista", with: @proposta.estalvi_optimista
    fill_in "Estalvi pessimista", with: @proposta.estalvi_pessimista
    fill_in "Mesura", with: @proposta.mesura
    fill_in "Roi optimista", with: @proposta.roi_optimista
    fill_in "Roi pessimista", with: @proposta.roi_pessimista
    click_on "Create Proposta"

    assert_text "Proposta was successfully created"
    click_on "Back"
  end

  test "updating a Proposta" do
    visit propostes_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @proposta.ambit
    fill_in "Cost optimista", with: @proposta.cost_optimista
    fill_in "Cost pessimista", with: @proposta.cost_pessimista
    fill_in "Data", with: @proposta.data
    fill_in "Descripcio", with: @proposta.descripcio
    fill_in "Emissions optimista", with: @proposta.emissions_optimista
    fill_in "Emissions pessimista", with: @proposta.emissions_pessimista
    fill_in "Entitat", with: @proposta.entitat_id
    fill_in "Estalvi optimista", with: @proposta.estalvi_optimista
    fill_in "Estalvi pessimista", with: @proposta.estalvi_pessimista
    fill_in "Mesura", with: @proposta.mesura
    fill_in "Roi optimista", with: @proposta.roi_optimista
    fill_in "Roi pessimista", with: @proposta.roi_pessimista
    click_on "Update Proposta"

    assert_text "Proposta was successfully updated"
    click_on "Back"
  end

  test "destroying a Proposta" do
    visit propostes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proposta was successfully destroyed"
  end
end
