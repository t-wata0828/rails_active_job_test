class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: "名前"
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワード"
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
