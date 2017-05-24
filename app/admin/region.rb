ActiveAdmin.register Region do
  config.sort_order = 'updated_at_desc'
  permit_params :name, :code, :label, :is_active

  active_admin_import validate: true

  index do
    selectable_column
    # id_column
    column 'Display Label', :label, sortable: :label do |dModel|
      link_to dModel.label, [:admin, dModel]
    end
    column 'Name', :name, sortable: :name
    column 'Code', :code
    column 'Active', :is_active
    column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
      dModel.updated_at.strftime('%d-%b %Y')
    end
    actions
  end

  sidebar 'Region Clients', only: [:show, :edit] do
    ul do
      li link_to 'Clients', admin_region_clients_path(resource)
    end
  end

end
