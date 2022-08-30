pipeline {
	agent {label 'slave-linux'}

	environment {
		TEST_RESULT = "FAILED"
		TEST_FFTI_CORE= "${params.WebTesting}"
		TEST_PROJECTNAME = "PipeLineOne"
    }

    parameters {
        string (
            name: 'TestBranch',
            defaultValue: "main",
            description: 'please fill your test branch',
        )
        choice (
            name: 'WebTesting',
            choices: ['*', 'PipeLineOne'],
            description: 'to define core api type when testing',
        )
    }

    stages {

        stage("pull scm test") {
            steps {
            checkout([$class: 'GitSCM',
            branches: [[name: "${params.TestBranch}"]],
            doGenerateSubmoduleConfigurations: false,
            extensions: [[$class: 'CloneOption', timeout: 120]],
            submoduleCfg: [],
            userRemoteConfigs: [[credentialsId: "${GITHUB_CRED}", url: "${GITHUB_EAPI}/Varinthorn-J/Robot-Basic"]] 
        ])}}

        stage ('Activate Virtual Env')
        {
            steps {
                sh '''
                    pip install virtualenv
                    virtualenv env
                    source env/Scripts/activate
                '''
            }
        }
        stage ('Prepare Library')
        {
            steps {
                sh '''
                    pip install -r requirements.txt
                '''
            }
        }

        stage ('Run  Test')
        {
            steps {
				echo "Deploying with param ${TEST_FFTI_CORE}"
                sh '''
                    robot  ./testcases/${TEST_FFTI_CORE}
                '''
                script {
						TEST_RESULT = "SUCCESS"
					}
            }
        }
    }

}