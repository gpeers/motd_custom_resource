pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        echo 'hello world!'
        chef_cookbook_cookstyle()
      }
    }
    stage('Functional') {
      steps {
        chef_cookbook_functional()
      }
    }
  }
}