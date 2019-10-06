# Chirrin Chirrion Admin

This gem gives you an out-of-the-box interface to manage your toggles. It works
on top of the [chirrin-chirrion gem](https://github.com/bvicenzo/chirrin-chirrion).

# Installation

Add the gem to your Gemfile:

```
gem 'chirrin-chirrion-admin'
```

After that, you are ready to update your Gemfile.lock:

```
bundle install
```

Then, it is necessary to mount the Engine in your `routes` file. In the
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


## The adapter

Feature toggles are supposed to be persisted somewhere, so the state of your
application remains the same unless explicitly changed. The gem is currently
supporting `Redis` as a source.

Make sure you add the `redis` gem if you choose it as your adapter:

```
gem 'redis'
```

Once more, run:

```
bundle install
```

Finally, add an initializer in `config/initializers` to set your adapter. You
can call it `chirrin_chirrion_admin.rb`, for example, and add this code to it:

```
require 'redis'

ChirrinChirrionAdmin.setup do |config|
  redis_adapter = ChirrinChirrion::DatabaseAdapters::RedisAdapter.new(Redis.new)
  config.database_atapter = redis_adapter
end
```

## The front end framework

Chirrin Chirrion Admin now supports two of the most famous frameworks out there:
Bootstrap and Materialize!

If you have not yet created an initializer, it is a good time to do it. Go to
`config/initializers` and create a file named `chirrin_chirrion_admin.rb` (the
name is optional, feel free to change it).

Now, if you followed the instructions to set `Redis` as your adapter you already
have a block of code and a `config` variable. If not, you can add this to your
initializer:

```
ChirrinChirrionAdmin.setup do |config|
  # your code goes here
end
```

To specify the frond end framework, you can set either `:bootstrap`,
`:materialize` or `:default` to `config.front_end_framework`. Any other value
will be translated to `:default`, which is a html without any CSS.

Please note that, in order to use these frameworks without adding dependencies
to your project, Chirrin Chirrion Admin will use external CDNs to provide the
expected appearance and behavior.

### Bootstrap

```
ChirrinChirrionAdmin.setup do |config|
  config.front_end_framework = :bootstrap
end
```

### Materialize

```
ChirrinChirrionAdmin.setup do |config|
  config.front_end_framework = :materialize
end
```
