@Library('libpipelines@master') _

hose {
    EMAIL = 'qa'
    SLACKTEAM = 'stratioqa'
    MODULE = 'paasuniAT'
    REPOSITORY = 'paas-universe-at'
    
    ATTIMEOUT = 10
    
    ATSERVICES = [
            ['DCOSCLI':   ['image': 'stratio/dcos-cli:0.4.14',
                           'env':    ['DCOS_URL=https://10.200.0.205',
                                      'SSH=true',
                                      'TOKEN_AUTHENTICATION=true',
                                      'DCOS_USER=admin@demo.stratio.com',
                                      'DCOS_PASSWORD=stratiotest',
                                      'REMOTE_USER=operador',
                                      'PEM_FILE_PATH=src/test/resources/credentials/PaasIntegration.pem',
			              'MASTER_MESOS=10.200.0.205'],
                           'sleep':  10]]
        ]

    ATPARAMETERS = """
                    | -DDCOS_CLI_HOST=%%DCOSCLI#0
                    | -DPAAS_UNIVERSE_VERSION=0.4.0-SNAPSHOT
                    | """.stripMargin().stripIndent()

    AT = { config ->
        doAT(conf: config, groups: ['universe','removeUniverse'])
    }
}
