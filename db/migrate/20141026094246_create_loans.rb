class CreateLoans < ActiveRecord::Migration
  def change

    # add_reference :post, :author, references: :users

    create_table :loans do |t|
      t.references :giver, index: true
      t.references :taker, index: true
      t.references :inquiry

      t.integer :option, default: 0
      t.integer :insured, default: 0
      t.timestamps
    end
  end
end
