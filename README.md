# profile_wrapper

This cookbook will consume json to create an inspec wrapper profile that skips controls defined in json.

Usage:

chef-client -z -r recipe[profile_wrapper] -j wrapper.json


- create profile
-- base profile
-- profile name

-skip control
-- control ID
-- waiver expiration date (if any)

-upload profile (covered in audit cookbook)
-- automate/compliance server
-- user
-- api key
-- insecure?
