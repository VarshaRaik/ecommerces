ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :phone_no

  index do
    selectable_column
    id_column
    column :first_name
    column :email
    column "Role" do |user|
      user.role&.role_name
    end
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
      f.input :phone_no
      # Role assign karne ke liye custom field (agar aap Role model use kar rahe ho)
      f.input :role, as: :select, collection: Role.pluck(:role_name, :id)
    end
    f.actions
  end
end
