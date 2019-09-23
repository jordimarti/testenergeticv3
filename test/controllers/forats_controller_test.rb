require 'test_helper'

class ForatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forat = forats(:one)
  end

  test "should get index" do
    get forats_url
    assert_response :success
  end

  test "should get new" do
    get new_forat_url
    assert_response :success
  end

  test "should create forat" do
    assert_difference('Forat.count') do
      post forats_url, params: { forat: { ambit: @forat.ambit, descripcio: @forat.descripcio, entitat_id: @forat.entitat_id, longitud_contacte_marc_opac: @forat.longitud_contacte_marc_opac, longitud_contacte_marc_vidre: @forat.longitud_contacte_marc_vidre, nom: @forat.nom, numero: @forat.numero, percentatge: @forat.percentatge, superficie_marc: @forat.superficie_marc, superficie_opaca: @forat.superficie_opaca, superficie_total: @forat.superficie_total, superficie_transparent: @forat.superficie_transparent, transmitancia_linial_marc_opac: @forat.transmitancia_linial_marc_opac, transmitancia_linial_marc_vidre: @forat.transmitancia_linial_marc_vidre, transmitancia_marc: @forat.transmitancia_marc, transmitancia_opaca: @forat.transmitancia_opaca, transmitancia_transparent: @forat.transmitancia_transparent } }
    end

    assert_redirected_to forat_url(Forat.last)
  end

  test "should show forat" do
    get forat_url(@forat)
    assert_response :success
  end

  test "should get edit" do
    get edit_forat_url(@forat)
    assert_response :success
  end

  test "should update forat" do
    patch forat_url(@forat), params: { forat: { ambit: @forat.ambit, descripcio: @forat.descripcio, entitat_id: @forat.entitat_id, longitud_contacte_marc_opac: @forat.longitud_contacte_marc_opac, longitud_contacte_marc_vidre: @forat.longitud_contacte_marc_vidre, nom: @forat.nom, numero: @forat.numero, percentatge: @forat.percentatge, superficie_marc: @forat.superficie_marc, superficie_opaca: @forat.superficie_opaca, superficie_total: @forat.superficie_total, superficie_transparent: @forat.superficie_transparent, transmitancia_linial_marc_opac: @forat.transmitancia_linial_marc_opac, transmitancia_linial_marc_vidre: @forat.transmitancia_linial_marc_vidre, transmitancia_marc: @forat.transmitancia_marc, transmitancia_opaca: @forat.transmitancia_opaca, transmitancia_transparent: @forat.transmitancia_transparent } }
    assert_redirected_to forat_url(@forat)
  end

  test "should destroy forat" do
    assert_difference('Forat.count', -1) do
      delete forat_url(@forat)
    end

    assert_redirected_to forats_url
  end
end
