graph [
  directed 1
  node [
    id 0
    label "Credential@DocumentFile"
    type "DocumentFile"
    nlp "Credential"
  ]
  node [
    id 1
    label "Document@DocumentFile"
    type "DocumentFile"
    nlp "Document"
  ]
  node [
    id 2
    label "Team@APTFamily"
    type "APTFamily"
    nlp "Team"
  ]
  node [
    id 3
    label "refactoring@APTFamily"
    type "APTFamily"
    nlp "refactoring"
  ]
  node [
    id 4
    label "credentials.json@DocumentFile"
    type "DocumentFile"
    nlp "credentials.json"
  ]
  node [
    id 5
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 6
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 7
    label "document\@DocumentFile"
    type "DocumentFile"
    nlp "document\"
  ]
  node [
    id 8
    label "officedocument.wordprocessingml.template@DocumentFile"
    type "DocumentFile"
    nlp "officedocument.wordprocessingml.template"
  ]
  node [
    id 9
    label "server@ExeFile"
    type "ExeFile"
    nlp "server"
  ]
  node [
    id 10
    label "HTTP@ExeFile"
    type "ExeFile"
    nlp "HTTP"
  ]
  edge [
    source 0
    target 1
    action "Enabled"
  ]
  edge [
    source 8
    target 1
    action "needed"
  ]
  edge [
    source 9
    target 10
    action "configured"
  ]
]
