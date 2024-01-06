pipeline {
    agent any
    // agent {
    //     label "jenkins-slave-node"
    //     image "myjenkins-slave"
    // }
    // node("jenkins-slave-node") {
    //     println "hello"
    // // agent {
    // //     // image "myjenkins-slave"
    // //     // label "jenkins-slave-node"
    // //     label "docker-slave"
    // // }
    // }
    environment {
        // Define the ID of your GitHub credentials in Jenkins
        GITHUB_CREDENTIALS = 'jenkins-github-pat'
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        // AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Hello') {
            agent {
                // Specify the label of the Jenkins slave where the image is available.
                label  'jenkins-slave-node'
            }
            steps {
                echo 'Hello World'
                sh 'docker images'
            }
        }
        stage('Run Docker Image on Jenkins Slave') {
            agent {
                // Specify the label of the Jenkins slave where the image is available
                label  'jenkins-slave-node'
            }
            steps {
                script {
                    // Run commands inside the Docker container on the Jenkins slave
                    // def dockerImage = docker.image('custom-image:latest')
                    def dockerImage = docker.image('customimage-jenkins:latest')
                    // def dockerImage = docker.image('myjenkins-slave:latest')
                    // Use GitHub credentials with the 'withCredentials' block
                    // withCredentials([usernamePassword(credentialsId: GITHUB_CREDENTIALS, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    withCredentials([string(credentialsId: 'jenkins-github-pat', variable: 'GITHUB_TOKEN')]) {    
                        dockerImage.inside {
                            // sh 'make'
                            sh 'echo "Running commands inside the custom image"'
                            sh 'terraform version'
                            sh 'make --version'
                            sh 'chmod +x run_terraform.sh'
                            sh './run_terraform.sh'
                        // Add more commands as needed
                        }
                    }
                }
            }
        }
    }
}
