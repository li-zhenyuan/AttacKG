graph [
  directed 1
  node [
    id 0
    label "article@ExeFile"
    type "ExeFile"
    nlp "article"
  ]
  node [
    id 1
    label "MSDN@ExeFile"
    type "ExeFile"
    nlp "MSDN"
  ]
  node [
    id 2
    label "Factors@APTFamily"
    type "APTFamily"
    nlp "Factors"
  ]
  node [
    id 3
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 4
    label "exploit@Vulnerability"
    type "Vulnerability"
    nlp "exploit"
  ]
  node [
    id 5
    label "documents@DocumentFile"
    type "DocumentFile"
    nlp "documents"
  ]
  node [
    id 6
    label "CWD@ExeFile"
    type "ExeFile"
    nlp "CWD"
  ]
  node [
    id 7
    label "WebDAV@ExeFile"
    type "ExeFile"
    nlp "WebDAV"
  ]
  node [
    id 8
    label "publishing@ExeFile"
    type "ExeFile"
    nlp "publishing"
  ]
  node [
    id 9
    label "directory@ExeFile"
    type "ExeFile"
    nlp "directory"
  ]
  node [
    id 10
    label "shares@ExeFile"
    type "ExeFile"
    nlp "shares"
  ]
  node [
    id 11
    label "service@ExeFile"
    type "ExeFile"
    nlp "service"
  ]
  node [
    id 12
    label "WebClient@ExeFile"
    type "ExeFile"
    nlp "WebClient"
  ]
  node [
    id 13
    label "LAN@ExeFile"
    type "ExeFile"
    nlp "LAN"
  ]
  node [
    id 14
    label "TechNet@ExeFile"
    type "ExeFile"
    nlp "TechNet"
  ]
  node [
    id 15
    label "subsidiaries@ExeFile"
    type "ExeFile"
    nlp "subsidiaries"
  ]
  node [
    id 16
    label "Microsoft@ExeFile"
    type "ExeFile"
    nlp "Microsoft"
  ]
  node [
    id 17
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 1
    action "see"
  ]
  edge [
    source 0
    target 14
    action "see"
  ]
  edge [
    source 7
    target 8
    action "do"
  ]
  edge [
    source 9
    target 7
    action "Search"
  ]
  edge [
    source 10
    target 7
    action "automated"
  ]
  edge [
    source 11
    target 12
    action "Authoring"
  ]
  edge [
    source 15
    target 16
    action "receive"
  ]
]
