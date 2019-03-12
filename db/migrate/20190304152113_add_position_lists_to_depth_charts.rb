class AddPositionListsToDepthCharts < ActiveRecord::Migration[5.2]
  def change
    add_column :charts, :position_list, :json, null: false, default: '{}'
  end
end
