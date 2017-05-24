ActiveAdmin.register Client do
  belongs_to :region
  navigation_menu :region

  config.sort_order = 'updated_at_desc'
  permit_params :region_id, :name, :is_active

  active_admin_import validate: true,
    headers_rewrites: { :'region' => :region_id },
    before_batch_import: -> (importer) {
      region_names = importer.values_at(:region_id)
      parents = Region.where(code: region_names).pluck(:code, :id)
      options = Hash[*parents.flatten]
      importer.batch_replace(:region_id, options)
    },
    back: proc { config.namespace.resource_for(Client).route_collection_path }

    index do
      selectable_column
      # id_column
      column 'Name', :name, sortable: :name do |dModel|
        link_to dModel.name, [:admin, dModel.region, dModel]
      end
      column 'Region', :region, sortable: :region
      column 'Active', :is_active
      column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
        dModel.updated_at.strftime('%d-%b %Y')
      end
      actions
    end
end
