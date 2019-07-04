require 'test_helper'

class ComponentMursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_mur = component_murs(:one)
  end

  test "should get index" do
    get component_murs_url
    assert_response :success
  end

  test "should get new" do
    get new_component_mur_url
    assert_response :success
  end

  test "should create component_mur" do
    assert_difference('ComponentMur.count') do
      post component_murs_url, params: { component_mur: { conductivitat: @component_mur.conductivitat, gruix: @component_mur.gruix, mur_id: @component_mur.mur_id, nom: @component_mur.nom, resistencia_termica: @component_mur.resistencia_termica } }
    end

    assert_redirected_to component_mur_url(ComponentMur.last)
  end

  test "should show component_mur" do
    get component_mur_url(@component_mur)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_mur_url(@component_mur)
    assert_response :success
  end

  test "should update component_mur" do
    patch component_mur_url(@component_mur), params: { component_mur: { conductivitat: @component_mur.conductivitat, gruix: @component_mur.gruix, mur_id: @component_mur.mur_id, nom: @component_mur.nom, resistencia_termica: @component_mur.resistencia_termica } }
    assert_redirected_to component_mur_url(@component_mur)
  end

  test "should destroy component_mur" do
    assert_difference('ComponentMur.count', -1) do
      delete component_mur_url(@component_mur)
    end

    assert_redirected_to component_murs_url
  end
end
