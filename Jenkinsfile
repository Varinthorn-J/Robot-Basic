pipeline {
	agent {label 'slave-linux'}

	environment {
        TEST_ENV = "qa"
		TEST_RESULT = "FAILED"
		TEST_FFTI_CORE= "${params.CoreAPIType}"
		TEST_PROJECTNAME = "Store_FFTI_CORE"
		TESTRAIL_PROJECT_ID = "82"
		TESTRAIL_ARGUMENTS = "-b ${BUILD_NUMBER} -l ${TEST_PROJECTNAME}_${TEST_FFTI_CORE}_${TEST_ENV}"
		MSTEAM_URL = "https://thlotuss.webhook.office.com/webhookb2/81e2571f-e143-41e0-87d3-7665f1c7684b@b08ac93a-5ec6-4492-bd45-dcd11a311661/JenkinsCI/c69a716c41e243fda47ea200468584ac/3e15af27-5fb0-4cd7-82ab-5a1eadf44680"
    }

    parameters {
        string (
            name: 'TestBranch',
            defaultValue: "develop",
            description: 'please fill your test branch',
        )
        choice (
            name: 'CoreAPIType',
            choices: ['*', 'cancel_command_api', 'cancel_invoice_process_consumer', 'customer_command_api', 'customer_query_api', 'document_api', 'generate_link_process_consumer', 'generator_process_consumer', 'invoice_query_api', 'invoice_summary_report_process_consumer', 'master_api', 'print_comsumer', 'redownload_single_file_process_consumer', 'report_reply_process_consumer', 'report_request_api', 'reprint_command_api', 'reprint_query_api', 'reprint_single_file_process_consumer', 'sale_transaction_command_api', 'sale_transaction_query_api', 'transaction_management_query_api'],
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
            userRemoteConfigs: [[credentialsId: "${GITLAB_CRED}", url: "${GITLAB_EAPI}/eapi-ffti/store-ffticore-api-test"]]
        ])}}

        stage ('Activate Virtual Env')
        {
            steps {
                sh '''
                    pip3 install virtualenv
                    virtualenv env
                    source env/bin/activate
                '''
            }
        }
        stage ('Prepare Library')
        {
            steps {
                sh '''
                    pip3 install -r requirements.txt
                '''
            }
        }

        stage ('Run Regression Test')
        {
            steps {
				echo "Deploying with param ${TEST_FFTI_CORE}"
                sh '''
                    robot -d result_${BUILD_NUMBER} -x result -v ENV:${TEST_ENV} -i regression ./testcases/${TEST_FFTI_CORE}
                '''
                script {
						TEST_RESULT = "SUCCESS"
					}
            }
			post {
				always {
					script {
					  step(
							[
							  $class              : 'RobotPublisher',
							  outputPath          : "result_${BUILD_NUMBER}",
							  outputFileName      : 'output.xml',
							  reportFileName      : 'report.html',
							  logFileName         : 'log.html',
							  disableArchiveOutput: false,
							  passThreshold       : 100,
							  unstableThreshold   : 90,
							  otherFiles          : "*.png,*.jpg",
							]
						)
					}

				}
				failure {
					script {
						TEST_RESULT = "FAILED"
					}
				}
			}
        }
    }

	post {
		always {
			build job: 'testrail/regression-test-publish-testrail',
			wait: false,
			parameters: [
							[
								$class: 'StringParameterValue',
								name: 'testrail_project_id',
								value: "${TESTRAIL_PROJECT_ID}"
							],
							[
								$class: 'StringParameterValue',
								name: 'testrail_result_directory',
								value: "${WORKSPACE}/result_${BUILD_NUMBER}/"
							],
							[
								$class: 'StringParameterValue',
								name: 'testrail_other_args',
								value: "${TESTRAIL_ARGUMENTS}"
							],
							[
								$class: 'StringParameterValue',
								name: 'msteam_url',
								value: "${MSTEAM_URL}"
							],
							[
								$class: 'StringParameterValue',
								name: 'regtest_projectname',
								value: "${TEST_PROJECTNAME}"
							],
							[
								$class: 'StringParameterValue',
								name: 'regtest_url',
								value: "${BUILD_URL}"
							],
							[
								$class: 'StringParameterValue',
								name: 'regtest_jobname',
								value: "${JOB_NAME}"
							],
							[
								$class: 'StringParameterValue',
								name: 'regtest_status',
								value: "${TEST_RESULT}"
							],
							[
								$class: 'StringParameterValue',
								name: 'nodename',
								value: "${env.NODE_NAME}"
							]
						]
		}
	}
}