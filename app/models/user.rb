class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）であること'} do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'は全角であること' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
