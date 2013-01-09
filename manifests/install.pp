class asstats::install {

   package { 'as-stats':
      ensure => $asstats::version
   }

}
