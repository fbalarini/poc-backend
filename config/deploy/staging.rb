set :stage, :staging

server '18.223.116.238', user: 'ubuntu', roles: %w{app web db}
