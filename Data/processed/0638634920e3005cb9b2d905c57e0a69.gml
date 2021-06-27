graph [
  directed 1
  node [
    id 0
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 1
    label "factor@APTFamily"
    type "APTFamily"
    nlp "factor"
  ]
  node [
    id 2
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 3
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 4
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 5
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 6
    label "commands@ExeFile"
    type "ExeFile"
    nlp "commands"
  ]
  node [
    id 7
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 8
    label "phishlet@ExeFile"
    type "ExeFile"
    nlp "phishlet"
  ]
  node [
    id 9
    label "LinkedIn@ExeFile"
    type "ExeFile"
    nlp "LinkedIn"
  ]
  node [
    id 10
    label "browser@ExeFile"
    type "ExeFile"
    nlp "browser"
  ]
  node [
    id 11
    label "Chrome@ExeFile"
    type "ExeFile"
    nlp "Chrome"
  ]
  edge [
    source 0
    target 1
    action "Gone"
  ]
  edge [
    source 3
    target 4
    action "use"
  ]
  edge [
    source 7
    target 6
    action "see"
  ]
  edge [
    source 8
    target 9
    action "use"
  ]
  edge [
    source 10
    target 11
    action "using"
  ]
]
