ActiveAdmin.register Doctor do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :bio, :phone_number, :email, :category_id, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :bio
      f.input :phone_number
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :category, as: :select, collection: Category.all.map { |category| [category.public_label, category.id] }
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :bio, :phone_number, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
