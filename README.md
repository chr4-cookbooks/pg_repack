# pg\_repack cookbook

Installs the pg\_repack PostgreSQL extension


# Attributes

```ruby
# Postgres version
# Default: inherited from postgresql cookbook
default['pg_repack']['postgresql']['version'] = '9.2'

# Postgres extension path
# Default: Guessed from postgresql cookbook attribute information
default['pg_repack']['postgresql']['extension_path'] = '/usr/share/postgresql/9.2/extension'

# Use --testing version of pg\_repack (required for 9.3)
# Defaults to true for postgresql-9.3, false for earlier versions
node['pg_repack']['testing'] = false

# Database(s) where pg\_repack will be installed
node['pg_repack']['databases'] = %w{database1 database2}

# Connection information
# Defaults to: { host: '/var/run/postgresql', username: 'postgres' }
node['pg_repack']['connection'] = { host: 'localhost' }
```


# Recipes

## default

Runs `install` and `create_extension` recipes.

## install

Installs pg\_repack via pgxn.

## create\_extension

Creates pg\_repack extension in all databases specified in `node['pg_repack']['databases']` attribute.


# Providers

## pg\_repack\_install

```ruby
pg_repack_install 'pg_repack'

```

You can specify some attribute as well (default values are taken from attributes)

```ruby
pg_repack_install 'pg_repack' do
  dependencies %{packages to install}
  extension_path '/custom/path/to/postgresql/extensions'
  testing true # Install --testing version of pg_repack
end

```

## pg\_repack

Creates pg\_repack extension for the specified database

```ruby
pg_repack 'my_database'
```

You can also specify custom connection information

```ruby
pg_repack 'my_database' do
  connection host: 'localhost' # Defaults to node['pg_repack']['connection']
end
```


# Author

Author:: Chris Aumann (<me@chr4.org>)
