require 'test_helper'

class AparellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aparell = aparells(:one)
  end

  test "should get index" do
    get aparells_url
    assert_response :success
  end

  test "should get new" do
    get new_aparell_url
    assert_response :success
  end

  test "should create aparell" do
    assert_difference('Aparell.count') do
      post aparells_url, params: { aparell: { ambit: @aparell.ambit, consum_mensual: @aparell.consum_mensual, descripcio: @aparell.descripcio, entitat_id: @aparell.entitat_id, hores_mensuals: @aparell.hores_mensuals, nom: @aparell.nom, potencia: @aparell.potencia } }
    end

    assert_redirected_to aparell_url(Aparell.last)
  end

  test "should show aparell" do
    get aparell_url(@aparell)
    assert_response :success
  end

  test "should get edit" do
    get edit_aparell_url(@aparell)
    assert_response :success
  end

  test "should update aparell" do
    patch aparell_url(@aparell), params: { aparell: { ambit: @aparell.ambit, consum_mensual: @aparell.consum_mensual, descripcio: @aparell.descripcio, entitat_id: @aparell.entitat_id, hores_mensuals: @aparell.hores_mensuals, nom: @aparell.nom, potencia: @aparell.potencia } }
    assert_redirected_to aparell_url(@aparell)
  end

  test "should destroy aparell" do
    assert_difference('Aparell.count', -1) do
      delete aparell_url(@aparell)
    end

    assert_redirected_to aparells_url
  end
end
