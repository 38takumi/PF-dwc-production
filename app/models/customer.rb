class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :goals, dependent: :destroy
  # has_many :goal_comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }

  validates :introduction, length: { maximum: 50 }


  # プロフィール画像用
  has_one_attached :profile_image
  #プロフィール画像用 deviseに入ってるかも
  # Refile用
  # attachment :profile_image



  # 画像のタイプ（拡張子）にバリデーションを実装する
  validate :image_type
  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpeg image/png'))
  # image.purge # Rails6では、この1行は必要ない
  errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください') end
  end
end
