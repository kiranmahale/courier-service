class AddSenderAndRecipientToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :recipient_id, :integer
    add_column :orders, :sender_id, :integer

    add_index :orders, :recipient_id
    add_index :orders, :sender_id
  end
end
