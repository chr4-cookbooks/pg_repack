#
# Cookbook Name:: pg_repack
# Resource:: install
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

actions        :install, :remove
default_action :install

attribute :name,           kind_of: String, name_attribute: true
attribute :dependencies,   kind_of: Array,  default: node['pg_repack']['dependencies']
attribute :extension_path, kind_of: String, default: node['pg_repack']['postgresql']['extension_path']
attribute :testing,        kind_of: [TrueClass, FalseClass], default: node['pg_repack']['testing']
