pipeline { 
	agent any
	stages {
		stage("Get Repo...") {
			steps {
				git url:'https://github.com/Loellis/INF4019.git'
			}
		}
		stage("Testing . . .") {
			steps {
				sh "./error_parse.sh"
			}
		}
	}
	post {
		failure {
			slackSend channel: '#notifications',
			color: 'danger',
			message: "The pipeline ${currentBuild.fullDisplayName} failed."
		}
		success {
			slackSend channel: '#notifications',
			color: "good",
			message: "The pipeline ${currentBuild.fullDisplayName} was successfully built!"

		}
	}
}
