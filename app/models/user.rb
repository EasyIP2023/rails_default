class User < ApplicationRecord

  has_many :user_roles
  has_many :roles, through: :user_roles

  scope :active, ->() { where(locked_at: nil) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  # Email regex
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validate :phone_length
  validates_presence_of :phone

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  private

    def phone_length
      errors.add(:phone, 'Phone # length must be 10 ex. 9998887777') if self.phone.length != 10
    end

end
