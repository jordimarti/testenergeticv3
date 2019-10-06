require 'test_helper'

class ComponentPredefinitMursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_predefinit_mur = component_predefinit_murs(:one)
  end

  test "should get index" do
    get component_predefinit_murs_url
    assert_response :success
  end

  test "should get new" do
    get new_component_predefinit_mur_url
    assert_response :success
  end

  test "should create component_predefinit_mur" do
    assert_difference('ComponentPredefinitMur.count') do
      post component_predefinit_murs_url, params: { component_predefinit_mur: { conductivitat: @component_predefinit_mur.conductivitat, densitat: @component_predefinit_mur.densitat, familia: @component_predefinit_mur.familia, nom: @component_predefinit_mur.nom } }
    end

    assert_redirected_to component_predefinit_mur_url(ComponentPredefinitMur.last)
  end

  test "should show component_predefinit_mur" do
    get component_predefinit_mur_url(@component_predefinit_mur)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_predefinit_mur_url(@component_predefinit_mur)
    assert_response :success
  end

  test "should update component_predefinit_mur" do
    patch component_predefinit_mur_url(@component_predefinit_mur), params: { component_predefinit_mur: { conductivitat: @component_predefinit_mur.conductivitat, densitat: @component_predefinit_mur.densitat, familia: @component_predefinit_mur.familia, nom: @component_predefinit_mur.nom } }
    assert_redirected_to component_predefinit_mur_url(@component_predefinit_mur)
  end

  test "should destroy component_predefinit_mur" do
    assert_difference('ComponentPredefinitMur.count', -1) do
      delete component_predefinit_mur_url(@component_predefinit_mur)
    end

    assert_redirected_to component_predefinit_murs_url
  end
end
