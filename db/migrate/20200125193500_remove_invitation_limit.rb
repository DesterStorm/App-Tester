class RemoveInvitationLimit < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :invitation_limit, :integer
  end
end
