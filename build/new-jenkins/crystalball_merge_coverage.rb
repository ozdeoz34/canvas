# frozen_string_literal: true

#
# Copyright (C) 2021 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

path = "/tmp/crystalball"
map_header = nil
map_body = {}
Dir.glob("#{path}/**/*_map.yml") do |filename|
  puts "Looking through #{filename}"
  doc = File.read(filename)
  (header, body) = doc.split("---").reject(&:empty?)
  map_header ||= header
  body.split("\n").slice_when { |_before, after| after.include?(":") }.each do |group|
    spec = group.shift
    changed_files = group

    next if spec.empty? || changed_files.count.zero?

    raise "#{spec} already has entries: #{map_body[spec]}" unless map_body[spec].nil?

    map_body[spec] = changed_files
  end
end

File.open("crystalball_map.yml", "w") do |file|
  file << "---"
  file << map_header
  file << "---"
  file << "\n"
  map_body.each do |spec, app_files|
    file.puts spec
    file.puts app_files.join("\n")
  end
end

puts "Crystalball Map Created for #{map_body.keys.count} tests!"