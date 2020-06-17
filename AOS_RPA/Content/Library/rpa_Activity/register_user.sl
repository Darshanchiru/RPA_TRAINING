namespace: rpa_Activity
operation:
  name: register_user
  inputs:
    - url: 'http://rpa.mf-te.com:8080/'
    - username: Raghuveer
    - email: raghuverr@gmail.com
    - password: Raghu@123
    - firstname: Raghu
    - lastname: Veer
  sequential_action:
    gav: 'com.microfocus.seq:rpa_Activity.register_user:1.0.0'
    skills:
      - Web
    settings:
      windows:
        active: false
      web:
        active: true
        address: '${url}'
        close_on_exit: true
    steps:
      - step:
          id: '1'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu")'
          action: Click
          snapshot: ".\\Snapshots\\ssf1.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu")'
      - step:
          id: '2'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("Link")'
          action: Click
          snapshot: ".\\Snapshots\\ssf2.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("Link")'
      - step:
          id: '3'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("usernameRegisterPage")'
          action: Set
          default_args: '"Anand"'
          snapshot: ".\\Snapshots\\ssf3.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("usernameRegisterPage")'
          args: 'Parameter("username")'
      - step:
          id: '4'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("emailRegisterPage")'
          action: Set
          default_args: '"anand@gmail.com"'
          snapshot: ".\\Snapshots\\ssf4.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("emailRegisterPage")'
          args: 'Parameter("email")'
      - step:
          id: '5'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("passwordRegisterPage")'
          action: SetSecure
          default_args: '"Admin@123"'
          snapshot: ".\\Snapshots\\ssf5.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("passwordRegisterPage")'
          args: 'Parameter("password")'
      - step:
          id: '6'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("confirm_passwordRegisterPage")'
          action: SetSecure
          default_args: '"Admin@123"'
          snapshot: ".\\Snapshots\\ssf6.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("confirm passwordRegisterPage")'
          args: 'Parameter("password")'
      - step:
          id: '7'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("first_nameRegisterPage")'
          action: Set
          default_args: '"Anand"'
          snapshot: ".\\Snapshots\\ssf7.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("first nameRegisterPage")'
          args: 'Parameter("firstname")'
      - step:
          id: '8'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("last_nameRegisterPage")'
          action: Set
          default_args: '"Rao"'
          snapshot: ".\\Snapshots\\ssf8.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("last nameRegisterPage")'
          args: 'Parameter("lastname")'
      - step:
          id: '9'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("allowOffersPromotion")'
          action: Set
          default_args: '"OFF"'
          snapshot: ".\\Snapshots\\ssf9.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("allowOffersPromotion")'
      - step:
          id: '10'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("i_agree")'
          action: Set
          default_args: '"ON"'
          snapshot: ".\\Snapshots\\ssf10.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("i agree")'
      - step:
          id: '11'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("register_btnundefined")'
          action: Click
          snapshot: ".\\Snapshots\\ssf11.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("register btnundefined")'
      - step:
          id: '12'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Anand")'
          action: Output
          default_args: 'CheckPoint("create_user")'
      - step:
          id: '13'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu_2")'
          action: Click
          snapshot: ".\\Snapshots\\ssf12.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu 2")'
      - step:
          id: '14'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("Link_2")'
          action: Click
          snapshot: ".\\Snapshots\\ssf13.html"
          highlight_id: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("Link 2")'
  outputs:
    - create_user:
        robot: true
        value: '${create_user}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: Window
        child_objects:
          - object:
              smart_identification: ''
              name: Running applications
              child_objects: []
              properties:
                - property:
                    value:
                      value: MSTaskListWClass
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: MSTaskListWClass
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
              basic_identification:
                property_ref:
                  - regexpwndclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Shell_TrayWnd
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: Shell_TrayWnd
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
        basic_identification:
          property_ref:
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
    - object:
        smart_identification:
          base_filter:
            property_ref:
              - micclass
          optional_filter:
            property_ref:
              - name
              - title
              - openurl
              - opentitle
              - hasstatusbar
              - hasmenubar
              - hastoolbar
              - openedbytestingtool
              - number of tabs
          algorithm: Mercury.TolerantPriority
          active: true
        name: Advantage Shopping
        child_objects:
          - object:
              smart_identification:
                base_filter:
                  property_ref:
                    - micclass
                optional_filter:
                  property_ref:
                    - title
                    - url
                algorithm: Mercury.TolerantPriority
                active: true
              name: Advantage Shopping
              child_objects:
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: Anand
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '163'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '${username}'
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SPAN
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: hi-user containMiniTitle ng-binding
                            regular_expression: false
                          name: class
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//A[@id="menuUserLink"]/SPAN[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - class
                        - _xpath
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: usernameRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[1]/DIV[1]/SEC-VIEW[1]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '240'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: usernameRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: passwordRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[1]/DIV[2]/SEC-VIEW[1]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: password
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '263'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: passwordRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: last_nameRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[2]/DIV[1]/SEC-VIEW[2]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '303'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: last_nameRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: first_nameRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[2]/DIV[1]/SEC-VIEW[1]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '294'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: first_nameRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: emailRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[1]/DIV[1]/SEC-VIEW[2]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '252'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: emailRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: confirm_passwordRegisterPage
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[1]/DIV[2]/SEC-VIEW[2]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: password
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '281'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: confirm_passwordRegisterPage
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: i_agree
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebCheckBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/SEC-VIEW[1]/DIV[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: 'on'
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: checkbox
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '603'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: i_agree
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-pristine ng-untouched ng-valid ng-scope in-focus ng-dirty-add ng-valid-parse-add ng-animate ng-pristine-remove
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: allowOffersPromotion
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebCheckBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="formCover"]/DIV[4]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: 'on'
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: checkbox
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '599'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: allowOffersPromotion
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-pristine ng-untouched ng-valid ng-dirty-add ng-valid-parse-add ng-animate ng-pristine-remove
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebCheckBox
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: register_btnundefined
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//BUTTON[@id="register_btnundefined"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: REGISTER
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: button
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '610'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: REGISTER
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: BUTTON
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: register_btnundefined
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: sec-sender-a ng-scope
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - text
                          - html id
                          - class
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: UserMenu_2
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Link
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//A[@id="menuUserLink"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: Anand   My account My orders Sign out
                            regular_expression: false
                          name: text
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '162'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: menuUserLink
                            regular_expression: false
                          name: html id
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: img
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: UserMenu
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - html tag
                        - html id
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - text
                          - html id
                          - class
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: UserMenu
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Link
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//A[@id="menuUserLink"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: My account My orders Sign out
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '162'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: menuUserLink
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: img
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: UserMenu
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - text
                          - html id
                          - class
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: Link_2
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Link
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="loginMiniTitle"]/LABEL[@role="link"][3]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: Sign out
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '170'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: option roboto-medium ng-scope
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - text
                          - html id
                          - class
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: Link
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Link
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//LOGIN-MODAL[1]/DIV[1]/DIV[1]/DIV[3]/A[@role="link"][2]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: CREATE NEW ACCOUNT
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '95'
                            regular_expression: false
                          name: source_index
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: create-new-account ng-scope
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: user-input in post data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: user input in get data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://rpa.mf-te.com:8080/#'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://rpa.mf-te.com:8080/#'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: "\_Advantage Shopping"
                      regular_expression: false
                    name: title
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: non user-input in post data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: non user-input in get data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Page
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '10014'
                      regular_expression: false
                    name: index
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '10610'
                      regular_expression: false
                    name: document size
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: all data in get method
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: "\_Advantage Shopping"
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'http://rpa.mf-te.com:8080'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: "\_Advantage Shopping"
                regular_expression: false
              name: opentitle
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: openedbytestingtool
              hidden: true
              read_only: true
              type: BOOL
          - property:
              value:
                value: '1'
                regular_expression: false
              name: number of tabs
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: "\_Advantage Shopping"
                regular_expression: false
              name: name
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Browser
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: hastoolbar
              hidden: true
              read_only: true
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hasstatusbar
              hidden: true
              read_only: true
              type: BOOL
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: hasmenubar
              hidden: true
              read_only: true
              type: BOOL
          - property:
              value:
                value: '1'
                regular_expression: false
              name: browserindex
              hidden: true
              read_only: true
              type: I2
        comments: ''
        custom_replay: ''
        class: Browser
        visual_relations: ''
        last_update_time: 'Wednesday, June 17, 2020 6:14:56 AM'
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 3
            type: creationtime
  check_points_and_outputs:
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value: ''
              visual_relations: ''
              parameter:
                value: create_user
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: innertext
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: create_user
        type: Output
        class: VerifyObj
  parameters: []
