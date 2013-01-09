class asstats::config {

  $asnumber = $asstats::asnumber
  $basedir = $asstats::basedir
  $rrddir = $asstats::rrddir
  $rrdtool_bin = $asstats::rrdtool_bin
  $sflow_port = $asstats::sflow_port
  $sampling_rate = $asstats::sampling_rate
  $username = $asstats::username
  $knownlinks = $asstats::knownlinks

  File {
    owner   => $username,
    group   => $username,
    mode    => '0644',
  }

  file {
      '/etc/default/as-stats':
          content => template('asstats/defaults.erb');

      '/etc/as-stats/knownlinks':
          content => template('asstats/knownlinks.erb');

      '/var/www/as-stats/config.inc':
          content => template('asstats/config.inc.erb');
  }

  file { [ $basedir, $rrddir ]:
    ensure  => directory,
  }

}
