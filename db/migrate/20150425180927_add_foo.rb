class AddFoo < ActiveRecord::Migration

  def up
    create_table :foonits do |t|
      t.integer :fooperty_id, null: false
      t.string :name, null: false
      t.timestamps
    end
    create_table :fooperties do |t|
      t.timestamps
    end
    create_table :foo_orders do |t|
      t.timestamps
      t.integer :foonit_id
      t.integer :fooperty_id
    end

    add_foreign_key :foo_orders, :foonits
    add_foreign_key :foo_orders, :fooperties

    add_foreign_key :foonits, :fooperties

  end

  def down

    remove_foreign_key :foonits, :fooperties
    remove_foreign_key :foo_orders, :foonits
    remove_foreign_key :foo_orders, :fooperties

    drop_table :foo_orders
    drop_table :foonits
    drop_table :fooperties

  end

end

