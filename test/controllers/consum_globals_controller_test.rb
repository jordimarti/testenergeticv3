require 'test_helper'

class ConsumGlobalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consum_global = consum_globals(:one)
  end

  test "should get index" do
    get consum_globals_url
    assert_response :success
  end

  test "should get new" do
    get new_consum_global_url
    assert_response :success
  end

  test "should create consum_global" do
    assert_difference('ConsumGlobal.count') do
      post consum_globals_url, params: { consum_global: { ambit: @consum_global.ambit, consum_anual_electricitat: @consum_global.consum_anual_electricitat, consum_anual_gas: @consum_global.consum_anual_gas, consum_anual_gasoil: @consum_global.consum_anual_gasoil, despesa_anual_electricitat: @consum_global.despesa_anual_electricitat, despesa_anual_gas: @consum_global.despesa_anual_gas, despesa_anual_gasoil: @consum_global.despesa_anual_gasoil, entitat_id: @consum_global.entitat_id } }
    end

    assert_redirected_to consum_global_url(ConsumGlobal.last)
  end

  test "should show consum_global" do
    get consum_global_url(@consum_global)
    assert_response :success
  end

  test "should get edit" do
    get edit_consum_global_url(@consum_global)
    assert_response :success
  end

  test "should update consum_global" do
    patch consum_global_url(@consum_global), params: { consum_global: { ambit: @consum_global.ambit, consum_anual_electricitat: @consum_global.consum_anual_electricitat, consum_anual_gas: @consum_global.consum_anual_gas, consum_anual_gasoil: @consum_global.consum_anual_gasoil, despesa_anual_electricitat: @consum_global.despesa_anual_electricitat, despesa_anual_gas: @consum_global.despesa_anual_gas, despesa_anual_gasoil: @consum_global.despesa_anual_gasoil, entitat_id: @consum_global.entitat_id } }
    assert_redirected_to consum_global_url(@consum_global)
  end

  test "should destroy consum_global" do
    assert_difference('ConsumGlobal.count', -1) do
      delete consum_global_url(@consum_global)
    end

    assert_redirected_to consum_globals_url
  end
end
