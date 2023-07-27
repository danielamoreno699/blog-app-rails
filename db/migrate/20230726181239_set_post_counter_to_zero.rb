class SetPostCounterToZero < ActiveRecord::Migration[7.0]
  def change
    User.update_all(post_counter: 0)
  end
end
