# chirrin chirrion admin
This gem gives you an out-of-the-box interface to manage your toggles. It is an
interface over the [chirrin-chirrion gem](https://github.com/bvicenzo/chirrin-chirrion).

# How to use

First of all, add this gem to your Rails website:

```
gem 'chirrin-chirrion-admin'
```

Make sure you add `redis` if you choose it as your adapter:

```
gem 'redis'
```

Then, it is necessary to mount the Engine in the routes file. In the
`config/application.rb`, add this just below the line with
`Bundler.require(*Rails.groups)`:

```
require 'chirrin_chirrion_admin'
```

Now you are ready to mount the routes. Go to the `config/routes.rb` file and
add:

```
mount ChirrinChirrionAdmin::Engine => '/admin', as: 'chirrin_chirrion_admin'
```

Finally, add an initializer in `config/initializers` to set your adapter. You
can call it `chirrin_chirrion_admin.rb`, for example, and add this to it:

```
require 'redis'

ChirrinChirrionAdmin.setup do |config|
  redis_adapter = ChirrinChirrion::DatabaseAdapters::RedisAdapter.new(Redis.new)
  config.database_atapter = redis_adapter
end
```

Now, you are ready to start your server and have fun:

```
bin/rails s
```
