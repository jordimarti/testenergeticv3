# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_10_211439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "aparells", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.integer "potencia"
    t.integer "hores_mensuals"
    t.integer "consum_mensual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "antiguitat"
    t.string "qualificacio_energetica"
  end

  create_table "certificacions", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.boolean "visible"
    t.decimal "emissions"
    t.decimal "demanda"
    t.string "lletra_emissions"
    t.string "lletra_demanda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climatitzacions", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "tipologia_acs"
    t.string "tipologia_calefaccio_1"
    t.string "tipologia_calefaccio_2"
    t.string "tipologia_refrigeracio"
    t.string "generacio"
    t.integer "percentatge_captadors_termics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "antiguitat_acs"
    t.integer "antiguitat_calefaccio_1"
    t.integer "antiguitat_calefaccio_2"
    t.integer "antiguitat_refrigeracio"
    t.integer "antiguitat_generacio"
  end

  create_table "coberta", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie"
    t.decimal "percentatge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cobertes", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie"
    t.decimal "percentatge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "transmitancia_coberta"
  end

  create_table "component_cobertes", force: :cascade do |t|
    t.integer "coberta_id"
    t.string "nom"
    t.decimal "conductivitat"
    t.decimal "gruix"
    t.decimal "resistencia_termica"
    t.integer "posicio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_murs", force: :cascade do |t|
    t.integer "mur_id"
    t.string "nom"
    t.decimal "conductivitat"
    t.decimal "gruix"
    t.decimal "resistencia_termica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posicio"
  end

  create_table "component_predefinit_murs", force: :cascade do |t|
    t.string "familia"
    t.string "nom"
    t.decimal "conductivitat"
    t.string "densitat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_predefinits", force: :cascade do |t|
    t.string "familia"
    t.string "nom"
    t.decimal "conductivitat"
    t.string "densitat"
    t.decimal "gruix"
    t.decimal "resistencia_termica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subfamilia"
    t.string "nom_ca"
    t.string "nom_es"
  end

  create_table "consum_globals", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.integer "consum_anual_electricitat"
    t.integer "consum_anual_gas"
    t.integer "consum_anual_gasoil"
    t.decimal "despesa_anual_electricitat"
    t.decimal "despesa_anual_gas"
    t.decimal "despesa_anual_gasoil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entitats", force: :cascade do |t|
    t.integer "user_id"
    t.string "ambit"
    t.integer "pare"
    t.string "tipus_via"
    t.string "nom_via"
    t.string "numero_via"
    t.string "bloc"
    t.string "codi_postal"
    t.string "poblacio"
    t.string "provincia"
    t.integer "any_construccio"
    t.decimal "superficie_util"
    t.string "nom_propietari"
    t.string "cognoms_propietari"
    t.string "tipus_identificacio_propietari"
    t.string "identificacio_propietari"
    t.string "email_propietari"
    t.string "telefon_propietari"
    t.string "adreca_propietari"
    t.string "codi_postal_propietari"
    t.string "poblacio_propietari"
    t.string "provincia_propietari"
    t.text "descripcio"
    t.string "destinacio"
    t.decimal "quota"
    t.string "nom"
    t.integer "altitud_municipi"
    t.string "regim_juridic"
    t.string "nom_representant"
    t.string "cognoms_representant"
    t.string "tipus_identificacio_representant"
    t.string "identificacio_representant"
    t.string "adreca_representant"
    t.string "codi_postal_representant"
    t.string "poblacio_representant"
    t.string "provincia_representant"
    t.string "telefon_representant"
    t.string "email_representant"
    t.string "nom_tecnic"
    t.string "cognoms_tecnic"
    t.string "tipus_identificacio_tecnic"
    t.string "identificacio_tecnic"
    t.string "titulacio_tecnic"
    t.string "colegi_tecnic"
    t.string "num_colegiat_tecnic"
    t.string "adreca_tecnic"
    t.string "codi_postal_tecnic"
    t.string "poblacio_tecnic"
    t.string "provincia_tecnic"
    t.string "telefon_tecnic"
    t.string "email_tecnic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipologia"
  end

  create_table "forat_predefinits", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "nom"
    t.text "descripcio"
    t.integer "numero_forats"
    t.string "tipus_marc"
    t.decimal "superficie_marc"
    t.decimal "transmitancia_marc"
    t.string "tipus_vidre"
    t.decimal "superficie_vidre"
    t.decimal "transmitancia_vidre"
    t.decimal "longitud_contacte_vidre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forats", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie_total"
    t.decimal "superficie_opaca"
    t.decimal "superficie_transparent"
    t.decimal "superficie_marc"
    t.decimal "transmitancia_opaca"
    t.decimal "transmitancia_transparent"
    t.decimal "transmitancia_marc"
    t.decimal "longitud_contacte_marc_vidre"
    t.decimal "longitud_contacte_marc_opac"
    t.decimal "transmitancia_linial_marc_vidre"
    t.decimal "transmitancia_linial_marc_opac"
    t.integer "numero"
    t.decimal "percentatge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipus_marc"
    t.string "tipus_vidre"
    t.decimal "transmitancia_global_forat"
  end

  create_table "habits", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lampades", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "tipologia"
    t.string "descripcio"
    t.integer "numero"
    t.integer "potencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hores_mensuals"
  end

  create_table "murs", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie"
    t.string "tipus_mur"
    t.decimal "percentatge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "transmitancia_mur"
  end

  create_table "proposta_predefinides", force: :cascade do |t|
    t.string "codi"
    t.string "mesura_ca"
    t.string "mesura_es"
    t.decimal "a_b3"
    t.decimal "a_c2"
    t.decimal "a_d1"
    t.decimal "a_d2"
    t.decimal "a_d3"
    t.decimal "a_e1"
    t.decimal "b_b3"
    t.decimal "b_c2"
    t.decimal "b_d1"
    t.decimal "b_d2"
    t.decimal "b_d3"
    t.decimal "b_e1"
    t.decimal "c_b3"
    t.decimal "c_c2"
    t.decimal "c_d1"
    t.decimal "c_d2"
    t.decimal "c_d3"
    t.decimal "c_e1"
    t.decimal "d_b3"
    t.decimal "d_c2"
    t.decimal "d_d1"
    t.decimal "d_d2"
    t.decimal "d_d3"
    t.decimal "d_e1"
    t.decimal "e_b3"
    t.decimal "e_c2"
    t.decimal "e_d1"
    t.decimal "e_d2"
    t.decimal "e_d3"
    t.decimal "e_e1"
    t.decimal "f_b3"
    t.decimal "f_c2"
    t.decimal "f_d1"
    t.decimal "f_d2"
    t.decimal "f_d3"
    t.decimal "f_e1"
    t.decimal "g_b3"
    t.decimal "g_c2"
    t.decimal "g_d1"
    t.decimal "g_d2"
    t.decimal "g_d3"
    t.decimal "g_e1"
    t.decimal "h_b3"
    t.decimal "h_c2"
    t.decimal "h_d1"
    t.decimal "h_d2"
    t.decimal "h_d3"
    t.decimal "h_e1"
    t.decimal "i_b3"
    t.decimal "i_c2"
    t.decimal "i_d1"
    t.decimal "i_d2"
    t.decimal "i_d3"
    t.decimal "i_e1"
    t.decimal "preu"
    t.string "tipus_proposta"
    t.text "descripcio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "propostes", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.decimal "cost_optimista"
    t.decimal "cost_pessimista"
    t.decimal "estalvi_optimista"
    t.decimal "estalvi_pessimista"
    t.decimal "roi_optimista"
    t.decimal "roi_pessimista"
    t.decimal "emissions_optimista"
    t.decimal "emissions_pessimista"
    t.date "data"
    t.string "mesura"
    t.text "descripcio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "data_any"
    t.integer "data_mes"
  end

  create_table "terres", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie"
    t.decimal "percentatge"
    t.decimal "transmitancia_terra"
    t.string "profunditat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "resistencia_termica_aillant"
    t.decimal "longitud_perimetre"
    t.decimal "ample_aillament"
    t.decimal "valor"
  end

  create_table "transmitancia_lloses", force: :cascade do |t|
    t.decimal "resistencia_termica_aillant"
    t.decimal "longitud_perimetre"
    t.decimal "ample_aillament"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
