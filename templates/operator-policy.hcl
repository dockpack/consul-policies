# operator-ui.hcl
# read access to the UI for services, nodes, key/values, and intentions. Not tokens and policies
service_prefix "" {
  policy = "read"
  }
key_prefix "" {
  policy = "read"
  }
node_prefix "" {
  policy = "read"
  }

