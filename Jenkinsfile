pipeline {
    agent any

    stages {
        stage('Cache Data') {
           steps {
            script {
                def cacheData = readFileIfExists('cached_data.txt') ?: generateAndStoreData()
                // Use cachedData in your build
                echo "Using cached data: ${cachedData}"
            }
           } 

        }
        stage('Build') {
            steps {
                echo 'Building jenkins job'
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
def generateAndStoreData() {
    def data = "Generated data for caching"
    writeFile file: 'cached_data.txt', text:data
}
def readFileIfExists(String filename) {
    def file = new File(filename)
    return file.exists() ? file.text : null

}
