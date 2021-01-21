class User < ApplicationRecord

  attr_accessor :company_key

  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:email, :company_key]

  #validation
  before_validation :company_key_to_id, if: :has_company_key?

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    company_key = conditions.delete(:company_key)
    company_id = Company.where(name: company_key).first
    email = conditions.delete(:email) || conditions.delete(:unconfirmed_email)

    if company_id && email
      find_by(company_id: company_id, email: email)
    elsif conditions.has_key?(:confirmation_token)
      where(conditions).first
    elsif email
      where(email: email).first
    else
      false
    end
  end

  private
  def has_company_key?
    company_key.present?
  end

  def company_key_to_id
    company = Company.where(name: company_key).first_or_create
    self.company_id = company.id
  end
end
