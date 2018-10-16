class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_numericality_of :no_phone, :message=>"Error"
  validates_numericality_of :bank_account, :message=>"Error"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :claims, dependent: :destroy

  def self.approver_profile
  	user_email = Setting.v('approver')
  	if user_email
  		f = Staff.find_by(email: user_email).id
  	end

  	return f
  end

  def self.verifier_profile
  	user_email = Setting.v('verifier')
  	if user_email
  		f = Staff.find_by(email: user_email).id
  	end

  	return f
  end
end