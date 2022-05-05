class User < ApplicationRecord
  authenticates_with_sorcery!

  # 通常のバリデーション
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # 条件付きバリデーション
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
