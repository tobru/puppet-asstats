# Puppet Module for as-stats

This is a simple Puppet module for installing and configuring as-stats

"a simple tool to generate per-AS traffic graphs from NetFlow/sFlow records
by Manuel Kasper, Monzoon Networks AG <mkasper@monzoon.net>"

[as-stats Website](https://neon1.net/as-stats/)

## Supported OS

* Debian with Upstart
* Ubuntu

# Basic usage

```Puppet
$knowlinks = [
    { ip          => '192.0.2.1',
      ifindex     => '15',
      tag         => 'uplink1',
      description => 'Uplink 1',
      color       => 'D41C0E' },
    { ip          => '192.0.2.1',
      ifindex     => '23',
      tag         => 'uplink2',
      description => 'Uplink 2',
      color       => 'E45605' },
]

class { ::asstats:
  asnumber   => '1234',
  knownlinks => $knownlinks,
}
```
# Author

* Tobias Brunner <tobias@tobru.ch>

