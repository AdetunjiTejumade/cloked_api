class CreateAnonMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :anon_messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :anon_messages, :content
  end
end
