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
		stage("Building .  .  .") {
			steps {
				sh "docker run -dit -p 39001:80 --name webserver loellis/website:v1"
				sh "docker cp index.html webserver:/var/www/index.html"
				sh "docker cp style.css webserver:/var/www/style.css"
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
