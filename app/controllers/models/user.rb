class User < ApplicationRecord
  has_many :shifts
  attr_writer :login

  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates_uniqueness_of :email, on: :create, message: 'must be unique'
  # only allow letter, number, underscore and punctuation.
  validates_format_of :user_name, with: /^[a-zA-Z0-9_.]*$/, multiline: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  def login
    @login || user_name || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(user_name) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
