class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string  :name
      t.text    :address
      t.string  :phone
      t.text    :mail
      t.date    :start_date
      t.date    :end_date
      t.integer :resource
      t.integer :wage
      t.text    :text
      t.integer :company_id
      t.timestamps
    end
  end
end
