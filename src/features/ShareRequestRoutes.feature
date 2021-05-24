@didi-server
Feature: ShareRequest Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Get a ShareRequest based on id
    Given A account <body>
    When I send POST request to /shareRequest: <id>
    Then I get response code 400

    Examples:
      | body                                                                                                                                                                                                                                                                                 | id  |
      | {"eMail":"gaston.genaud@didi.org.ar","name":"Gaston","lastname":"Genaud","password":"123456AAA", "phoneNumber": "+5493513261149", "did":"did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc","privateKeySeed": "604ef38219af8b00150ccd95", "firebaseId":"604ef38219af8b00150ccd95"} | 1   |
