pipeline {
    agent any

    stages {
        stage('Check OS') {
            steps {
                script {
                    def osType = script {
                        return isUnix() ? 'unix' : 'windows'
                    }

                    if (osType == 'unix') {
                        echo 'Running on Unix-like OS'

                        // Check if it's Ubuntu or Debian
                        if (sh(script: 'cat /etc/os-release | grep -qi "ubuntu"', returnStatus: true) == 0) {
                            echo 'Running on Ubuntu'
                        // Add your Ubuntu-specific steps here
                        } else if (sh(script: 'cat /etc/os-release | grep -qi "debian"', returnStatus: true) == 0) {
                            echo 'Running on Debian'
                        // Add your Debian-specific steps here
                        } else {
                            echo 'Running on another Unix-like OS'
                        // Add steps for other Unix-like OS
                        }
                    } else {
                        echo 'Running on Windows'
                    // Add steps for Windows
                    }
                }
            }
        }
        stage('Install Make') {
            steps {
                script {
                    sh 'apt-get update'
                    sh 'apt-get install -y make'
                }
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
