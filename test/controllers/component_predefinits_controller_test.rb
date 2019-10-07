require 'test_helper'

class ComponentPredefinitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_predefinit = component_predefinits(:one)
  end

  test "should get index" do
    get component_predefinits_url
    assert_response :success
  end

  test "should get new" do
    get new_component_predefinit_url
    assert_response :success
  end

  test "should create component_predefinit" do
    assert_difference('ComponentPredefinit.count') do
      post component_predefinits_url, params: { component_predefinit: { conductivitat: @component_predefinit.conductivitat, densitat: @component_predefinit.densitat, familia: @component_predefinit.familia, gruix: @component_predefinit.gruix, nom: @component_predefinit.nom, resistencia_termica: @component_predefinit.resistencia_termica } }
    end

    assert_redirected_to component_predefinit_url(ComponentPredefinit.last)
  end

  test "should show component_predefinit" do
    get component_predefinit_url(@component_predefinit)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_predefinit_url(@component_predefinit)
    assert_response :success
  end

  test "should update component_predefinit" do
    patch component_predefinit_url(@component_predefinit), params: { component_predefinit: { conductivitat: @component_predefinit.conductivitat, densitat: @component_predefinit.densitat, familia: @component_predefinit.familia, gruix: @component_predefinit.gruix, nom: @component_predefinit.nom, resistencia_termica: @component_predefinit.resistencia_termica } }
    assert_redirected_to component_predefinit_url(@component_predefinit)
  end

  test "should destroy component_predefinit" do
    assert_difference('ComponentPredefinit.count', -1) do
      delete component_predefinit_url(@component_predefinit)
    end

    assert_redirected_to component_predefinits_url
  end
end
