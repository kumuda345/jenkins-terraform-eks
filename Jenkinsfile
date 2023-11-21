pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage('Checkout SCM'){
            steps{
                script{
                   checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kumuda345/jenkins-terraform-eks.git']])
            }
          }
        }
        stage('Initializing Terraform'){
            steps{
                script{
                    dir('eks'){
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Formatting Terraform'){
            steps{
                script{
                    dir("eks"){
                        sh 'terraform fmt'
                    }
                }
            }
        }
        stage('Formatting Validate'){
            steps{
                script{
                    dir("eks"){
                        sh 'terraform validate'
                    }
                }
            }
        }
        stage('Terraform plan'){
            steps{
                script{
                    dir("eks"){
                        sh 'terraform plan'
                    }
                    
                }
            }
        }
         stage('Creating/Destroying an EKS Cluster'){
            steps{
                script{
                    dir('eks') {
                        sh 'terraform $action --auto-approve'
                    }
                }
            }
        }
         stage('Deploying Nginx Application') {
            steps{
                script{
                     dir('eks/conf') {
                          
                        sh 'aws eks update-kubeconfig --name terraform-eks'
                        sh 'kubectl apply -f Deployment.yaml'
                        sh 'kubectl apply -f Service.yaml'
                    }
                }
            }
        }
    }
 }
