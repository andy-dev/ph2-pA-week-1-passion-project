class CreateNotes < ActiveRecord::Migration
  def change
    create_table    :notes do |t|
      t.string      :description
      t.references  :user
      t.references  :view

      t.timestamps
    end
  end
end
