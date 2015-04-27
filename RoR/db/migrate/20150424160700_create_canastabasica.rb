# encoding: UTF-8
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

class CreateDatabase < ActiveRecord::Migration
  def self.up
    ActiveRecord::Schema.define(version: 0) do

      create_table "categoria", primary_key: "id", force: :cascade do |t|
        t.string  "nombre",      limit: 255
        t.string  "imagen",      limit: 255
        t.text    "descripcion", limit: 4294967295
        t.string  "color",       limit: 50
        t.boolean "activa",      limit: 1,          default: false
      end

      create_table "empresa", primary_key: "id", force: :cascade do |t|
        t.string "nombre",      limit: 255,        null: false
        t.text   "descripcion", limit: 4294967295
        t.string "direccion",   limit: 255
      end

      create_table "producto", primary_key: "id", force: :cascade do |t|
        t.string  "nombre",                 limit: 255
        t.string  "precio",                 limit: 45
        t.string  "codigoDeBarras",         limit: 45
        t.string  "peso",                   limit: 45
        t.boolean "tienePeso",              limit: 1,   default: false, null: false
        t.string  "volumen",                limit: 45
        t.boolean "tieneVolumen",           limit: 1,                   null: false
        t.string  "numeroDeProductos",      limit: 45
        t.boolean "tieneNumeroDeProductos", limit: 1,                   null: false
        t.string  "numeroDePaquetes",       limit: 45
        t.boolean "tieneNumeroDePaquetes",  limit: 1,                   null: false
        t.integer "id",              limit: 4,                   null: false
        t.integer "id",            limit: 4,                   null: false
      end

      add_index "producto", ["codigoDeBarras"], name: "codigoDeBarras_UNIQUE", unique: true, using: :btree
      add_index "producto", ["id"], name: "fk_Producto_Categoria1_idx", using: :btree
      add_index "producto", ["id"], name: "fk_Producto_Empresa_idx", using: :btree

      create_table "registro", primary_key: "id", force: :cascade do |t|
        t.decimal  "cantidad",              precision: 12, scale: 2, default: 0.0
        t.datetime "time"
        t.integer  "id",  limit: 4,                                         null: false
        t.string   "longitud",   limit: 45
        t.string   "latitud",    limit: 45
        t.string   "altitud",    limit: 45
        t.integer  "id", limit: 4,                                         null: false
        t.decimal  "precio",                precision: 12, scale: 2
        t.integer  "puntuacion", limit: 4
        t.integer  "id",   limit: 4,                                         null: false
      end

      add_index "registro", ["id"], name: "fk_Registro_Producto1_idx", using: :btree
      add_index "registro", ["id"], name: "fk_Registro_Tienda1_idx", using: :btree
      add_index "registro", ["id"], name: "fk_Registro_Usuario1_idx", using: :btree

      create_table "tienda", primary_key: "id", force: :cascade do |t|
        t.string "nombre",   limit: 255, null: false
        t.string "longitud", limit: 45,  null: false
        t.string "altitud",  limit: 45,  null: false
        t.string "latitud",  limit: 45,  null: false
        t.string "imagen",   limit: 45
        t.string "sucursal", limit: 45,  null: false
      end

      create_table "usuario", primary_key: "id", force: :cascade do |t|
        t.string "nombre",   limit: 255, null: false
        t.string "apellido", limit: 255
        t.string "email",    limit: 255, null: false
        t.string "password", limit: 255
        t.string "color",    limit: 6
        t.string "image",    limit: 255
        t.string "rfc",      limit: 45
        t.string "curp",     limit: 45
        t.string "avatar",   limit: 45
      end

      add_foreign_key "producto", "categoria", column: "id", primary_key: "id", name: "fk_Producto_Categoria1"
      add_foreign_key "producto", "empresa", column: "id", primary_key: "id", name: "fk_Producto_Empresa"
      add_foreign_key "registro", "producto", column: "id", primary_key: "id", name: "fk_Registro_Producto1"
      add_foreign_key "registro", "tienda", column: "id", primary_key: "id", name: "fk_Registro_Tienda1"
      add_foreign_key "registro", "usuario", column: "id", primary_key: "id", name: "fk_Registro_Usuario1"
    end

  end
 
  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end

