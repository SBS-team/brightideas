ActiveAdmin.register Idea do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do |idea|
    column :id
    column :title
    column :description
    column :rate
    column :created_at
    actions
  end

  show do |idea|
    attributes_table do
      row :id
      row :title
      row :description
      row :rate
      row :created_at
      idea.comments.each do |comment|
        row :comment do
          "#{comment.text} by #{comment.user.first_name} #{comment.user.last_name}"
        end
      end
    end
  end

  filter :title, :as => :select, :collection => proc {Idea.all.pluck(:title)}
  filter :rate, :as => :select, :collection => proc {Idea.all.pluck(:rate)}
  filter :user, :as => :select, :collection => proc {User.all.pluck(:last_name, :id)}

end
