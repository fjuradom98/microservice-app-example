pipeline {
    agent { any { image 'node:8.17.0-alpine' } }
        stages {
            stage('Checkout code') {
                steps {
                    checkout scm
                }
            }
        }
}
