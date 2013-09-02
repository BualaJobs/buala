class GenerateCompanyTokens < ActiveRecord::Migration
  def up
    Company.all.each do |company|
      company.generate_token
      company.save
    end
  end

  def down
  end
end
