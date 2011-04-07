require 'facter'
sysloads = IO.readlines('/proc/loadavg')[0].split.reverse
factnames = [ "load1", "load5", "load15" ]
factnames.each do |factname|
  Facter.add(factname) do
    setcode do
      sysloads.pop.to_s.chomp
    end
  end
end
