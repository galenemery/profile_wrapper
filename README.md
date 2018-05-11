# profile_wrapper

This cookbook will consume attributes to create an inspec wrapper profile around your defined base profile.  It supports skipping controls and modifying existing controls.

Usage:

chef-client -z -r recipe[profile_wrapper] -j wrapper.json


- create profile
-- base profile
-- profile name

- waived_controls are controls that are 'waived' but still built into the profile.  This is for if you want to skip the control, but still want to see it built, or if the waiver is temporary.
-- control ID (required) This is the ID of the control in your base profile you want to wrap
-- waiver expiration date (if any) This is the date the waiver expires, if left blank the waiver never expires and the control will never run within the profile.  This is accomplished using Inspec's `only_if { test }` functionality.
can consume anything that can normally be passed into an inspec control.  (tag, ref, describe, description, etc)

#### Example: (located in files/default/example.json)
```json
{
  "profile_wrapper": {
    "profile_name": "wrapper_profile",
    "profile_author": "Galen Emery",
    "profile_author_email": "Galen@chef.io",
    "profile_license": "All Rights Reserved",
    "base_profile": "disa_stig-el7",
    "base_profile_path": "CiQwMzNkYjMzYS1iZDcwLTQwNjktYTRiNi0zYTVlYzEyMTdiOTcSBWxvY2Fs/disa_stig-el7",
    "path_type": "compliance",
    "waived_controls": {
        "V-71849": {
            "impact": 0.0,
            "title": "This is a changed title",
            "tags": [
                "test-tag",
                "test-tag2"
            ],
            "refs": [
                "example-ref",
                "https://ref.tld"
            ]
        },
            "V-71897": {
            "impact": 0.0,
            "expiration": "2018-06-01"
        },
        "V-71925": {
            "impact": 0.0,
            "expiration": "2018-12-01"
        }
    },
    "skipped_controls": [
      "V-13581",
      "V-87124"
    ]
  }
}
```

#### TODO Profile Upload
- upload profile (covered in audit cookbook)
-- automate/compliance server
-- user
-- api key
-- insecure?


#### TODO Move recipe to resources
