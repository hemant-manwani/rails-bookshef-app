class CreateAdminSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_sessions do |t|

      t.timestamps
    end
  end
end
