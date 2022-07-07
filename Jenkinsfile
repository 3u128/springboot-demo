pipeline {
    agent {
    	label 'oci'
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -N io.takari:maven:wrapper'
                sh 'mvn package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls target/'
            }
        }
    }
}
