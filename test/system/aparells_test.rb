require "application_system_test_case"

class AparellsTest < ApplicationSystemTestCase
  setup do
    @aparell = aparells(:one)
  end

  test "visiting the index" do
    visit aparells_url
    assert_selector "h1", text: "Aparells"
  end

  test "creating a Aparell" do
    visit aparells_url
    click_on "New Aparell"

    fill_in "Ambit", with: @aparell.ambit
    fill_in "Consum mensual", with: @aparell.consum_mensual
    fill_in "Descripcio", with: @aparell.descripcio
    fill_in "Entitat", with: @aparell.entitat_id
    fill_in "Hores mensuals", with: @aparell.hores_mensuals
    fill_in "Nom", with: @aparell.nom
    fill_in "Potencia", with: @aparell.potencia
    click_on "Create Aparell"

    assert_text "Aparell was successfully created"
    click_on "Back"
  end

  test "updating a Aparell" do
    visit aparells_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @aparell.ambit
    fill_in "Consum mensual", with: @aparell.consum_mensual
    fill_in "Descripcio", with: @aparell.descripcio
    fill_in "Entitat", with: @aparell.entitat_id
    fill_in "Hores mensuals", with: @aparell.hores_mensuals
    fill_in "Nom", with: @aparell.nom
    fill_in "Potencia", with: @aparell.potencia
    click_on "Update Aparell"

    assert_text "Aparell was successfully updated"
    click_on "Back"
  end

  test "destroying a Aparell" do
    visit aparells_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aparell was successfully destroyed"
  end
end
