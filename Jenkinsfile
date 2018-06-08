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
}
