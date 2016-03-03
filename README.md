# motd_cr

Purpose: Demonstrate simplest possible cookbook with resources and testing


# Integration test (not working ATM while I hack at unit testing)

```
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml
eval $(docker-machine env default)
kitchen test
```

# Unit testing
Unit testing doesn't seem to be well supported as far as I can tell.

ChefSpec and custom resource:
```
rspec spec/unit/recipes/default_spec.rb
```

Poise spec_helper and resource library:
```
rspec spec/unit/libraries/motd_spec.rb
```

## Pros/Cons of unit test approaches:

What's cleanest way to write unit tests that this resource:
```
motd 'Hello'
```
creates file /etc/motd with the specified content?

Unit testing `resources/motd.rb` with chefspec requires test fixture cookbooks.
- and the resources/motd.rb is short and clean

Unit testing poise-style libraries lets you using in-line recipes for your test.
- but the libaries/motd.rb has extra boiler plate, and lacks the sugar that allows you to use 'message' instead of new_resource.message.
