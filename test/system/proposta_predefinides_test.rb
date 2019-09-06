require "application_system_test_case"

class PropostaPredefinidesTest < ApplicationSystemTestCase
  setup do
    @proposta_predefinida = proposta_predefinides(:one)
  end

  test "visiting the index" do
    visit proposta_predefinides_url
    assert_selector "h1", text: "Proposta Predefinides"
  end

  test "creating a Proposta predefinida" do
    visit proposta_predefinides_url
    click_on "New Proposta Predefinida"

    fill_in "A-b3", with: @proposta_predefinida.a-b3
    fill_in "A-c2", with: @proposta_predefinida.a-c2
    fill_in "A-d1", with: @proposta_predefinida.a-d1
    fill_in "A-d2", with: @proposta_predefinida.a-d2
    fill_in "A-d3", with: @proposta_predefinida.a-d3
    fill_in "A-e1", with: @proposta_predefinida.a-e1
    fill_in "B-b3", with: @proposta_predefinida.b-b3
    fill_in "B-c2", with: @proposta_predefinida.b-c2
    fill_in "B-d1", with: @proposta_predefinida.b-d1
    fill_in "B-d2", with: @proposta_predefinida.b-d2
    fill_in "B-d3", with: @proposta_predefinida.b-d3
    fill_in "B-e1", with: @proposta_predefinida.b-e1
    fill_in "C-b3", with: @proposta_predefinida.c-b3
    fill_in "C-c2", with: @proposta_predefinida.c-c2
    fill_in "C-d1", with: @proposta_predefinida.c-d1
    fill_in "C-d2", with: @proposta_predefinida.c-d2
    fill_in "C-d3", with: @proposta_predefinida.c-d3
    fill_in "C-e1", with: @proposta_predefinida.c-e1
    fill_in "Codi", with: @proposta_predefinida.codi
    fill_in "D-b3", with: @proposta_predefinida.d-b3
    fill_in "D-c2", with: @proposta_predefinida.d-c2
    fill_in "D-d1", with: @proposta_predefinida.d-d1
    fill_in "D-d2", with: @proposta_predefinida.d-d2
    fill_in "D-d3", with: @proposta_predefinida.d-d3
    fill_in "D-e1", with: @proposta_predefinida.d-e1
    fill_in "Descripcio", with: @proposta_predefinida.descripcio
    fill_in "E-b3", with: @proposta_predefinida.e-b3
    fill_in "E-c2", with: @proposta_predefinida.e-c2
    fill_in "E-d1", with: @proposta_predefinida.e-d1
    fill_in "E-d2", with: @proposta_predefinida.e-d2
    fill_in "E-d3", with: @proposta_predefinida.e-d3
    fill_in "E-e1", with: @proposta_predefinida.e-e1
    fill_in "F-b3", with: @proposta_predefinida.f-b3
    fill_in "F-c2", with: @proposta_predefinida.f-c2
    fill_in "F-d1", with: @proposta_predefinida.f-d1
    fill_in "F-d2", with: @proposta_predefinida.f-d2
    fill_in "F-d3", with: @proposta_predefinida.f-d3
    fill_in "F-e1", with: @proposta_predefinida.f-e1
    fill_in "G-b3", with: @proposta_predefinida.g-b3
    fill_in "G-c2", with: @proposta_predefinida.g-c2
    fill_in "G-d1", with: @proposta_predefinida.g-d1
    fill_in "G-d2", with: @proposta_predefinida.g-d2
    fill_in "G-d3", with: @proposta_predefinida.g-d3
    fill_in "G-e1", with: @proposta_predefinida.g-e1
    fill_in "H-b3", with: @proposta_predefinida.h-b3
    fill_in "H-c2", with: @proposta_predefinida.h-c2
    fill_in "H-d1", with: @proposta_predefinida.h-d1
    fill_in "H-d2", with: @proposta_predefinida.h-d2
    fill_in "H-d3", with: @proposta_predefinida.h-d3
    fill_in "H-e1", with: @proposta_predefinida.h-e1
    fill_in "I-b3", with: @proposta_predefinida.i-b3
    fill_in "I-c2", with: @proposta_predefinida.i-c2
    fill_in "I-d1", with: @proposta_predefinida.i-d1
    fill_in "I-d2", with: @proposta_predefinida.i-d2
    fill_in "I-d3", with: @proposta_predefinida.i-d3
    fill_in "I-e1", with: @proposta_predefinida.i-e1
    fill_in "Mesura", with: @proposta_predefinida.mesura
    fill_in "Preu", with: @proposta_predefinida.preu
    fill_in "Tipus proposta", with: @proposta_predefinida.tipus_proposta
    click_on "Create Proposta predefinida"

    assert_text "Proposta predefinida was successfully created"
    click_on "Back"
  end

  test "updating a Proposta predefinida" do
    visit proposta_predefinides_url
    click_on "Edit", match: :first

    fill_in "A-b3", with: @proposta_predefinida.a-b3
    fill_in "A-c2", with: @proposta_predefinida.a-c2
    fill_in "A-d1", with: @proposta_predefinida.a-d1
    fill_in "A-d2", with: @proposta_predefinida.a-d2
    fill_in "A-d3", with: @proposta_predefinida.a-d3
    fill_in "A-e1", with: @proposta_predefinida.a-e1
    fill_in "B-b3", with: @proposta_predefinida.b-b3
    fill_in "B-c2", with: @proposta_predefinida.b-c2
    fill_in "B-d1", with: @proposta_predefinida.b-d1
    fill_in "B-d2", with: @proposta_predefinida.b-d2
    fill_in "B-d3", with: @proposta_predefinida.b-d3
    fill_in "B-e1", with: @proposta_predefinida.b-e1
    fill_in "C-b3", with: @proposta_predefinida.c-b3
    fill_in "C-c2", with: @proposta_predefinida.c-c2
    fill_in "C-d1", with: @proposta_predefinida.c-d1
    fill_in "C-d2", with: @proposta_predefinida.c-d2
    fill_in "C-d3", with: @proposta_predefinida.c-d3
    fill_in "C-e1", with: @proposta_predefinida.c-e1
    fill_in "Codi", with: @proposta_predefinida.codi
    fill_in "D-b3", with: @proposta_predefinida.d-b3
    fill_in "D-c2", with: @proposta_predefinida.d-c2
    fill_in "D-d1", with: @proposta_predefinida.d-d1
    fill_in "D-d2", with: @proposta_predefinida.d-d2
    fill_in "D-d3", with: @proposta_predefinida.d-d3
    fill_in "D-e1", with: @proposta_predefinida.d-e1
    fill_in "Descripcio", with: @proposta_predefinida.descripcio
    fill_in "E-b3", with: @proposta_predefinida.e-b3
    fill_in "E-c2", with: @proposta_predefinida.e-c2
    fill_in "E-d1", with: @proposta_predefinida.e-d1
    fill_in "E-d2", with: @proposta_predefinida.e-d2
    fill_in "E-d3", with: @proposta_predefinida.e-d3
    fill_in "E-e1", with: @proposta_predefinida.e-e1
    fill_in "F-b3", with: @proposta_predefinida.f-b3
    fill_in "F-c2", with: @proposta_predefinida.f-c2
    fill_in "F-d1", with: @proposta_predefinida.f-d1
    fill_in "F-d2", with: @proposta_predefinida.f-d2
    fill_in "F-d3", with: @proposta_predefinida.f-d3
    fill_in "F-e1", with: @proposta_predefinida.f-e1
    fill_in "G-b3", with: @proposta_predefinida.g-b3
    fill_in "G-c2", with: @proposta_predefinida.g-c2
    fill_in "G-d1", with: @proposta_predefinida.g-d1
    fill_in "G-d2", with: @proposta_predefinida.g-d2
    fill_in "G-d3", with: @proposta_predefinida.g-d3
    fill_in "G-e1", with: @proposta_predefinida.g-e1
    fill_in "H-b3", with: @proposta_predefinida.h-b3
    fill_in "H-c2", with: @proposta_predefinida.h-c2
    fill_in "H-d1", with: @proposta_predefinida.h-d1
    fill_in "H-d2", with: @proposta_predefinida.h-d2
    fill_in "H-d3", with: @proposta_predefinida.h-d3
    fill_in "H-e1", with: @proposta_predefinida.h-e1
    fill_in "I-b3", with: @proposta_predefinida.i-b3
    fill_in "I-c2", with: @proposta_predefinida.i-c2
    fill_in "I-d1", with: @proposta_predefinida.i-d1
    fill_in "I-d2", with: @proposta_predefinida.i-d2
    fill_in "I-d3", with: @proposta_predefinida.i-d3
    fill_in "I-e1", with: @proposta_predefinida.i-e1
    fill_in "Mesura", with: @proposta_predefinida.mesura
    fill_in "Preu", with: @proposta_predefinida.preu
    fill_in "Tipus proposta", with: @proposta_predefinida.tipus_proposta
    click_on "Update Proposta predefinida"

    assert_text "Proposta predefinida was successfully updated"
    click_on "Back"
  end

  test "destroying a Proposta predefinida" do
    visit proposta_predefinides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proposta predefinida was successfully destroyed"
  end
end
