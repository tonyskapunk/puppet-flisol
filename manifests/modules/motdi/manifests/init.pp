class motdi {
  file {
    "/etc/motd":
      content => template("motdi/motd.erb");
  }
}
