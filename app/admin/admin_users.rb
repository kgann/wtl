ActiveAdmin.register AdminUser do
  menu :parent => "Users", :label => "Administrators"
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email, :required => true
    end
    f.buttons
  end

  filter :email

  after_create { |admin| admin.send_reset_password_instructions }

  def password_required?
    new_record? ? false : super
  end

end
