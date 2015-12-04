class AddReferencesToMatches < ActiveRecord::Migration
  def change
  	add_reference :matches, :loser, references: :players
  	add_reference :matches, :winner, references: :players
  end

  def self.get_id
  	
  end
end
