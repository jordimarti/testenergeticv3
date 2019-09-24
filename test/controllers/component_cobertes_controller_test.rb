require 'test_helper'

class ComponentCobertesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_coberta = component_cobertes(:one)
  end

  test "should get index" do
    get component_cobertes_url
    assert_response :success
  end

  test "should get new" do
    get new_component_coberta_url
    assert_response :success
  end

  test "should create component_coberta" do
    assert_difference('ComponentCoberta.count') do
      post component_cobertes_url, params: { component_coberta: { coberta_id: @component_coberta.coberta_id, conductivitat: @component_coberta.conductivitat, gruix: @component_coberta.gruix, nom: @component_coberta.nom, posicio: @component_coberta.posicio, resistencia_termica: @component_coberta.resistencia_termica } }
    end

    assert_redirected_to component_coberta_url(ComponentCoberta.last)
  end

  test "should show component_coberta" do
    get component_coberta_url(@component_coberta)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_coberta_url(@component_coberta)
    assert_response :success
  end

  test "should update component_coberta" do
    patch component_coberta_url(@component_coberta), params: { component_coberta: { coberta_id: @component_coberta.coberta_id, conductivitat: @component_coberta.conductivitat, gruix: @component_coberta.gruix, nom: @component_coberta.nom, posicio: @component_coberta.posicio, resistencia_termica: @component_coberta.resistencia_termica } }
    assert_redirected_to component_coberta_url(@component_coberta)
  end

  test "should destroy component_coberta" do
    assert_difference('ComponentCoberta.count', -1) do
      delete component_coberta_url(@component_coberta)
    end

    assert_redirected_to component_cobertes_url
  end
end
