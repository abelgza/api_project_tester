*** Settings ***
Library         REST    http://localhost:3000
Documentation   Test data can be read from variables and files.
...             Both JSON and Python type systems are supported for inputs.
...             Every request creates a so-called instance. Can be `Output`.
...             Most keywords are effective only for the last instance.
...             Initial schemas are autogenerated for request and response.
...             You can make them more detailed by using assertion keywords.
...             The assertion keywords correspond to the JSON types.
...             They take in either path to the property or a JSONPath query.
...             Using (enum) values in tests optional. Only type is required.
...             All the JSON Schema validation keywords are also supported.
...             Thus, there is no need to write any own validation logic.
...             Not a long path from schemas to full Swagger/OpenAPI specs.
...             The persistence of the created instances is the test suite.
...             Use keyword `Rest instances` to output the created instances.


*** Variables ***
${json}         {    "topics": "","thumbnail": "/img/tr-3.jpeg","url": "index.html","overrideURL": "","linkType": "","title": "Created by Postman","summary": "Lorem ipsum dolor sit amet"}


*** Test Cases ***
POST with valid params to create a new user, can be output to a file
    POST        /events                     ${json}
    Integer     response status           200
    [Teardown]  Output  response body     ${OUTPUTDIR}/new_user.demo.json

POST with valid params to create a new user, can be output to a file
    POST        /messages1                     ${json}
    Integer     response status           404

POST with valid params to create a new user, can be output to a file
    POST        /message21                     ${json}
    Integer     response status           200
