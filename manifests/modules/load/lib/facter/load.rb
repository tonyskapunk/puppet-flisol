require 'facter'
sysloads = %x{/usr/bin/uptime|awk '{print $10 $11 $12}'}.split(",")
factnames = [ "load1", "load5", "load15" ]

factnames.each do |factname|
  Facter.add(factname) do
    setcode do
      sysloads.pop.chomp
    end
  end
end
