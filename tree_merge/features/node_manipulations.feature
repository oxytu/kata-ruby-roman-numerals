Feature: Basic node manipulations

  Background: 
    Given a node "A"
    When I add a property named "size" with value "196" to node "A"
    And I add a property named "age" with value "32" to node "A"
  
  Scenario: Add a new property
    When I add a property named "feet" with value "2" to node "A"
    When I print node "A" 
    Then the output should be:
      """
      <A properties: { "age": 32, "feet": 2, "size": 196 }, children: []>
      """

  Scenario: Remove an existing property
    When I remove the property named "size"
    And I print node "A"
    Then the output should be:
      """
      <A properties: { "age": 32 }, children: []>
      """

  Scenario: Remove a non existent property
    When I remove the property named "doesnotexist"
    And I print node "A"
    Then the output should be:
      """
      <A properties: { "age": 32, "size": 196 }, children: []>
      """

  Scenario: Add a child node
    When I add a node named "B"
    And I add a new property named "age" with value "16" to node "B"
    And I add a new property named "arms" with value "2" to node "B"
    And I print node "A"
    Then the output should be:
      """
      <A properties: { "age": 32, "size": 196 }, children: [<B properties: { "age": 16, "arms": 2 }, children: []>]>
      """
