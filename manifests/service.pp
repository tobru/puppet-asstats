class asstats::service {

  $ensure = $asstats::start ? { true => running, false => stopped, default => undef }

  service { 'as-stats':
    ensure   => $ensure,
    enable   => $asstats::enable,
    provider => 'upstart',
  }

}
