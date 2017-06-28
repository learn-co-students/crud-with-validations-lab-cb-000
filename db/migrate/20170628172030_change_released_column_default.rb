class ChangeReleasedColumnDefault < ActiveRecord::Migration
  def Change
    change_column_default(:songs, :released, true)
  end
end
