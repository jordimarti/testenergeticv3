require 'test_helper'

class LampadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampada = lampades(:one)
  end

  test "should get index" do
    get lampades_url
    assert_response :success
  end

  test "should get new" do
    get new_lampada_url
    assert_response :success
  end

  test "should create lampada" do
    assert_difference('Lampada.count') do
      post lampades_url, params: { lampada: { ambit: @lampada.ambit, descripcio: @lampada.descripcio, entitat_id: @lampada.entitat_id, numero: @lampada.numero, potencia: @lampada.potencia, tipologia: @lampada.tipologia } }
    end

    assert_redirected_to lampada_url(Lampada.last)
  end

  test "should show lampada" do
    get lampada_url(@lampada)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampada_url(@lampada)
    assert_response :success
  end

  test "should update lampada" do
    patch lampada_url(@lampada), params: { lampada: { ambit: @lampada.ambit, descripcio: @lampada.descripcio, entitat_id: @lampada.entitat_id, numero: @lampada.numero, potencia: @lampada.potencia, tipologia: @lampada.tipologia } }
    assert_redirected_to lampada_url(@lampada)
  end

  test "should destroy lampada" do
    assert_difference('Lampada.count', -1) do
      delete lampada_url(@lampada)
    end

    assert_redirected_to lampades_url
  end
end
