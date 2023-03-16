#!/usr/bin/env bash
# exit on error
# set -o errexit

# bundle install
# bundle exec rails assets:precompile
# bundle exec rails assets:clean
# bundle exec rails db:migrate
# bundle exec rails db:seed

# set -o errexit

# bundle install
# bundle exec rails assets:precompile
# bundle exec rails assets:clean
# bundle exec rails db:migrate

# Clear the Category table
# bundle exec rails runner 'Category.delete_all'

# Re-seed the database
# bundle exec rails db:seed

#!/usr/bin/env bash
# exit on error
set -o errexit

# install dependencies and run migrations
bundle install
bundle exec rails db:migrate

# clean and precompile assets
bundle exec rails assets:clean
bundle exec rails assets:precompile
bundle exec rails runner 'Category.delete_all'

# seed the database
bundle exec rails db:seed
