graph [
  directed 1
  node [
    id 0
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 1
    label "Commands@ExeFile"
    type "ExeFile"
    nlp "Commands"
  ]
  node [
    id 2
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 3
    label "Credentials@DocumentFile"
    type "DocumentFile"
    nlp "Credentials"
  ]
  node [
    id 4
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 5
    label "tasks@Service"
    type "Service"
    nlp "tasks"
  ]
  edge [
    source 4
    target 4
    action "dpapi"
  ]
  edge [
    source 4
    target 5
    action "scheduled"
  ]
]
