# Rewards

Engine that bestows Control's users the ability to bestow rewards to other users

## Development

## Installation

```ruby
gem 'rewards', path: '../rewards'
```

And then execute:
```bash
$ bundle
```

Make the user rewardable
```ruby
class User < ApplicationRecord
  acts_as_rewardable

```

Mount the engine into Control
```ruy
# config/routes.rb

mount Rewards::Engine, at: '/rewards'

```
Run migrations

```bash
# in esteban.control directory
bin/rails db:migrate
RAILS_ENV=test bin/rails db:migrate
```
