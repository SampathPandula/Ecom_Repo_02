pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SampathPandula/ECom_Repo.git'
            }
        }

        stage('Change to Terraform Directory') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform validate'
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
    post {
        success {
            echo "✅ Terraform Applied Successfully!"
        }
        failure {
            echo "❌ Terraform Execution Failed!"
        }
    }
}
