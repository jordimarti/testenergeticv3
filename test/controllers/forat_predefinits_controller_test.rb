require 'test_helper'

class ForatPredefinitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forat_predefinit = forat_predefinits(:one)
  end

  test "should get index" do
    get forat_predefinits_url
    assert_response :success
  end

  test "should get new" do
    get new_forat_predefinit_url
    assert_response :success
  end

  test "should create forat_predefinit" do
    assert_difference('ForatPredefinit.count') do
      post forat_predefinits_url, params: { forat_predefinit: { descripcio: @forat_predefinit.descripcio, entitat_id: @forat_predefinit.entitat_id, longitud_contacte_vidre: @forat_predefinit.longitud_contacte_vidre, nom: @forat_predefinit.nom, numero_forats: @forat_predefinit.numero_forats, superficie_marc: @forat_predefinit.superficie_marc, superficie_vidre: @forat_predefinit.superficie_vidre, tipus_marc: @forat_predefinit.tipus_marc, tipus_vidre: @forat_predefinit.tipus_vidre, transmitancia_marc: @forat_predefinit.transmitancia_marc, transmitancia_vidre: @forat_predefinit.transmitancia_vidre } }
    end

    assert_redirected_to forat_predefinit_url(ForatPredefinit.last)
  end

  test "should show forat_predefinit" do
    get forat_predefinit_url(@forat_predefinit)
    assert_response :success
  end

  test "should get edit" do
    get edit_forat_predefinit_url(@forat_predefinit)
    assert_response :success
  end

  test "should update forat_predefinit" do
    patch forat_predefinit_url(@forat_predefinit), params: { forat_predefinit: { descripcio: @forat_predefinit.descripcio, entitat_id: @forat_predefinit.entitat_id, longitud_contacte_vidre: @forat_predefinit.longitud_contacte_vidre, nom: @forat_predefinit.nom, numero_forats: @forat_predefinit.numero_forats, superficie_marc: @forat_predefinit.superficie_marc, superficie_vidre: @forat_predefinit.superficie_vidre, tipus_marc: @forat_predefinit.tipus_marc, tipus_vidre: @forat_predefinit.tipus_vidre, transmitancia_marc: @forat_predefinit.transmitancia_marc, transmitancia_vidre: @forat_predefinit.transmitancia_vidre } }
    assert_redirected_to forat_predefinit_url(@forat_predefinit)
  end

  test "should destroy forat_predefinit" do
    assert_difference('ForatPredefinit.count', -1) do
      delete forat_predefinit_url(@forat_predefinit)
    end

    assert_redirected_to forat_predefinits_url
  end
end
