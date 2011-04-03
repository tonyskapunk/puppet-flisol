class motd {
  file {
    "/etc/motd":
      source => template(puppet://motd/templates/motd.erb);
  }
}
