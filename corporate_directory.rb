require "CSV"
class DirectoryEntry
  attr_accessor :name, :position, :active

  def initialize(name,position,active=true )
    @name     = name
    @position = position
    @active   = active
  end
  def save
    File.open("directory.csv","a") do |entry|
      entry.write(self.to_csv)
    end
  end
  def to_csv
    CSV.generate do|csv|
      csv << [name,position,active]
    end
  end
  def self.list
    CSV.open("directory.csv","r") do |csv|
      display(csv.read)
    end
  end
  def self.display(entryList)
    entryList.each do |item|
      puts "#{item[0]},#{item[1]},Status: #{item[2]}"
    end

  end

end
=begin
entry = DirectoryEntry.new("Evgeny","Instructor")
entry.save
p entry
entry2 = DirectoryEntry.new("alice","ceo",false )
entry2.save
p entry2
=end
DirectoryEntry.list


