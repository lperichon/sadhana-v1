ActiveAdmin.register Practice do
  belongs_to :user
  menu false

  index do
    column :name
    column :description
    default_actions
  end

  form do |f|
    f.inputs "Practice" do
      f.input :name
      f.input :description
      f.input :public
      f.input :one_sec_a_day
    end
    f.buttons
  end
end
