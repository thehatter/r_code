# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username

  attr_accessor :login
  attr_accessor :unhashed_password

  has_many :sites

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.generate_login
    login = [('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a].reduce(:+).sample(8).join
  end

  def self.generate_password
    password = [('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a].reduce(:+).sample(10).join
  end

  def self.generate_email
    email = "#{[('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a].reduce(:+).sample(8).join}@random.by"
  end
end

