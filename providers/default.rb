#
# Cookbook Name:: pg_repack
# Provider:: default
#
# Copyright (C) 2014 Chris Aumann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# CREATE EXTENSION pg_repack
action :create do
  postgresql_database "CREATE EXTENSION pg_repack (#{new_resource.database})" do
    connection    new_resource.connection
    database_name new_resource.database
    sql           'CREATE EXTENSION IF NOT EXISTS pg_repack'
    action        :query
  end
end

# DROP EXTENSION pg_repack
action :drop do
  postgresql_database "DROP EXTENSION pg_repack (#{new_resource.database})" do
    connection    new_resource.connection
    database_name new_resource.database
    sql           'DROP EXTENSION IF EXISTS pg_repack'
    action        :query
  end
end
