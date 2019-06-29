require "application_system_test_case"

class EntitatsTest < ApplicationSystemTestCase
  setup do
    @entitat = entitats(:one)
  end

  test "visiting the index" do
    visit entitats_url
    assert_selector "h1", text: "Entitats"
  end

  test "creating a Entitat" do
    visit entitats_url
    click_on "New Entitat"

    fill_in "Adreca propietari", with: @entitat.adreca_propietari
    fill_in "Ambit", with: @entitat.ambit
    fill_in "Any construccio", with: @entitat.any_construccio
    fill_in "Bloc", with: @entitat.bloc
    fill_in "Codi postal", with: @entitat.codi_postal
    fill_in "Codi postal propietari", with: @entitat.codi_postal_propietari
    fill_in "Cognoms propietari", with: @entitat.cognoms_propietari
    fill_in "Descripcio", with: @entitat.descripcio
    fill_in "Destinacio", with: @entitat.destinacio
    fill_in "Email propietari", with: @entitat.email_propietari
    fill_in "Municipi propietari", with: @entitat.municipi_propietari
    fill_in "Nom propietari", with: @entitat.nom_propietari
    fill_in "Nom via", with: @entitat.nom_via
    fill_in "Numero document identitat propietari", with: @entitat.numero_document_identitat_propietari
    fill_in "Numero via", with: @entitat.numero_via
    fill_in "Pare", with: @entitat.pare
    fill_in "Poblacio", with: @entitat.poblacio
    fill_in "Provincia", with: @entitat.provincia
    fill_in "Quota", with: @entitat.quota
    fill_in "Superficie util", with: @entitat.superficie_util
    fill_in "Telefon propietari", with: @entitat.telefon_propietari
    fill_in "Tipus document identitat propietari", with: @entitat.tipus_document_identitat_propietari
    fill_in "Tipus via", with: @entitat.tipus_via
    fill_in "User", with: @entitat.user_id
    click_on "Create Entitat"

    assert_text "Entitat was successfully created"
    click_on "Back"
  end

  test "updating a Entitat" do
    visit entitats_url
    click_on "Edit", match: :first

    fill_in "Adreca propietari", with: @entitat.adreca_propietari
    fill_in "Ambit", with: @entitat.ambit
    fill_in "Any construccio", with: @entitat.any_construccio
    fill_in "Bloc", with: @entitat.bloc
    fill_in "Codi postal", with: @entitat.codi_postal
    fill_in "Codi postal propietari", with: @entitat.codi_postal_propietari
    fill_in "Cognoms propietari", with: @entitat.cognoms_propietari
    fill_in "Descripcio", with: @entitat.descripcio
    fill_in "Destinacio", with: @entitat.destinacio
    fill_in "Email propietari", with: @entitat.email_propietari
    fill_in "Municipi propietari", with: @entitat.municipi_propietari
    fill_in "Nom propietari", with: @entitat.nom_propietari
    fill_in "Nom via", with: @entitat.nom_via
    fill_in "Numero document identitat propietari", with: @entitat.numero_document_identitat_propietari
    fill_in "Numero via", with: @entitat.numero_via
    fill_in "Pare", with: @entitat.pare
    fill_in "Poblacio", with: @entitat.poblacio
    fill_in "Provincia", with: @entitat.provincia
    fill_in "Quota", with: @entitat.quota
    fill_in "Superficie util", with: @entitat.superficie_util
    fill_in "Telefon propietari", with: @entitat.telefon_propietari
    fill_in "Tipus document identitat propietari", with: @entitat.tipus_document_identitat_propietari
    fill_in "Tipus via", with: @entitat.tipus_via
    fill_in "User", with: @entitat.user_id
    click_on "Update Entitat"

    assert_text "Entitat was successfully updated"
    click_on "Back"
  end

  test "destroying a Entitat" do
    visit entitats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entitat was successfully destroyed"
  end
end
