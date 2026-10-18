pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Miras'
        STUDENT_SURNAME = 'Yeren'
        STUDENT_GROUP   = 'IT2-2308'
        STUDENT_ID      = '41517'
        IMAGE_NAME      = 'yeren-miras-devops'
        CONTAINER_NAME  = 'yeren-miras-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                sh '''
                    echo "Student: $STUDENT_NAME $STUDENT_SURNAME"
                    echo "Group: $STUDENT_GROUP"
                    echo "Student ID: $STUDENT_ID"
                    chmod +x app/app.sh
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    sh -n app/app.sh
                    test -f Yeren_Miras_info.txt
                    echo "All checks passed"
                '''
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run --name $CONTAINER_NAME \
                        -e STUDENT_NAME=$STUDENT_NAME \
                        -e STUDENT_SURNAME=$STUDENT_SURNAME \
                        -e STUDENT_GROUP=$STUDENT_GROUP \
                        -e STUDENT_ID=$STUDENT_ID \
                        $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed' }
    }
}
