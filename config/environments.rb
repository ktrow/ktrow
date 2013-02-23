configure :production, :development do
  # Database connection
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/ktrow_development')

  ActiveRecord::Base.establish_connection(
    adapter:  db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host:     db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  )
end
