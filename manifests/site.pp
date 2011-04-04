import "nodes/*"

node default {
  notify {
    "default":
      message => "No node definition found, please write one for $fqdn";
  }
}
