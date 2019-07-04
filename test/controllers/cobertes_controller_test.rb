require 'test_helper'

class CobertesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coberta = cobertes(:one)
  end

  test "should get index" do
    get cobertes_url
    assert_response :success
  end

  test "should get new" do
    get new_coberta_url
    assert_response :success
  end

  test "should create coberta" do
    assert_difference('Coberta.count') do
      post cobertes_url, params: { coberta: { ambit: @coberta.ambit, descripcio: @coberta.descripcio, entitat_id: @coberta.entitat_id, nom: @coberta.nom, percentatge: @coberta.percentatge, superficie: @coberta.superficie } }
    end

    assert_redirected_to coberta_url(Coberta.last)
  end

  test "should show coberta" do
    get coberta_url(@coberta)
    assert_response :success
  end

  test "should get edit" do
    get edit_coberta_url(@coberta)
    assert_response :success
  end

  test "should update coberta" do
    patch coberta_url(@coberta), params: { coberta: { ambit: @coberta.ambit, descripcio: @coberta.descripcio, entitat_id: @coberta.entitat_id, nom: @coberta.nom, percentatge: @coberta.percentatge, superficie: @coberta.superficie } }
    assert_redirected_to coberta_url(@coberta)
  end

  test "should destroy coberta" do
    assert_difference('Coberta.count', -1) do
      delete coberta_url(@coberta)
    end

    assert_redirected_to cobertes_url
  end
end
