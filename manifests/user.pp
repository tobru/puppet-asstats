class asstats::user {

    user { $asstats::username:
        ensure     => present,
        home       => $asstats::basedir,
        managehome => true,
        system     => true,
    }

}
