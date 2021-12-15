class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buyers
  has_many :items
  has_many :comments

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/i.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/i.freeze

  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6 }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birth_date, presence: true
end
