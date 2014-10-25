class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.references :user, index: true
      t.money :amount
      t.integer :score, default: 0
      t.datetime :expires_at, null: false
      t.text :reason, null: false
      t.timestamps
    end
  end
end
