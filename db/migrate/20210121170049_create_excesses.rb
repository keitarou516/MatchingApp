class CreateExcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :excesses do |t|
      t.string  :name
      t.string  :phone
      t.text    :mail
      t.date    :start_date
      t.date    :end_date
      t.integer :resource
      t.text    :text
      t.integer :company_id
      t.timestamps
    end
  end
end
