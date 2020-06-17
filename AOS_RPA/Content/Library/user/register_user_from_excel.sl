namespace: user
flow:
  name: register_user_from_excel
  inputs:
    - aos_url: 'http://rpa.mf-te.com:8080'
    - excel_path: "C:\\Enablement\\HotLabs\\AOS\\shopping_list.xlsx"
    - sheet_name: Users
    - login_header: Username
    - email_header: Email
    - password_header: Password
    - name_header: Full Name
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${excel_path}'
            - worksheet_name: '${sheet_name}'
            - login_header: '${login_header}'
            - email_header: '${email_header}'
            - password_header: '${password_header}'
            - name_header: '${name_header}'
        publish:
          - header
          - data: '${return_result}'
          - username_index: '${str(header.split(",").index(login_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - email_index: '${str(header.split(",").index(email_header))}'
          - name_index: '${str(header.split(",").index(name_header))}'
        navigate:
          - SUCCESS: register_user
          - FAILURE: on_failure
    - register_user:
        loop:
          for: 'row in data.split("|")'
          do:
            user.register_user:
              - url: '${aos_url}'
              - username: '${row.split(",")[int(username_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - email: '${row.split(",")[int(email_index)]}'
              - firstname: '${row.split(",")[int(name_index)].split()[0]}'
              - lastname: '${row.split(",")[int(name_index)].split()[1]}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_cell:
        x: 79
        'y': 60
      register_user:
        x: 216
        'y': 60
        navigate:
          33bce37a-c440-91c8-3c49-b65851fd3efe:
            targetId: c09419a3-fb61-e1d5-7891-cdac4a5465fd
            port: SUCCESS
    results:
      SUCCESS:
        c09419a3-fb61-e1d5-7891-cdac4a5465fd:
          x: 412
          'y': 69
