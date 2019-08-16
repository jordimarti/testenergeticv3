require 'test_helper'

class ClimatitzacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @climatitzacio = climatitzacions(:one)
  end

  test "should get index" do
    get climatitzacions_url
    assert_response :success
  end

  test "should get new" do
    get new_climatitzacio_url
    assert_response :success
  end

  test "should create climatitzacio" do
    assert_difference('Climatitzacio.count') do
      post climatitzacions_url, params: { climatitzacio: { ambit: @climatitzacio.ambit, entitat_id: @climatitzacio.entitat_id, generacio: @climatitzacio.generacio, percentatge_captadors_termics: @climatitzacio.percentatge_captadors_termics, tipologia_acs: @climatitzacio.tipologia_acs, tipologia_calefaccio_1: @climatitzacio.tipologia_calefaccio_1, tipologia_calefaccio_2: @climatitzacio.tipologia_calefaccio_2, tipologia_refrigeracio: @climatitzacio.tipologia_refrigeracio } }
    end

    assert_redirected_to climatitzacio_url(Climatitzacio.last)
  end

  test "should show climatitzacio" do
    get climatitzacio_url(@climatitzacio)
    assert_response :success
  end

  test "should get edit" do
    get edit_climatitzacio_url(@climatitzacio)
    assert_response :success
  end

  test "should update climatitzacio" do
    patch climatitzacio_url(@climatitzacio), params: { climatitzacio: { ambit: @climatitzacio.ambit, entitat_id: @climatitzacio.entitat_id, generacio: @climatitzacio.generacio, percentatge_captadors_termics: @climatitzacio.percentatge_captadors_termics, tipologia_acs: @climatitzacio.tipologia_acs, tipologia_calefaccio_1: @climatitzacio.tipologia_calefaccio_1, tipologia_calefaccio_2: @climatitzacio.tipologia_calefaccio_2, tipologia_refrigeracio: @climatitzacio.tipologia_refrigeracio } }
    assert_redirected_to climatitzacio_url(@climatitzacio)
  end

  test "should destroy climatitzacio" do
    assert_difference('Climatitzacio.count', -1) do
      delete climatitzacio_url(@climatitzacio)
    end

    assert_redirected_to climatitzacions_url
  end
end
