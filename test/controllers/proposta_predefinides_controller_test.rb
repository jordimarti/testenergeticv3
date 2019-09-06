require 'test_helper'

class PropostaPredefinidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposta_predefinida = proposta_predefinides(:one)
  end

  test "should get index" do
    get proposta_predefinides_url
    assert_response :success
  end

  test "should get new" do
    get new_proposta_predefinida_url
    assert_response :success
  end

  test "should create proposta_predefinida" do
    assert_difference('PropostaPredefinida.count') do
      post proposta_predefinides_url, params: { proposta_predefinida: { a-b3: @proposta_predefinida.a-b3, a-c2: @proposta_predefinida.a-c2, a-d1: @proposta_predefinida.a-d1, a-d2: @proposta_predefinida.a-d2, a-d3: @proposta_predefinida.a-d3, a-e1: @proposta_predefinida.a-e1, b-b3: @proposta_predefinida.b-b3, b-c2: @proposta_predefinida.b-c2, b-d1: @proposta_predefinida.b-d1, b-d2: @proposta_predefinida.b-d2, b-d3: @proposta_predefinida.b-d3, b-e1: @proposta_predefinida.b-e1, c-b3: @proposta_predefinida.c-b3, c-c2: @proposta_predefinida.c-c2, c-d1: @proposta_predefinida.c-d1, c-d2: @proposta_predefinida.c-d2, c-d3: @proposta_predefinida.c-d3, c-e1: @proposta_predefinida.c-e1, codi: @proposta_predefinida.codi, d-b3: @proposta_predefinida.d-b3, d-c2: @proposta_predefinida.d-c2, d-d1: @proposta_predefinida.d-d1, d-d2: @proposta_predefinida.d-d2, d-d3: @proposta_predefinida.d-d3, d-e1: @proposta_predefinida.d-e1, descripcio: @proposta_predefinida.descripcio, e-b3: @proposta_predefinida.e-b3, e-c2: @proposta_predefinida.e-c2, e-d1: @proposta_predefinida.e-d1, e-d2: @proposta_predefinida.e-d2, e-d3: @proposta_predefinida.e-d3, e-e1: @proposta_predefinida.e-e1, f-b3: @proposta_predefinida.f-b3, f-c2: @proposta_predefinida.f-c2, f-d1: @proposta_predefinida.f-d1, f-d2: @proposta_predefinida.f-d2, f-d3: @proposta_predefinida.f-d3, f-e1: @proposta_predefinida.f-e1, g-b3: @proposta_predefinida.g-b3, g-c2: @proposta_predefinida.g-c2, g-d1: @proposta_predefinida.g-d1, g-d2: @proposta_predefinida.g-d2, g-d3: @proposta_predefinida.g-d3, g-e1: @proposta_predefinida.g-e1, h-b3: @proposta_predefinida.h-b3, h-c2: @proposta_predefinida.h-c2, h-d1: @proposta_predefinida.h-d1, h-d2: @proposta_predefinida.h-d2, h-d3: @proposta_predefinida.h-d3, h-e1: @proposta_predefinida.h-e1, i-b3: @proposta_predefinida.i-b3, i-c2: @proposta_predefinida.i-c2, i-d1: @proposta_predefinida.i-d1, i-d2: @proposta_predefinida.i-d2, i-d3: @proposta_predefinida.i-d3, i-e1: @proposta_predefinida.i-e1, mesura: @proposta_predefinida.mesura, preu: @proposta_predefinida.preu, tipus_proposta: @proposta_predefinida.tipus_proposta } }
    end

    assert_redirected_to proposta_predefinida_url(PropostaPredefinida.last)
  end

  test "should show proposta_predefinida" do
    get proposta_predefinida_url(@proposta_predefinida)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposta_predefinida_url(@proposta_predefinida)
    assert_response :success
  end

  test "should update proposta_predefinida" do
    patch proposta_predefinida_url(@proposta_predefinida), params: { proposta_predefinida: { a-b3: @proposta_predefinida.a-b3, a-c2: @proposta_predefinida.a-c2, a-d1: @proposta_predefinida.a-d1, a-d2: @proposta_predefinida.a-d2, a-d3: @proposta_predefinida.a-d3, a-e1: @proposta_predefinida.a-e1, b-b3: @proposta_predefinida.b-b3, b-c2: @proposta_predefinida.b-c2, b-d1: @proposta_predefinida.b-d1, b-d2: @proposta_predefinida.b-d2, b-d3: @proposta_predefinida.b-d3, b-e1: @proposta_predefinida.b-e1, c-b3: @proposta_predefinida.c-b3, c-c2: @proposta_predefinida.c-c2, c-d1: @proposta_predefinida.c-d1, c-d2: @proposta_predefinida.c-d2, c-d3: @proposta_predefinida.c-d3, c-e1: @proposta_predefinida.c-e1, codi: @proposta_predefinida.codi, d-b3: @proposta_predefinida.d-b3, d-c2: @proposta_predefinida.d-c2, d-d1: @proposta_predefinida.d-d1, d-d2: @proposta_predefinida.d-d2, d-d3: @proposta_predefinida.d-d3, d-e1: @proposta_predefinida.d-e1, descripcio: @proposta_predefinida.descripcio, e-b3: @proposta_predefinida.e-b3, e-c2: @proposta_predefinida.e-c2, e-d1: @proposta_predefinida.e-d1, e-d2: @proposta_predefinida.e-d2, e-d3: @proposta_predefinida.e-d3, e-e1: @proposta_predefinida.e-e1, f-b3: @proposta_predefinida.f-b3, f-c2: @proposta_predefinida.f-c2, f-d1: @proposta_predefinida.f-d1, f-d2: @proposta_predefinida.f-d2, f-d3: @proposta_predefinida.f-d3, f-e1: @proposta_predefinida.f-e1, g-b3: @proposta_predefinida.g-b3, g-c2: @proposta_predefinida.g-c2, g-d1: @proposta_predefinida.g-d1, g-d2: @proposta_predefinida.g-d2, g-d3: @proposta_predefinida.g-d3, g-e1: @proposta_predefinida.g-e1, h-b3: @proposta_predefinida.h-b3, h-c2: @proposta_predefinida.h-c2, h-d1: @proposta_predefinida.h-d1, h-d2: @proposta_predefinida.h-d2, h-d3: @proposta_predefinida.h-d3, h-e1: @proposta_predefinida.h-e1, i-b3: @proposta_predefinida.i-b3, i-c2: @proposta_predefinida.i-c2, i-d1: @proposta_predefinida.i-d1, i-d2: @proposta_predefinida.i-d2, i-d3: @proposta_predefinida.i-d3, i-e1: @proposta_predefinida.i-e1, mesura: @proposta_predefinida.mesura, preu: @proposta_predefinida.preu, tipus_proposta: @proposta_predefinida.tipus_proposta } }
    assert_redirected_to proposta_predefinida_url(@proposta_predefinida)
  end

  test "should destroy proposta_predefinida" do
    assert_difference('PropostaPredefinida.count', -1) do
      delete proposta_predefinida_url(@proposta_predefinida)
    end

    assert_redirected_to proposta_predefinides_url
  end
end
