import "nodes/*"

node default {
  notify {
    "default":
      message => "$fqdn has no node definition yet, please write one for me!";
  }
}
