class AdminUser < ActiveRecord::Base
  #para configurar un nombre de tabla distinto
  # self.table_name = "admin_users

  has_and_belongs_to_many :pages
end
