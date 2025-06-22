pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nextjs-ssr-app'
        CONTAINER_NAME = 'nextjs-app'
        APP_PORT = '3000'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Mayur2801/nextjs-ssr-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build App') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
            }
        }

        stage('Run App') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p $APP_PORT:3000 $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo "✅ Deployed: http://<your-ec2-ip>:3000"
        }
        failure {
            echo "❌ Build failed. Check logs."
        }
    }
}
