class ChangeNameColumnOnUser < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :first_name, :string)
    add_column(:users, :last_name, :string)
    add_column(:users, :email, :string)
    add_column(:users, :refresh_token, :string)
    remove_column(:users, :name, :string)
  end
end
