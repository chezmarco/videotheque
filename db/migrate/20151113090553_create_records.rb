class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :nom, null: false, default: ""
      t.string :nomoriginal
      t.string :codage
      t.string :realisateur
      t.integer :annee
      t.string :nationalite
      t.string :genre
      t.string :duree
      t.string :propietaire
      t.integer :dateajout
      t.string :nbrecd
      t.string :idpret
      t.integer :datepret
      t.string :acteur
      t.string :resume
      t.string :img_small
      t.string :img_big
      t.string :note
      t.string :note2
      t.string :note3
      t.string :version
      t.string :pret
      t.string :reserv
    end

    add_index :records, :acteur
    add_index :records, :annee
    add_index :records, :genre
    add_index :records, :id
    add_index :records, :img_small
    add_index :records, :nationalite
    add_index :records, :nom
    add_index :records, :nomoriginal
    add_index :records, :realisateur
  end
end
