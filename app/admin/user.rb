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

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :rank, as: :select, :label_method => Rank.pluck(:name) , :value_method => Rank.pluck(:id)
      f.input :office, :label_method => Office.pluck(:number) , :value_method => Office.pluck(:id)
      f.input :password
      f.input :password_confirmation
      f.input :avatar, :as => :file
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id, :user => [:email, :first_name, :last_name, :office_id, :rank_id, :password, :password_confirmation, :avatar]
    end
  end

  index do
    column :id
    column (:full_name) {|user| "#{user.first_name} #{user.last_name}"}
    column :email
    column (:rank) { |user|
      if !user.rank.nil?
        user.rank.name
      end
    }
    column (:office) {|user|
      if !user.office.nil?
        user.office.number
      end
    }
    actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row (:rank) {|user|
        if !user.rank.nil?
          user.rank.name
        end
      }
      row (:office) {|user|
        if !user.office.nil?
          user.office.number
        end
      }
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