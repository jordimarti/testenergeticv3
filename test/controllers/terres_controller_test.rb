require 'test_helper'

class TerresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @terra = terres(:one)
  end

  test "should get index" do
    get terres_url
    assert_response :success
  end

  test "should get new" do
    get new_terra_url
    assert_response :success
  end

  test "should create terra" do
    assert_difference('Terra.count') do
      post terres_url, params: { terra: { ambit: @terra.ambit, descripcio: @terra.descripcio, entitat_id: @terra.entitat_id, nom: @terra.nom, percentatge: @terra.percentatge, profunditat: @terra.profunditat, superficie: @terra.superficie, transmitancia_terra: @terra.transmitancia_terra } }
    end

    assert_redirected_to terra_url(Terra.last)
  end

  test "should show terra" do
    get terra_url(@terra)
    assert_response :success
  end

  test "should get edit" do
    get edit_terra_url(@terra)
    assert_response :success
  end

  test "should update terra" do
    patch terra_url(@terra), params: { terra: { ambit: @terra.ambit, descripcio: @terra.descripcio, entitat_id: @terra.entitat_id, nom: @terra.nom, percentatge: @terra.percentatge, profunditat: @terra.profunditat, superficie: @terra.superficie, transmitancia_terra: @terra.transmitancia_terra } }
    assert_redirected_to terra_url(@terra)
  end

  test "should destroy terra" do
    assert_difference('Terra.count', -1) do
      delete terra_url(@terra)
    end

    assert_redirected_to terres_url
  end
end
