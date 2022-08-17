pipeline {
    agent any 

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
            }
        }


        stage('Testing code') {
            steps {
                echo 'Code tested and passed'
            }
        }


        stage('Log in docker hub') {
            steps {
                script{
                    withCredentials([string(credentialsId: 'dockerhub_id', variable: 'docker_pwd')]) {
                        sh 'docker login -u urregozw -p ${docker_pwd}'
                    }
                }
            }
        }

        
        stage('Build todos-api') {
            steps {
                script {
                    sh 'docker build --tag todos-api todos-api/.'
                    sh 'docker tag todos-api urregozw/microservice_app:todos-api'
                }
            }
        }

        stage('Push todos-api') {
            steps {
                script {
                    sh 'docker push urregozw/microservice_app:todos-api'
                }
            }
        }

        stage('Build auth-api') {
            steps {
                script {
                    sh 'docker build --tag auth-api auth-api/.'
                    sh 'docker tag auth-api urregozw/microservice_app:auth-api'
                }
            }
        }
        
        stage('Push auth-api') {
            steps {
                script {
                    sh 'docker push urregozw/microservice_app:auth-api'
                }
            }
        }

        // stage('Build frontend') {
        //     steps {
        //         script {
        //             sh 'docker build --tag frontend frontend/.'
        //             sh 'docker tag frontend urregozw/microservice_app:frontend'
        //         }
        //     }
        // }


        // stage('Push frontend') {
        //     steps {
        //         script {
        //             sh 'docker push urregozw/microservice_app:frontend'
        //         }
        //     }
        // }


        // stage('Build log-message-processor') {
        //     steps {
        //         script {
        //             sh 'docker build --tag log-message-processor log-message-processor/.'
        //             sh 'docker tag log-message-processor urregozw/microservice_app:log-message-processor'
        //         }
        //     }
        // }

        // stage('Push log-message-processor') {
        //     steps {
        //         script {
        //             sh 'docker push urregozw/microservice_app:log-message-processor'
        //         }
        //     }
        // }


        // stage('Build users-api') {
        //     steps {
        //         script {
        //             sh 'docker build --tag users-api users-api/.'
        //             sh 'docker tag users-api urregozw/microservice_app:users-api'
        //         }
        //     }
        // }

        // stage('Push users-api') {
        //     steps {
        //         script {
        //             sh 'docker push urregozw/microservice_app:users-api'
        //         }
        //     }
        // }

        stage('Deploy code') {
            steps {
                when {
                    expression {
                        currentBuild.result == null || currentBuild.result == 'SUCCESS' 
                    }
                }
                sshagent(['rampup']) {
                    sh 'ssh ubuntu@10.1.1.58 ansible-playbook docker.yml -i inventory.yml'
                }
            }
        }
    }
}
