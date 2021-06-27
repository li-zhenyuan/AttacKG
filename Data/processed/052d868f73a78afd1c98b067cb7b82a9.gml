graph [
  directed 1
  node [
    id 0
    label "AWSDocumentationAWS@DocumentFile"
    type "DocumentFile"
    nlp "AWSDocumentationAWS"
  ]
  node [
    id 1
    label "events@ExeFile"
    type "ExeFile"
    nlp "events"
  ]
  node [
    id 2
    label "CloudTrail@ExeFile"
    type "ExeFile"
    nlp "CloudTrail"
  ]
  node [
    id 3
    label "console@ExeFile"
    type "ExeFile"
    nlp "console"
  ]
  node [
    id 4
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 5
    label "Javascript@ExeFile"
    type "ExeFile"
    nlp "Javascript"
  ]
  node [
    id 6
    label "Documentation@DocumentFile"
    type "DocumentFile"
    nlp "Documentation"
  ]
  node [
    id 7
    label "Document@DocumentFile"
    type "DocumentFile"
    nlp "Document"
  ]
  node [
    id 8
    label "documentation@DocumentFile"
    type "DocumentFile"
    nlp "documentation"
  ]
  edge [
    source 1
    target 2
    action "open"
  ]
  edge [
    source 2
    target 3
    action "open"
  ]
  edge [
    source 3
    target 2
    action "open"
  ]
  edge [
    source 5
    target 6
    action "use"
  ]
]
