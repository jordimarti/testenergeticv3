require "application_system_test_case"

class ConsumGlobalsTest < ApplicationSystemTestCase
  setup do
    @consum_global = consum_globals(:one)
  end

  test "visiting the index" do
    visit consum_globals_url
    assert_selector "h1", text: "Consum Globals"
  end

  test "creating a Consum global" do
    visit consum_globals_url
    click_on "New Consum Global"

    fill_in "Ambit", with: @consum_global.ambit
    fill_in "Consum anual electricitat", with: @consum_global.consum_anual_electricitat
    fill_in "Consum anual gas", with: @consum_global.consum_anual_gas
    fill_in "Consum anual gasoil", with: @consum_global.consum_anual_gasoil
    fill_in "Despesa anual electricitat", with: @consum_global.despesa_anual_electricitat
    fill_in "Despesa anual gas", with: @consum_global.despesa_anual_gas
    fill_in "Despesa anual gasoil", with: @consum_global.despesa_anual_gasoil
    fill_in "Entitat", with: @consum_global.entitat_id
    click_on "Create Consum global"

    assert_text "Consum global was successfully created"
    click_on "Back"
  end

  test "updating a Consum global" do
    visit consum_globals_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @consum_global.ambit
    fill_in "Consum anual electricitat", with: @consum_global.consum_anual_electricitat
    fill_in "Consum anual gas", with: @consum_global.consum_anual_gas
    fill_in "Consum anual gasoil", with: @consum_global.consum_anual_gasoil
    fill_in "Despesa anual electricitat", with: @consum_global.despesa_anual_electricitat
    fill_in "Despesa anual gas", with: @consum_global.despesa_anual_gas
    fill_in "Despesa anual gasoil", with: @consum_global.despesa_anual_gasoil
    fill_in "Entitat", with: @consum_global.entitat_id
    click_on "Update Consum global"

    assert_text "Consum global was successfully updated"
    click_on "Back"
  end

  test "destroying a Consum global" do
    visit consum_globals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consum global was successfully destroyed"
  end
end
