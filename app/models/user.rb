class User < ActiveRecord::Base

  before_create :set_required_columns
  attr_accessor :confirm_password

  validates :username, presence: {message: 'Username is mandatory'}
  validates :username, uniqueness: {message: 'Oops! This username has already been taken. Please try another'}
  validates :first_name, presence: {message: 'First Name is mandatory'}
  validates :last_name, presence: {message: 'Last Name is mandatory'}
  validates :email, presence: {message: 'Email is mandatory'}
  validates :email, uniqueness: {message: 'Oops! There is an account with this email. Please try to login'}
  validates :password, presence: { message: 'is forgotten.' }, confirmation: {message: 'Password and confirm password are mismatching'}
  validates :password_confirmation, presence: { message: 'Confirm Password is mandatory.' }, confirmation: true

  private

  def set_required_columns
    self.auth = Digest::MD5.hexdigest(self.email)
  end
end
