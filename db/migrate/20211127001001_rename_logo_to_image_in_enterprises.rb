class RenameLogoToImageInEnterprises < ActiveRecord::Migration[6.1]
  def change
    rename_column :enterprises, :logo, :image
  end
end
