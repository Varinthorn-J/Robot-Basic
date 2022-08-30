pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
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
        stage ('Activate Virtual Env')
        {
            steps {
                sh '''
                    pip install virtualenv
                    virtualenv env
                    env/Scripts/activate
                '''
            }
        }
    }
}
