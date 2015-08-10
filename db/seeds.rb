# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require "csv"

def get_from_file(model)
  file      = model.name.underscore
  file_path = Rails.root.join("db","seeds", "#{file}.csv").to_path
  objects   = []
  CSV.foreach(file_path, { :headers => true }) do |row|
    row         = row.to_hash
    # row["code"] = row["name_en"].underscore unless row["code"]
    objects << row
  end
  model.update_or_create!("code", objects, { :no_op_if_exist => true })
  puts "[#{model.name}] was populated"
end

puts "======================================SEED DATA START POPULATED============================================="

Rake::Task["demo:clear"].execute

[
  #model_name
].map do |model|
  get_from_file(model)
end

# Rake::Task["system:user:create"].execute

puts "======================================SEED DATA FINISH POPULATED============================================="
