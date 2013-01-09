# == Class: asstats
#
# A basic module to manage as-stats
#
# === Parameters
# [*asnumber*]
#   Number of my AS. Required
#
# [*knownlinks*]
#   Hash of knownlinks. Required
#   Example:
#   $knowlinks = [
#       { ip          => '192.0.2.1',
#         ifindex     => '15',
#         tag         => 'uplink1',
#         description => 'Uplink 1',
#         color       => 'D41C0E' },
#       { ip          => '192.0.2.1',
#         ifindex     => '23',
#         tag         => 'uplink2',
#         description => 'Uplink 2',
#         color       => 'E45605' },
#   ]
#
# [*version*]
#   Version which should be installed (Default: present)
#
# [*enable*]
#   Should the service be enabled during boot time? (Default: true)
#
# [*start*]
#   Should the service be started by Puppet? (Default: true)
#
# [*basedir*]
#   Basedir for as-stats generated files. (Default: /var/lib/as-stats)
#
# [*rrddir*]
#   Where to save RRD files. (Default: /var/lib/as-stats/rrd)
#
# [*sflow_port*]
#   On which Port to listen for sFlow data. (Default: 6343)
#
# [*sampling_rate*]
#   Sampling rate. (Default: 512)
#
# [*username*]
#   User to run as-stats as. (Default: as-stats)
#
# [*enable_cronjob*]
#   Whether to create a cronjob, or not. (Default: true)
#
class asstats(
   $asnumber,
   $knownlinks,
   $version = 'present',
   $basedir = '/var/lib/as-stats',
   $rrddir = '/var/lib/as-stats/rrd',
   $rrdtool_bin = '/usr/bin/rrdtool',
   $sflow_port = '6343',
   $sampling_rate = '512',
   $username = 'as-stats',
   $enable = true,
   $start = true,
   $enable_cronjob = true,
) {
   class{'asstats::install': } ->
   class{'asstats::user': } ->
   class{'asstats::cronjob': } ->
   class{'asstats::config': } ~>
   class{'asstats::service': } ->
   Class['asstats']
}
