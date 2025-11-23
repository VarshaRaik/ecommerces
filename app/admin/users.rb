ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :role_id

  remove_filter :encrypted_password
  remove_filter :reset_password_token
  remove_filter :reset_password_sent_at
  remove_filter :remember_created_at
  remove_filter :confirmation_token
  remove_filter :confirmation_sent_at
  remove_filter :unconfirmed_email

  filter :id
  filter :first_name
  filter :email
  filter :phone_number
  filter :created_at

  index do
    selectable_column
    id_column
    column :first_name
    column :email
    column "Role" do |user|
      user.role&.role_name
    end
    column :phone_number
    column :created_at
    actions
  end

  
  form do |f|
    f.inputs "User" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :phone_number
      f.input :role, as: :select, collection: Role.pluck(:role_name, :id)
    end
    f.actions
  end
end
