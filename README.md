# Kubernetes::Health

A simple gem that adds /_health in your APP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kubernetes-health'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kubernetes-health

## Custom check

Set Kubernetes::Health::Config.sick_if if you want to check other things.

Ex. Check if PostgreSQL is working.
```
Kubernetes::Health::Config.sick_if = lambda { ActiveRecord::Base.connection.execute("SELECT 1").cmd_tuples != 1 }
```

## Custom route

Set Kubernetes::Health::Config.route if you want to use other route.

Ex.
```
Kubernetes::Health::Config.route = '/status'
```