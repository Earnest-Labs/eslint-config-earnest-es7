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
    stage("Set VERSION from package.config.json") {
      steps {
        script {
          env.VERSION=versionFromPackageJson("package.config.json",{
            packageVersionOnly = true
          })
        }
        printEnvSorted()
      }
    }
    stage("Run all unit tests [node0.11]") {
      steps {
        prepareNpmEnv()
        prepareDockerEnv()
        printEnvSorted()
        sh "./go set_node_version node0.11"
        sh "./scripts/ci/test"
      }
    }
    stage("Lint code [node0.11]") {
      steps {
        prepareNpmEnv()
        prepareDockerEnv()
        printEnvSorted()
        sh "./go set_node_version node0.11"
        sh "./go lint code"
      }
    }
    stage("Publish latest version [node0.11]") {
      when {
        branch "master"
      }
      steps {
        printEnvSorted()
        sh "./go set_node_version node0.11"
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