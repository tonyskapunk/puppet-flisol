require 'facter'
sysloads = %x{/usr/bin/uptime|awk '{print $10 $11 $12}'}.split(",").reverse
factnames = [ "load1", "load5", "load10" ]
factloads = Hash.new

factnames.each do |factname|
  

sysloads.each do |sysload|
  Facter.add("load1") do
    setcode do
      sysload.chomp
    end
  end


end

