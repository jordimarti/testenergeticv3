require 'test_helper'

class ForatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forat = forats(:one)
  end

  test "should get index" do
    get forats_url
    assert_response :success
  end

  test "should get new" do
    get new_forat_url
    assert_response :success
  end

  test "should create forat" do
    assert_difference('Forat.count') do
      post forats_url, params: { forat: { ambit: @forat.ambit, descripcio: @forat.descripcio, entitat_id: @forat.entitat_id, nom: @forat.nom, part_opaca: @forat.part_opaca, part_transparent: @forat.part_transparent, percentatge: @forat.percentatge, superficie: @forat.superficie } }
    end

    assert_redirected_to forat_url(Forat.last)
  end

  test "should show forat" do
    get forat_url(@forat)
    assert_response :success
  end

  test "should get edit" do
    get edit_forat_url(@forat)
    assert_response :success
  end

  test "should update forat" do
    patch forat_url(@forat), params: { forat: { ambit: @forat.ambit, descripcio: @forat.descripcio, entitat_id: @forat.entitat_id, nom: @forat.nom, part_opaca: @forat.part_opaca, part_transparent: @forat.part_transparent, percentatge: @forat.percentatge, superficie: @forat.superficie } }
    assert_redirected_to forat_url(@forat)
  end

  test "should destroy forat" do
    assert_difference('Forat.count', -1) do
      delete forat_url(@forat)
    end

    assert_redirected_to forats_url
  end
end
