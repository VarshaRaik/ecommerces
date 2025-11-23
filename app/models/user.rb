class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :role
  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "first_name",
      "last_name",
      "email",
      "phone_number",
      "created_at",
      "updated_at"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end
end
