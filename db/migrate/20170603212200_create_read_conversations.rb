class CreateReadConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :read_conversations do |t|
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true
      t.datetime :read_at

      t.timestamps
    end
  end
end
