*** Settings ***
Library     RequestsLibrary

*** Variables ***
#${base_url}     http://localhost:8080
${param_key}     name
${param_value}     sachin

*** Test Cases ***
Get_Greeting
    create session  mysession   ${base_url}
    ${response}=    get request     mysession   /greeting?${param_key}=${param_value}
    #log to console  ${response.status_code}

    #Validations
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}  200

    ${body}=    convert to string   ${response.content}
    should contain  ${body}     ${param_value}


    #${contentTypeValue}=get from dictionary     ${response.headers}     Content-Type
    #${contentTypeValue}=    Get From Dictionary     ${response.headers}     Content-Type
    #should be equal     ${contentTypeValue}     application/json
