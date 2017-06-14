class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :entity_type
      t.string :entity_id
      t.string :entity_tags

      t.timestamps
    end
  end
end
