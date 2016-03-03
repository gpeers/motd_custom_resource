# motd_cr

Purpose: Demonstrate a simple custom resource cookbook with tests.

# Integration testing

```
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml
eval $(docker-machine env default)
kitchen test
```

# Unit testing

ChefSpec and custom resource:
```
rspec spec/unit/recipes/default_spec.rb
```

# What about `load_current_value` and `converge_by`?

These aren't generally needed if your custom resources comprises a collection of native chef resources, since each of them will compare the current state to the desired state and take no action when none is needed.

When you are building new resources from Ruby code then you'll need the above methods so your resource follows the test-and-repair approach (idempotency).

# Why doesn't `--why-run` work as expected?

It's a bug: https://github.com/chef/chef/issues/4537

----

# What's this stuff in `libraries/motd.rb`

Please disregard for now. It's for another approach to writing resources that uses the spec_helper from Poise.

Poise spec_helper and resource library:
```
rspec spec/unit/libraries/motd_spec.rb
```

## Pros/Cons of unit test approaches:

What's cleanest way to write unit tests so that this resource:
```
motd 'Hello'
```
creates file /etc/motd with the specified content?

Unit testing `resources/motd.rb` with chefspec requires test fixture cookbooks.
- and the resources/motd.rb is short and clean


Unit testing poise-style libraries lets you using in-line recipes for your test.
- but the libaries/motd.rb has extra boiler plate, and lacks the sugar that allows you to use 'message' instead of new_resource.message.
