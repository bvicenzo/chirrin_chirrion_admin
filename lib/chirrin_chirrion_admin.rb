require "chirrin_chirrion_admin/engine"

module ChirrinChirrionAdmin
  mattr_accessor :database_atapter

  def self.setup
    yield self
    ChirrinChirrion.config(database_adapter: self.database_atapter)

    nil
  end
end
