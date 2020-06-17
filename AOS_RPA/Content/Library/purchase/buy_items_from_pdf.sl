namespace: purchase
flow:
  name: buy_items_from_pdf
  inputs:
    - pdf_path: "C:\\Enablement\\HotLabs\\AOS\\shopping_list_letter.pdf"
  workflow:
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
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - items: '${items}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      extract_text_from_pdf:
        x: 115
        'y': 91
        navigate:
          941c1847-3958-2138-a332-b0aefb75f0fa:
            targetId: b4ddb8a5-b175-0d35-57c8-68fea244aa25
            port: SUCCESS
    results:
      SUCCESS:
        b4ddb8a5-b175-0d35-57c8-68fea244aa25:
          x: 285
          'y': 82
