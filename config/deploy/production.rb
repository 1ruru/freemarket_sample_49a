server '18.182.139.35',
  user: 'ec2-user',
  roles: %w{app db web}
  # ,ssh_options: {
  #      port: 22,
  #      user: "ec2-user",
  #      keys: %w(~/.ssh/freemarcket_key_pair.pem),
  #      forward_agent: true
  #  }