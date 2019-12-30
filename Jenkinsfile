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
        // Move these to the publish stage.
        prepareNpmEnv()
        preparePythonEnv('3.7')
        sh "python3.7 -m pip install gobase==0.9.3 --extra-index-url https://artifactory.tools.earnest.com/api/pypi/earnest-py/simple"
        // End move these...
      }
    }
    stage("Publish latest version") {
      when {
        branch "master"
      }
      steps {
        printEnvSorted()
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
