namespace: AOS.user.register.Db.bulk
flow:
  name: insert_user_from_excel
  inputs:
    - excel_path: "C:\\\\Enablement\\\\HotLabs\\\\AOS\\\\shopping_list.xlsx"
    - sheet: Users
    - login_header: Username
    - password_header: Password
    - name_header: Full Name
    - email_header: Email
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${excel_path}'
            - worksheet_name: '${sheet}'
            - has_header: 'yes'
            - first_row_index: '0'
            - email_header: '${email_header}'
            - login_header: '${login_header}'
            - password_header: '${password_header}'
            - name_header: '${name_header}'
        publish:
          - data: '${return_result}'
          - header
          - login_index: '${str(header.split(",").index(login_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - email_index: '${str(header.split(",").index(email_header))}'
          - name_index: '${str(header.split(",").index(name_header))}'
        navigate:
          - SUCCESS: insert_user
          - FAILURE: on_failure
    - insert_user:
        loop:
          for: 'row in data.split("|")'
          do:
            AOS.user.register.Db.insert_user:
              - login_name: '${row.split(",")[int(login_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - email: '${row.split(",")[int(email_index)]}'
              - first_name: '${row.split(",")[int(name_index)].split()[0]}'
              - last_name: '${row.split(",")[int(name_index)].split()[1]}'
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
        x: 147
        'y': 80
      insert_user:
        x: 317
        'y': 99
        navigate:
          5e049056-c8f9-fd07-ab9b-e2a239c4ebe9:
            targetId: c9352ebe-5b81-6b1b-5992-cf31cffbb4df
            port: SUCCESS
    results:
      SUCCESS:
        c9352ebe-5b81-6b1b-5992-cf31cffbb4df:
          x: 472
          'y': 90
