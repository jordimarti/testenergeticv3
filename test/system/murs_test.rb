require "application_system_test_case"

class MursTest < ApplicationSystemTestCase
  setup do
    @mur = murs(:one)
  end

  test "visiting the index" do
    visit murs_url
    assert_selector "h1", text: "Murs"
  end

  test "creating a Mur" do
    visit murs_url
    click_on "New Mur"

    fill_in "Ambit", with: @mur.ambit
    fill_in "Descripcio", with: @mur.descripcio
    fill_in "Entitat", with: @mur.entitat_id
    fill_in "Nom", with: @mur.nom
    fill_in "Percentatge", with: @mur.percentatge
    fill_in "Superficie", with: @mur.superficie
    fill_in "Tipus mur", with: @mur.tipus_mur
    click_on "Create Mur"

    assert_text "Mur was successfully created"
    click_on "Back"
  end

  test "updating a Mur" do
    visit murs_url
    click_on "Edit", match: :first

    fill_in "Ambit", with: @mur.ambit
    fill_in "Descripcio", with: @mur.descripcio
    fill_in "Entitat", with: @mur.entitat_id
    fill_in "Nom", with: @mur.nom
    fill_in "Percentatge", with: @mur.percentatge
    fill_in "Superficie", with: @mur.superficie
    fill_in "Tipus mur", with: @mur.tipus_mur
    click_on "Update Mur"

    assert_text "Mur was successfully updated"
    click_on "Back"
  end

  test "destroying a Mur" do
    visit murs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mur was successfully destroyed"
  end
end
