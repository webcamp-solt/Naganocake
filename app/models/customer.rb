class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :zip_code,  length: { minimum: 7, maximum: 7}, format: { with: /^[0-9]+$/, multiline: true}
  validates :phone_number, format: { with: /^[0-9]+$/, multiline: true}

  KATAKANA_REGEXP = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, format: { with: KATAKANA_REGEXP, multiline: true }
  validates :last_name_kana, format: { with: KATAKANA_REGEXP, multiline: true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true



  def full_name
    self.last_name + "　" + self.first_name
  end

  def full_name_kana
    self.last_name_kana + "　" + self.first_name_kana
  end
end
