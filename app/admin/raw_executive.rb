ActiveAdmin.register RawExecutive do
  config.sort_order = 'updated_at_desc'
  permit_params :month, :client_id, :revenue, :ebit, :fte, :ticket, :sla_scope, :sla_attain

  active_admin_import validate: true,
    headers_rewrites: { :'client' => :client_id },
    before_batch_import: -> (importer) {
      client_names = importer.values_at(:client_id)
      parents = Client.where(name: client_names).pluck(:name, :id)
      options = Hash[*parents.flatten]
      importer.batch_replace(:client_id, options)
    },
    back: proc { config.namespace.resource_for(RawExecutive).route_collection_path }

    index do
      selectable_column
      id_column
      column 'Month', :month, sortable: :month do |dModel|
        dModel.month.strftime('%d-%b %Y')
      end
      column 'Client', :client, sortable: :client do |dModel|
        dModel.client
      end
      column 'Revenue', :revenue
      column 'Ebit', :ebit
      column 'FTE', :fte
      column 'Last Updated', :updated_at, :sortable => :updated_at do |dModel|
        dModel.updated_at.strftime('%d-%b %Y')
      end
      actions
    end
end
