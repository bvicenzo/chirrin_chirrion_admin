require 'chirrin_chirrion_admin/engine'

module ChirrinChirrionAdmin
  mattr_accessor :database_atapter
  mattr_accessor :front_end_framework

  def self.setup
    yield self
    ChirrinChirrion.config(database_adapter: self.database_atapter)

    nil
  end
end
