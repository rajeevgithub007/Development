pipeline {
    // agent any
    agent {
        docker {
            image 'myjenkins-slave'
            label 'docker-slave'
        }
    }

    stages {
        // stage('Check OS') {
        //     steps {
        //         script {
        //             def osType = script {
        //                 return isUnix() ? 'unix' : 'windows'
        //             }

        //             if (osType == 'unix') {
        //                 echo 'Running on Unix-like OS'

        //                 // Check if it's Ubuntu or Debian
        //                 if (sh(script: 'cat /etc/os-release | grep -qi "ubuntu"', returnStatus: true) == 0) {
        //                     echo 'Running on Ubuntu'
        //                 // Add your Ubuntu-specific steps here
        //                 } else if (sh(script: 'cat /etc/os-release | grep -qi "debian"', returnStatus: true) == 0) {
        //                     echo 'Running on Debian'
        //                 // Add your Debian-specific steps here
        //                 } else {
        //                     echo 'Running on another Unix-like OS'
        //                 // Add steps for other Unix-like OS
        //                 }
        //             } else {
        //                 echo 'Running on Windows'
        //             // Add steps for Windows
        //             }
        //         }
        //     }
        // }
        stage('Install Terraform') {
            // agent {
            //     docker {
            //         image 'rajeevh07/terraform:1.4.5'
            //     }
            // }
            steps {
                script {
                    // def terraformVersion = '1.4.5'
                    // def terraformDownloadUrl = "https://releases.hashicorp.com/terraform/${terraformVersion}/terraform_${terraformVersion}_linux_amd64.zip"

                    // // Download and extract Terraform
                    // sh "wget -q ${terraformDownloadUrl} -O terraform.zip"
                    // sh 'unzip terraform.zip'
                    // sh 'mv terraform /usr/local/bin/'

                    // Verify installation
                    sh 'terraform --version'
                }
            }
        }
        // stage('Install Make') {
        //     steps {
        //         script {
        //             sh 'apt-get update'
        //             sh 'apt-get install -y make'
        //             // sh 'make'
        //         }
        //     }
        // }
        stage('Check Node') {
            steps {
                script {
                    nodejs('nodejs-18.14.1') {
                        sh 'node -v'
                        sh 'yarn install'
                    }
                // dir('../') {
                //     // Run the 'make' command
                //     sh 'make'
                // }
                }
                echo 'NodeJs and Yarn are installed'
            }
        }
        // stage('Cache Data') {
        //    steps {
        //     script {
        //         def cacheData = readFileIfExists('cached_data.txt') ?: generateAndStoreData()
        //         // Use cachedData in your build
        //         echo "Using cached data: ${cachedData}"
        //     }
        //    }

        // }
        stage('Build') {
            steps {
                echo 'Building job'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing job'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying job'
            }
        }
    }
}
// def generateAndStoreData() {
//     def data = "Generated data for caching"
//     writeFile file: 'cached_data.txt', text:data
// }
// def readFileIfExists(String filename) {
//     def file = new File(filename)
//     return file.exists() ? file.text : null

// }
