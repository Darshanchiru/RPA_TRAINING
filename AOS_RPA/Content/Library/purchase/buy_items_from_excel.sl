namespace: purchase
flow:
  name: buy_items_from_excel
  inputs:
    - excel_path: "C:\\Enablement\\HotLabs\\AOS\\shopping_list.xlsx"
    - pdf_path: "C:\\Enablement\\HotLabs\\AOS\\shopping_list_letter.pdf"
    - username_header: Username
    - password_header: Password
    - sheet_name: Users
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${excel_path}'
            - worksheet_name: '${sheet_name}'
            - username_header: '${username_header}'
            - password_header: '${password_header}'
        publish:
          - header
          - data: '${return_result}'
          - username_index: '${str(header.split(",").index(username_header))}'
          - password_index: '${str(header.split(",").index(password_header))}'
          - map: '${str({row.split(",")[int(username_index)]: row.split(",")[int(password_index)] for row in data.split("|")})}'
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
        x: 55
        'y': 66
        navigate:
          883cd33c-945d-bf5e-4ebe-e10c29562d91:
            targetId: 4b6cf1bb-14d2-3da2-cd5a-77f151026a1a
            port: SUCCESS
    results:
      SUCCESS:
        4b6cf1bb-14d2-3da2-cd5a-77f151026a1a:
          x: 235
          'y': 72
