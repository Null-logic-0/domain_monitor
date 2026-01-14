class User < ApplicationRecord
	has_many :sessions, dependent: :destroy
	has_many :domains, dependent: :destroy

	alias_attribute :email, :email_address
	has_secure_password
	normalizes :email_address, with: -> { it.strip.downcase }
	pay_customer default_payment_processor: :stripe

	validates :email_address, presence: true, uniqueness: true
	validates :password, length: { minimum: 8 }, on: :create

end
