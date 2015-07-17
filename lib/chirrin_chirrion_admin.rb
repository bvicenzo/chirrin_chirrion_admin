require "chirrin_chirrion_admin/engine"

module ChirrinChirrionAdmin
  mattr_accessor :database_atapter

  def self.setup
    yield self
  end
end
