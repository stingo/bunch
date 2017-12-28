class RenameVideoToVideourl < ActiveRecord::Migration[5.1]
  def change
  	rename_column :hows, :video, :videourl
  end
end
