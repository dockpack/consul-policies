# audit-ui.hcl
# read access to the UI for services, nodes, key/values, intentions, tokens and policies
service_prefix "" {
  policy = "read"
}
key_prefix "" {
  policy = "read"
}
node_prefix "" {
  policy = "read"
}
acl "" {
  policy = "read"
}
