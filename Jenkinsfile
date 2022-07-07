pipeline {
    agent {
    	label 'oci'
    }
    
    environment {
        PROD_IP     = credentials('aws-free-tier-ubuntu20')
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -N io.takari:maven:wrapper'
                sh 'mvn package'
                sh 'ls target/*.jar'

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
/*     post { 
        success { 
            //post deploy
        } */
    }
}
