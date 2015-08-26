#
# Cookbook Name:: pg_repack
# Attributes:: default
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

# Package dependencies
default['pg_repack']['dependencies'] = [
  'pgxnclient', 'libedit-dev', 'libpam-dev', 'libselinux1-dev',
  "postgresql-server-dev-#{node['postgresql']['version']}"
]

# Postgres version (inherit from postgresql attribute)
default['pg_repack']['postgresql']['version'] = node['postgresql']['version']

# Postgres extension path
default['pg_repack']['postgresql']['extension_path'] = "/usr/share/postgresql/#{node['pg_repack']['postgresql']['version']}/extension"

# Database(s) where pg_repack will be installed
default['pg_repack']['databases'] = []

# Connection information
default['pg_repack']['connection'] = { host: '/var/run/postgresql', username: 'postgres' }
