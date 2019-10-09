require 'test_helper'

class CertificacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certificacio = certificacions(:one)
  end

  test "should get index" do
    get certificacions_url
    assert_response :success
  end

  test "should get new" do
    get new_certificacio_url
    assert_response :success
  end

  test "should create certificacio" do
    assert_difference('Certificacio.count') do
      post certificacions_url, params: { certificacio: { ambit: @certificacio.ambit, demanda: @certificacio.demanda, emissions: @certificacio.emissions, entitat_id: @certificacio.entitat_id, lletra_demanda: @certificacio.lletra_demanda, lletra_emissions: @certificacio.lletra_emissions, visible: @certificacio.visible } }
    end

    assert_redirected_to certificacio_url(Certificacio.last)
  end

  test "should show certificacio" do
    get certificacio_url(@certificacio)
    assert_response :success
  end

  test "should get edit" do
    get edit_certificacio_url(@certificacio)
    assert_response :success
  end

  test "should update certificacio" do
    patch certificacio_url(@certificacio), params: { certificacio: { ambit: @certificacio.ambit, demanda: @certificacio.demanda, emissions: @certificacio.emissions, entitat_id: @certificacio.entitat_id, lletra_demanda: @certificacio.lletra_demanda, lletra_emissions: @certificacio.lletra_emissions, visible: @certificacio.visible } }
    assert_redirected_to certificacio_url(@certificacio)
  end

  test "should destroy certificacio" do
    assert_difference('Certificacio.count', -1) do
      delete certificacio_url(@certificacio)
    end

    assert_redirected_to certificacions_url
  end
end
