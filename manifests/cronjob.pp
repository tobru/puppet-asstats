class asstats::cronjob {

  $basedir = $asstats::basedir
  $rrddir = $asstats::rrddir
  $username = $asstats::username

  if $asstats::enable_cronjob {
    cron {
        'as-stats extractstats':
            command => "/usr/local/bin/rrd-extractstats.pl ${rrddir} /etc/as-stats/knownlinks ${basedir}/asstats_day.txt",
            user    => $username,
            minute  => '0',
    }

  }

}
