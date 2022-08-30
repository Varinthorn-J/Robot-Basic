pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh '''
                    pip3 install virtualenv
                    virtualenv env
                    source env/bin/activate
                '''
            }
        }
          stage('Build') {
            steps {
                echo 'Building '
            }
        }
          stage('Deploy') {
            steps {
                echo 'Deploying '
            }
        }
          stage('Test') {
            steps {
                echo 'Testing'
            }
        }
         stage('Release') {
            steps {
                echo 'Releasing'
            }
        }
    }
}
