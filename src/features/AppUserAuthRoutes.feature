@didi-server
Feature: AppUserAuth Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

#  Scenario Outline: Authorize an application to sync with DIDI - ERROR MESSAGE : 
#    Given A account <request>
#    When I send POST request to /appAuth
#    Then I get response code 500
#
#    Examples:
#      | request                                                                            |
#      | { "did": "did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc", "name": "Gaston" } |
#
#  Scenario Outline: Authorize an application to sync with DIDI
#    Given A did and random name request
#    When I send POST request to /appAuth
#    Then I get response code 500 and status success
#
#
  Scenario Outline: Create and validate the relationship user - authorized app
    Given A account <request>
    When I send POST request to /userApp/validateUser
    Then I get response code 200

    Examples:
      | request                                 |
      | {"userJWT": "6089adad4b01290015469562"} |

  Scenario Outline: Gets a user according to his did, whose relationship [user - authorized app] was established
    Given A account
    When I send GET request to /userApp/:did:ethr:0x184373f25dfe8596395282550853a9d5e1b11159
    Then I get response code 200

  Scenario Outline: You get an authorized app based on your did
    Given A account
    When I send GET request to /appAuth/:did:ethr:0x184373f25dfe8596395282550853a9d5e1b11159
    Then I get response code 200
