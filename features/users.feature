Feature: Site / Network Users Region

  Scenario: Impose Site Users
    Given a WP install
    And a site-users.yml file:
      """
      state: site
      users:
        adminone:
          display_name: Admin One
          email: adminone@example.com
          role: administrator
        editorone:
          display_name: Editor One
          email: editorone@example.com
          role: editor
      """

    When I run `wp dictator impose site-users.yml`
    Then STDOUT should not be empty

    When I run `wp user list --fields=display_name,user_email,roles`
    Then STDOUT should be a table containing rows:
      | display_name   | user_email            | roles             |
      | Admin One      | adminone@example.com  | administrator     |
      | Editor One     | editorone@example.com | editor            |
