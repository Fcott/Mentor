class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

validates :username, presence: true, length: {maximum: 50}
validates :username, uniqueness: { case_sensitive: false }
has_many :stories, dependent: :destroy
has_many :savings, -> { order(created_at: :desc) }
has_many :saved_stories, through: :savings, source: :story
has_many :user_jobs
has_many :job_categories, through: :user_jobs
has_one :profile


  def self.from_omniauth(auth)
   user = User.where(:email => auth.info.email).first
   if user
     return user
   else
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.username = auth.info.name
       user.provider = auth.provider
       user.uid = auth.uid
       user.email = auth.info.email
       user.image = auth.info.image
       user.password = Devise.friendly_token[0,20]
     end
   end
  end

  def saving?(story)
    savings.find_by(story_id: story.id)
  end

  def saving!(story)
    savings.create!(story_id: story.id)
  end

  def unsaving!(story)
    savings.find_by(story_id: story.id).destroy
  end

end
