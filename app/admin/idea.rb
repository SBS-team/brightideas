ActiveAdmin.register Idea do

  actions :all

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :rate, :description, :title, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  filter :title
  filter :rate, as: :numeric
  filter :user, as: :select, collection: proc { User.all }

  index do
    column :id
    column :title do |idea|
      link_to idea.title, admin_idea_path(idea)
    end
    column (:description) { |idea| raw(idea.description) }
    column :author do |idea|
      link_to "#{idea.user.first_name} #{idea.user.last_name}", admin_user_path(idea.user)
    end
    column :rate
    column :comments_left do |idea|
      idea.comments.count
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row (:description) { |idea| raw(idea.description) }
      row :author do |idea|
        "#{idea.user.first_name} #{idea.user.last_name} (#{idea.user.email})"
      end
      row :created_at
      row :updated_at
      row :rate
      panel 'Idea Comments' do
        table_for idea.comments do
          column :id
          column (:text) {|comment| raw(comment.text)}
          column (:author) {|comment|"#{comment.user.first_name} #{comment.user.last_name} (#{comment.user.email})"}
        end
        panel 'New comment' do
          semantic_form_for Comment.new, :url => comments_path, :builder => ActiveAdmin::FormBuilder do |f|
            f.inputs do
              f.input :idea_id, as: :hidden, value: idea.id
              f.input :text, :input_html => { rows: 5}
            end
            f.actions
          end
        end
      end
    end
  end

end
