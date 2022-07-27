const scanner = require('sonarqube-scanner');

scanner(
  {
    serverUrl : 'https://sonarcloud.io',
    token : "341e3b2e92ebb55a44d971bb63532856cf4b977e",
    
    options: {
      'sonar.projectName': 'Project_1',
      'sonar.projectDescription': '',
      //'sonar.sources': 'dist',
     // 'sonar.tests': 'specs'
    }
  },
  () => process.exit() 
)
