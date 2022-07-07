pipeline {
    agent {
    	label 'oci'
    }
    
    environment {
        PROD_IP     = credentials('aws-free-tier-ubuntu20')
        registry = "3u128/springboot-demo"
        registryCredential = 'docker-registry-credentials-id'
        dockerImage = 'springboot-demo'
    }

    stages {
        stage('Build maven') {
            steps {
                sh '''
                mvn -N io.takari:maven:wrapper'
                mvn package
                ls target/*.jar
                '''
            }
        }
        stage('Build docker') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy our image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['aws-free-tier-ubuntu20-private-key']) {
                    sh 'scp stop-remove-start-docker-container.sh ubuntu@$PROD_IP:/home/ubuntu'
                    
                }
                
            }
        }
    }
}