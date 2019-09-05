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

ActiveRecord::Schema.define(version: 2019_08_15_173905) do

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

  create_table "forats", force: :cascade do |t|
    t.integer "entitat_id"
    t.string "ambit"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie"
    t.integer "part_opaca"
    t.integer "part_transparent"
    t.decimal "percentatge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "transmitancia_part_opaca"
    t.decimal "transmitancia_part_transparent"
    t.string "nom_part_opaca"
    t.string "nom_part_transparent"
    t.integer "numero"
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
