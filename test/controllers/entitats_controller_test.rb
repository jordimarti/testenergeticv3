require 'test_helper'

class EntitatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entitat = entitats(:one)
  end

  test "should get index" do
    get entitats_url
    assert_response :success
  end

  test "should get new" do
    get new_entitat_url
    assert_response :success
  end

  test "should create entitat" do
    assert_difference('Entitat.count') do
      post entitats_url, params: { entitat: { adreca_propietari: @entitat.adreca_propietari, ambit: @entitat.ambit, any_construccio: @entitat.any_construccio, bloc: @entitat.bloc, codi_postal: @entitat.codi_postal, codi_postal_propietari: @entitat.codi_postal_propietari, cognoms_propietari: @entitat.cognoms_propietari, descripcio: @entitat.descripcio, destinacio: @entitat.destinacio, email_propietari: @entitat.email_propietari, municipi_propietari: @entitat.municipi_propietari, nom_propietari: @entitat.nom_propietari, nom_via: @entitat.nom_via, numero_document_identitat_propietari: @entitat.numero_document_identitat_propietari, numero_via: @entitat.numero_via, pare: @entitat.pare, poblacio: @entitat.poblacio, provincia: @entitat.provincia, quota: @entitat.quota, superficie_util: @entitat.superficie_util, telefon_propietari: @entitat.telefon_propietari, tipus_document_identitat_propietari: @entitat.tipus_document_identitat_propietari, tipus_via: @entitat.tipus_via, user_id: @entitat.user_id } }
    end

    assert_redirected_to entitat_url(Entitat.last)
  end

  test "should show entitat" do
    get entitat_url(@entitat)
    assert_response :success
  end

  test "should get edit" do
    get edit_entitat_url(@entitat)
    assert_response :success
  end

  test "should update entitat" do
    patch entitat_url(@entitat), params: { entitat: { adreca_propietari: @entitat.adreca_propietari, ambit: @entitat.ambit, any_construccio: @entitat.any_construccio, bloc: @entitat.bloc, codi_postal: @entitat.codi_postal, codi_postal_propietari: @entitat.codi_postal_propietari, cognoms_propietari: @entitat.cognoms_propietari, descripcio: @entitat.descripcio, destinacio: @entitat.destinacio, email_propietari: @entitat.email_propietari, municipi_propietari: @entitat.municipi_propietari, nom_propietari: @entitat.nom_propietari, nom_via: @entitat.nom_via, numero_document_identitat_propietari: @entitat.numero_document_identitat_propietari, numero_via: @entitat.numero_via, pare: @entitat.pare, poblacio: @entitat.poblacio, provincia: @entitat.provincia, quota: @entitat.quota, superficie_util: @entitat.superficie_util, telefon_propietari: @entitat.telefon_propietari, tipus_document_identitat_propietari: @entitat.tipus_document_identitat_propietari, tipus_via: @entitat.tipus_via, user_id: @entitat.user_id } }
    assert_redirected_to entitat_url(@entitat)
  end

  test "should destroy entitat" do
    assert_difference('Entitat.count', -1) do
      delete entitat_url(@entitat)
    end

    assert_redirected_to entitats_url
  end
end
