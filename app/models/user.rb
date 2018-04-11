class User < ActiveRecord::Base
  has_many :goals
  has_many :categories, through: :goals
  has_many :tasks, through: :goals
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def uncompleted_tasks
    self.tasks.select do |task|
      if !task.completed
        task
      end
    end
  end

end
