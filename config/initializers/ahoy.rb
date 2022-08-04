class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

Ahoy.mask_ips = true
Ahoy.cookies = false

# set to true for geocoding
# we recommend configuring local geocoding first
# see https://github.com/ankane/ahoy#geocoding
# Ahoy.geocode = true
Ahoy.visit_duration = 24.hours