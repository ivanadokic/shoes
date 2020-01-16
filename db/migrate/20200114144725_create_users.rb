class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest #store encripted passwords
                                #require gem bcrypt
    end
  end
end
