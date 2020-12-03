class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.uuid :user_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
