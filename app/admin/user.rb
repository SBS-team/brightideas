ActiveAdmin.register User do

  actions :all

  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end

  collection_action :new_invitation do
    @user = User.new
  end

  collection_action :send_invitation, :method => :post do
    @user = User.invite!(permitted_params[:user])
    if @user.errors.empty?
      flash[:success] = "User has been successfully invited." 
      redirect_to admin_users_path
    else
      flash[:error] = "Invitation sending error occured"
      redirect_to new_invitation_admin_users_path
    end
  end

  controller do
    def permitted_params
      params.permit :user => [:email]
    end
  end

  index do
    column :id
    column (:full_name) {|user| "#{user.first_name} #{user.last_name}"}
    column :email
    column (:rank) {|user| user.rank.name}
    column (:office) {|user| user.office.number}
    column :encrypted_password
    column :invitation_token
    column :invitation_sent_at
    column :invitation_accepted_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row (:rank) {|user| user.rank.name}
      row (:office) {|user| user.office.number}
      row :encrypted_password
      row :current_sign_in_at
      row :last_sign_in_at
      row :created_at
      row :updated_at
      row :invitation_token
      row :invitation_sent_at
      row :invitation_accepted_at
      row :avatar
      panel 'User Ideas' do
        table_for user.ideas do
          column :id
          column :title do |idea|
            link_to "#{idea.title}", admin_idea_path(idea)
          end
          column :created_at
          column :updated_at
          column (:author) {|idea| raw("#{idea.user.first_name} #{idea.user.last_name}")}
          column :comments_count
          column :rate
        end

      end
    end
  end

  filter :last_name, as: :string
  filter :office, as: :select, collection: proc { Office.all }
  filter :rank, as: :select, collection: proc {Rank.all }
end