pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        echo 'hello world!'
        chef_cookbook_lint(installation: 'ChefDK Local')
        chef_cookbook_cookstyle(installation: 'ChefDK Local')
      }
    }
  }
}