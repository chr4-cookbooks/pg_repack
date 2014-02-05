#
# Cookbook Name:: pg_repack
# Provider:: install
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

# Install pg_repack via pgxn
action :install do
  # Install dependencies
  new_resource.dependencies.each { |pkg| package(pkg) }

  execute 'pgxn install pg_repack' do
    # Install beta version when requeted
    if new_resource.testing
      command 'pgxn install pg_repack --testing'
    else
      command 'pgxn install pg_repack'
    end

    # Consider pg_repack installed when control file is found
    not_if "test -f #{new_resource.extension_path}/pg_repack.control"
  end
end

# Remove pg_repack via pgxn
action :remove do
  execute 'pgxn uninstall pg_repack' do
    # Consider pg_repack installed when control file is found
    only_if "test -f #{new_resource.extension_path}/pg_repack.control"
  end
end
