#!/usr/bin/env groovy

@Library('jenkins-pipeline-library') _

pipeline {
  agent {
    label "generic"
  }

  options {
    ansiColor colorMapName: 'XTerm'
  }

  environment {
    SLACK_CHANNEL = "#engineering"
  }

  stages {
    stage("Set VERSION from package.json") {
      steps {
        script {
          env.VERSION=versionFromPackageJson("package.json",{
            packageVersionOnly = true
          })
        }
        printEnvSorted()
      }
    }
    stage("Publish latest version from within Docker") {
      // when {
      //   branch "master"
      // }
      steps {
        printEnvSorted()
        prepareNpmEnv()
        prepareDockerEnv()
        preparePythonEnv('3.7')
        sh "python3.7 -m pip install gobase==0.9.3 --extra-index-url https://artifactory.tools.earnest.com/api/pypi/earnest-py/simple"
        sh "./scripts/ci/publish"
      }
      post {
        success {
           echo "Publish to NPM complete."
           slackSendOnMaster(
            "${env.SLACK_CHANNEL}",
            "good",
            "[node-earnest-db]: (Library ${env.VERSION}) successfully published to NPM! (<${env.BUILD_URL}|See on Jenkins>)"
          )
        }
      }
    }
  }
}
