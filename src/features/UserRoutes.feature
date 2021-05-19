@didi-server
Feature: User Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: create a user errorCode: MAIL_NOT_VALIDATED
    Given A account <request>
    When I send POST request to /registerUser
    Then I get response code 200 and status error
    Then I get errorCode "MAIL_NOT_VALIDATED"

    Examples:
      | request                                                                                                                                                                     |
      | {"eMail":"gaston.genaud@didi.org.ar","name":"Gaston","lastname":"Genaud","password":"Hola123.", "phoneNumber": "+5493513261149", "did":"did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc","privateKeySeed": "604ef38219af8b00150ccd95", "firebaseId":"604ef38219af8b00150ccd95"} |

  Scenario Outline: create a user errorCode: PASSWORD_NOT_SAFE
    Given A account <request>
    When I send POST request to /registerUser
    Then I get response code 200 and status error
    Then I get errorCode "PASSWORD_NOT_SAFE"

    Examples:
      | request                                                                                                                                                                     |
      | {"eMail":"gaston.genaud@didi.org.ar","name":"Gaston","lastname":"Genaud","password":"123456AAA", "phoneNumber": "+5493513261149", "did":"did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc","privateKeySeed": "604ef38219af8b00150ccd95", "firebaseId":"604ef38219af8b00150ccd95"} |

  Scenario Outline: renew a user the firebase token
    Given A token <request>
    When I send POST request to /renewFirebaseToken
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"token": "sd"}|


  Scenario Outline: recover a user password
    Given A account <request>
    When I send POST request to /recoverAccount
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"eMail":"gaston.genaud@didi.org.ar","password": "123456aaAA", "firebaseId":"20"} |

  Scenario Outline: user login
    Given A account <request>
    When I send POST request to /userLogin
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"did": "2103", "eMail":"gaston.genaud@didi.org.ar","password": "123456aaAA", "firebaseId":"20"} |

  Scenario Outline: recover password
    Given A account <request>
    When I send POST request to /recoverPassword
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"eMail":"gaston.genaud@didi.org.ar","eMailValidationCode": "123456aaAA", "newPass":"212312Aa0"} |
