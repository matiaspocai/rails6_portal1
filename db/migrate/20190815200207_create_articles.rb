class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :volanta, limit: 25
      t.string :titulo, limit: 120
      t.string :bajada
      t.string :autor, limit: 25
      t.text :cuerpo
      t.string :ubicacion, limit: 4
      t.string :seccion, limit: 25
      t.string :publicado, limit: 2

      t.timestamps
    end
  end
end
