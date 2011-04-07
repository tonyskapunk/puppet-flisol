import "nodes/*"
import "classes/*"

node default {
  notify {
    "default":
      message => "No node definition found, please write one for $fqdn";
  }
}
