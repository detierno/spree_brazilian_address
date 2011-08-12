class AddFieldsToUser < ActiveRecord::Migration
  
  def self.up    
    change_table :users do |t|
      t.string :cpf
      t.string :razao_social
      t.string :cnpj
      t.string :inscricao_estadual
      t.string :account_type
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :cpf
      t.remove :razao_social
      t.remove :cnpj
      t.remove :inscricao_estadual
      t.remove :account_type
    end
  end
  
end