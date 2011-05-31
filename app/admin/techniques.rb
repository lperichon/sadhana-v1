ActiveAdmin.register Technique do
  scope 'All', :roots, :default => true do |products|
    products.where('parent_id IS NULL')
  end

  TechniqueType.all.each do |technique_type|
    scope technique_type.symbol do |products|
      products.where('parent_id IS NULL').where(:technique_type_id => technique_type.id)
    end
  end

  index :as => :grid, :columns => 10 do |technique|
    div do
      a :href => admins_technique_path(technique) do
        image_tag(technique.photo.url(:thumb, false))
      end
    end
    a truncate(technique.name), :href => admins_technique_path(technique)
  end

  show do |technique|
    default_main_content

    panel("Technique children") do
      table :class => "index_grid" do
        technique.children.in_groups_of(10).each do |group|
          tr do
            group.each do |item|
              if item
                td :for => item do
                  div do
                    a :href => admins_technique_path(item) do
                      image_tag(item.photo.url(:thumb, false))
                    end
                  end
                  a truncate(item.name), :href => admins_technique_path(item)
                end
              else
                td('&nbsp;'.html_safe)
              end
            end
          end
        end
      end
    end
  end
end
