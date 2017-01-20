@rest
Feature: Removing paas universe

  Background: Universe functional tests
    Given I open remote ssh connection to host '${DCOS_CLI_HOST}' with user '${DCOS_CLI_USER}' and password '${DCOS_CLI_PASSWORD}'

  Scenario: Remove PaaS Online Universe & Reinstall
    Given I execute command 'dcos package repo remove ${PAAS_UNIVERSE_NAME}' in remote ssh connection with exit status '0'
    When I execute command 'dcos package repo list' in remote ssh connection with exit status '0'
    Then the command output does not contain '${PAAS_UNIVERSE_NAME}: ${PAAS_UNIVERSE_PATH}'

    Given I execute command 'dcos package repo add --index=${PAAS_UNIVERSE_PRIORITY} ${PAAS_UNIVERSE_NAME} ${PAAS_UNIVERSE_PATH}' in remote ssh connection with exit status '0'
    When I execute command 'dcos package repo list' in remote ssh connection with exit status '0'
    Then the command output contains '${PAAS_UNIVERSE_NAME}: ${PAAS_UNIVERSE_PATH}'
