class AddFinishedAtToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :finished_at, :datetime
  end
end
