class RenameTypeColumnInSpeciesTable < ActiveRecord::Migration
  def change
    rename_column :species, :type, :species_type
  end
end
