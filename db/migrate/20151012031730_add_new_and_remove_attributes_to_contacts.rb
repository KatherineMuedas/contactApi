class AddNewAndRemoveAttributesToContacts < ActiveRecord::Migration
  def up
    remove_columns :contacts, :company
    add_column :contacts, :phone, :string
    add_column :contacts, :birthday, :date
    add_column :contacts, :relationship, :string
  end
  def down
    add_columns :contacts, :company, :string
    remove_column :contacts, :phone
    remove_column :contacts, :birthday
    remove_column :contacts, :relationship
  end
end
