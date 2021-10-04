class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :goal_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy


  #followingについて
  #「class_name: "Relationship"」は省略可能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #与フォロー関係を通じて参照→follower_idをフォローしている人　定義したのでfollowingsはモデルのように”.followings”とかで使える
  has_many :followings, through: :relationships, source: :followed
  #followingについてここまで

  #followerについて
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #被フォロー関係を通じて参照→followed_idをフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #followerについてここまで

  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end


  # 検索機能　ここから
  def self.search(search,word)
    if search == "forward_match"
      @customer = Customer.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("name LIKE?","%#{word}")
    elsif search == "perfect_match"
      @customer = Customer.where("#{word}")
      @customer = Customer.where(name: word)
    elsif search == "partial_match"
      @customer = Customer.where("name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end
  # 検索機能　ここまで


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
  validate :image_type, if: :was_attached?
  validate :file_size, if: :was_attached?

  private

  def image_type
    if !profile_image.blob.content_type.in?(%('image/jpeg image/png'))
      profile_image.purge # Rails6では、この1行は必要ない
      errors.add(:profile_image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

  def was_attached?
    self.profile_image.attached?
  end

  def file_size
    # images.each do |image|
      if profile_image.blob.byte_size > 2.megabytes
        errors.add(:profile_image, 'は 2MB 以下のファイルを選択してください')
      end
    # end
  end
end