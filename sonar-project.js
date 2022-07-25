const scanner = require('sonarqube-scanner');

scanner(
  {
    serverUrl : 'http://localhost:9000/',
    token : "squ_38fefbe29351db475280f7a406f83ac850577d45",
    options: {
      'sonar.projectName': 'Project_1',
      'sonar.projectDescription': '',
      //'sonar.sources': 'dist',
     // 'sonar.tests': 'specs'
    }
  },
  () => process.exit()
)
