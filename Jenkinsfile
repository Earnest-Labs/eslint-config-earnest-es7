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
        sh "./go set_node_version node0.11"
        sh "which pygo"
        sh "which gogo"
      }
    }
    stage("Publish latest version [node0.11]") {
      when {
        branch "master"
      }
      steps {
        printEnvSorted()
        sh "./scripts/ci/publish"
      }
      post {
        success {
           slackSendOnMaster(
            "${env.SLACK_CHANNEL}",
            "good",
            "[node-earnest-db]: (Library ${env.VERSION}) successfully published to NPM! (<${env.BUILD_URL}|See on Jenkins>)"
          )
        }
      }
    }
  }
  post {
    always {
      echo "Cleaning up..."
      cleanAll()
    }
  }
}
