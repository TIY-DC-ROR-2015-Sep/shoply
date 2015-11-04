class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases

  validates_uniqueness_of :api_key, if: 'api_key.present?'

  def self.find_for_api_token token
    User.find_by(api_key: token)
  end
end
