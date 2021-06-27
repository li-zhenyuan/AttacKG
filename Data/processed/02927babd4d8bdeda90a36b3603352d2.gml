graph [
  directed 1
  node [
    id 0
    label "JavaScript@ExeFile"
    type "ExeFile"
    nlp "JavaScript"
  ]
  node [
    id 1
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 2
    label "Factors@APTFamily"
    type "APTFamily"
    nlp "Factors"
  ]
  node [
    id 3
    label "system@ExeFile"
    type "ExeFile"
    nlp "system"
  ]
  node [
    id 4
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 5
    label "&#174;@ExeFile"
    type "ExeFile"
    nlp "&#174;"
  ]
  node [
    id 6
    label "OWASP@ExeFile"
    type "ExeFile"
    nlp "OWASP"
  ]
  node [
    id 7
    label "CHAPTERS@APTFamily"
    type "APTFamily"
    nlp "CHAPTERS"
  ]
  node [
    id 8
    label "logo@ExeFile"
    type "ExeFile"
    nlp "logo"
  ]
  edge [
    source 3
    target 4
    action "find"
  ]
  edge [
    source 5
    target 6
    action "hosting"
  ]
  edge [
    source 8
    target 6
    action "registered"
  ]
]
