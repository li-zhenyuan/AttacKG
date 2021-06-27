graph [
  directed 1
  node [
    id 0
    label "utility@ExeFile"
    type "ExeFile"
    nlp "utility"
  ]
  node [
    id 1
    label "SysKey@ExeFile"
    type "ExeFile"
    nlp "SysKey"
  ]
  node [
    id 2
    label "Teams\r@APTFamily"
    type "APTFamily"
    nlp "Teams\r"
  ]
  node [
    id 3
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  node [
    id 4
    label "database@ExeFile"
    type "ExeFile"
    nlp "database"
  ]
  node [
    id 5
    label "SAM@ExeFile"
    type "ExeFile"
    nlp "SAM"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "Startup@ExeFile"
    type "ExeFile"
    nlp "Startup"
  ]
  node [
    id 8
    label "password.\r@ExeFile"
    type "ExeFile"
    nlp "password.\r"
  ]
  node [
    id 9
    label "utility.\r@ExeFile"
    type "ExeFile"
    nlp "utility.\r"
  ]
  edge [
    source 0
    target 1
    action "secure"
  ]
  edge [
    source 1
    target 3
    action "see"
  ]
  edge [
    source 1
    target 4
    action "access"
  ]
  edge [
    source 1
    target 6
    action "secure"
  ]
  edge [
    source 1
    target 9
    action "\r"
  ]
  edge [
    source 4
    target 5
    action "provides"
  ]
  edge [
    source 5
    target 4
    action "moving"
  ]
  edge [
    source 7
    target 8
    action "type"
  ]
]
