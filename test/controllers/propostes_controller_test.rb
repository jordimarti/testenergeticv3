require 'test_helper'

class PropostesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposta = propostes(:one)
  end

  test "should get index" do
    get propostes_url
    assert_response :success
  end

  test "should get new" do
    get new_proposta_url
    assert_response :success
  end

  test "should create proposta" do
    assert_difference('Proposta.count') do
      post propostes_url, params: { proposta: { ambit: @proposta.ambit, cost_optimista: @proposta.cost_optimista, cost_pessimista: @proposta.cost_pessimista, data: @proposta.data, descripcio: @proposta.descripcio, emissions_optimista: @proposta.emissions_optimista, emissions_pessimista: @proposta.emissions_pessimista, entitat_id: @proposta.entitat_id, estalvi_optimista: @proposta.estalvi_optimista, estalvi_pessimista: @proposta.estalvi_pessimista, mesura: @proposta.mesura, roi_optimista: @proposta.roi_optimista, roi_pessimista: @proposta.roi_pessimista } }
    end

    assert_redirected_to proposta_url(Proposta.last)
  end

  test "should show proposta" do
    get proposta_url(@proposta)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposta_url(@proposta)
    assert_response :success
  end

  test "should update proposta" do
    patch proposta_url(@proposta), params: { proposta: { ambit: @proposta.ambit, cost_optimista: @proposta.cost_optimista, cost_pessimista: @proposta.cost_pessimista, data: @proposta.data, descripcio: @proposta.descripcio, emissions_optimista: @proposta.emissions_optimista, emissions_pessimista: @proposta.emissions_pessimista, entitat_id: @proposta.entitat_id, estalvi_optimista: @proposta.estalvi_optimista, estalvi_pessimista: @proposta.estalvi_pessimista, mesura: @proposta.mesura, roi_optimista: @proposta.roi_optimista, roi_pessimista: @proposta.roi_pessimista } }
    assert_redirected_to proposta_url(@proposta)
  end

  test "should destroy proposta" do
    assert_difference('Proposta.count', -1) do
      delete proposta_url(@proposta)
    end

    assert_redirected_to propostes_url
  end
end
