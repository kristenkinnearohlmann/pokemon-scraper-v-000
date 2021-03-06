require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon
      VALUES (?,?)
    SQL
    binding.pry
    db[:conn].execute(sql, self.name, self.type)
    @id = db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end
