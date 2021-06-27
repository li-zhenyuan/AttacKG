graph [
  directed 1
  node [
    id 0
    label "OSINT@ExeFile"
    type "ExeFile"
    nlp "OSINT"
  ]
  node [
    id 1
    label "records@ExeFile"
    type "ExeFile"
    nlp "records"
  ]
  node [
    id 2
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 3
    label "lookup@ExeFile"
    type "ExeFile"
    nlp "lookup"
  ]
  node [
    id 4
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 5
    label "Alexa@ExeFile"
    type "ExeFile"
    nlp "Alexa"
  ]
  node [
    id 6
    label "Top@ExeFile"
    type "ExeFile"
    nlp "Top"
  ]
  node [
    id 7
    label "option@ExeFile"
    type "ExeFile"
    nlp "option"
  ]
  node [
    id 8
    label "PRO@ExeFile"
    type "ExeFile"
    nlp "PRO"
  ]
  node [
    id 9
    label "access@ExeFile"
    type "ExeFile"
    nlp "access"
  ]
  node [
    id 10
    label "BASIC@ExeFile"
    type "ExeFile"
    nlp "BASIC"
  ]
  edge [
    source 1
    target 2
    action "Map"
  ]
  edge [
    source 3
    target 2
    action "find"
  ]
  edge [
    source 4
    target 5
    action "relies"
  ]
  edge [
    source 5
    target 6
    action "relies"
  ]
  edge [
    source 7
    target 8
    action "have"
  ]
  edge [
    source 9
    target 10
    action "does"
  ]
]
