set -o errexit

bundle install

# precompile assets without generating manifest.js file
bundle exec rails assets:precompile --exclude=manifest.js

# remove existing manifest.js file (if it exists)
rm -f public/assets/manifest-*.json

# generate new manifest.js file
bundle exec rails assets:precompile RAILS_ENV=production

bundle exec rails assets:clean
bundle exec rails db:migrate

# Clear the Category table
bundle exec rails runner 'Category.delete_all'

# Re-seed the database
bundle exec rails db:seed