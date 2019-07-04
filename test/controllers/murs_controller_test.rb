require 'test_helper'

class MursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mur = murs(:one)
  end

  test "should get index" do
    get murs_url
    assert_response :success
  end

  test "should get new" do
    get new_mur_url
    assert_response :success
  end

  test "should create mur" do
    assert_difference('Mur.count') do
      post murs_url, params: { mur: { ambit: @mur.ambit, descripcio: @mur.descripcio, entitat_id: @mur.entitat_id, nom: @mur.nom, percentatge: @mur.percentatge, superficie: @mur.superficie, tipus_mur: @mur.tipus_mur } }
    end

    assert_redirected_to mur_url(Mur.last)
  end

  test "should show mur" do
    get mur_url(@mur)
    assert_response :success
  end

  test "should get edit" do
    get edit_mur_url(@mur)
    assert_response :success
  end

  test "should update mur" do
    patch mur_url(@mur), params: { mur: { ambit: @mur.ambit, descripcio: @mur.descripcio, entitat_id: @mur.entitat_id, nom: @mur.nom, percentatge: @mur.percentatge, superficie: @mur.superficie, tipus_mur: @mur.tipus_mur } }
    assert_redirected_to mur_url(@mur)
  end

  test "should destroy mur" do
    assert_difference('Mur.count', -1) do
      delete mur_url(@mur)
    end

    assert_redirected_to murs_url
  end
end
