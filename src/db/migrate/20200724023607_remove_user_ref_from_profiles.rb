class RemoveUserRefFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_reference :profiles, :user, null: false, foreign_key: true
  end
end
