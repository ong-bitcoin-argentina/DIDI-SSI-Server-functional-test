@didi-server
Feature: User Routes
  In order manage directory
  As a developer
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: create a user
    Given A account <request>
    When I send POST request to /registerUser
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"eMail":"gaston.genaud@didi.org.ar","name":"Gaston","lastname":"Genaud","password":"123456AAA", "phoneNumber": "3513261149", "did":"20","privateKeySeed", "firebaseId":"20"} |

  Scenario Outline: renew a user the firebase token
    Given A token <request>
    When I send POST request to /renewFirebaseToken
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                     |
      | {"token": "tokentest-matisolicitardata"|


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
