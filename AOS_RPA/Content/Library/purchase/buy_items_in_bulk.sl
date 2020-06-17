namespace: purchase
flow:
  name: buy_items_in_bulk
  inputs:
    - excel_path: "C:\\Enablement\\HotLabs\\AOS\\shopping_list.xlsx"
    - sheet_name: Users
    - pdf_path: "C:\\Enablement\\HotLabs\\AOS\\shopping_list_letter.pdf"
    - username_header: Username
    - password_header: Password
  workflow:
    - get_users:
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
          - SUCCESS: extract_text_from_pdf
          - FAILURE: on_failure
    - extract_text_from_pdf:
        do:
          io.cloudslang.tesseract.ocr.extract_text_from_pdf:
            - file_path: '${pdf_path}'
            - data_path: "C:\\\\Enablement\\\\tessdata"
            - language: ENG
        publish:
          - text_string
          - items: '${text_string.split("Username Catalog Item")[1].split("Cheers")[0][1:]}'
        navigate:
          - SUCCESS: buy_item
          - FAILURE: on_failure
    - buy_item:
        loop:
          for: row in items.splitlines()
          do:
            purchase.buy_item:
              - username: '${row.split()[0]}'
              - password: '${eval(map).get(username)}'
              - catalog: '${row.split()[1]}'
              - item: '${row.split(None, 2)[2]}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_users:
        x: 90
        'y': 89
      extract_text_from_pdf:
        x: 94
        'y': 258
      buy_item:
        x: 298
        'y': 163
        navigate:
          f3d302d2-ffe7-6034-918f-29939195bd4e:
            targetId: 4484f5d8-4996-9bdb-bec0-030343480237
            port: SUCCESS
    results:
      SUCCESS:
        4484f5d8-4996-9bdb-bec0-030343480237:
          x: 473
          'y': 132
