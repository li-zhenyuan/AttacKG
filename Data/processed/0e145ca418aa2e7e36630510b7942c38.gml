graph [
  directed 1
  node [
    id 0
    label "Learn@ExeFile"
    type "ExeFile"
    nlp "Learn"
  ]
  node [
    id 1
    label "Documentation@DocumentFile"
    type "DocumentFile"
    nlp "Documentation"
  ]
  node [
    id 2
    label "Credentials@DocumentFile"
    type "DocumentFile"
    nlp "Credentials"
  ]
  node [
    id 3
    label "section@ExeFile"
    type "ExeFile"
    nlp "section"
  ]
  node [
    id 4
    label "Users@ExeFile"
    type "ExeFile"
    nlp "Users"
  ]
  node [
    id 5
    label "Access@ExeFile"
    type "ExeFile"
    nlp "Access"
  ]
  node [
    id 6
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 7
    label "MFA@ExeFile"
    type "ExeFile"
    nlp "MFA"
  ]
  node [
    id 8
    label "OTP@ExeFile"
    type "ExeFile"
    nlp "OTP"
  ]
  node [
    id 9
    label "column@ExeFile"
    type "ExeFile"
    nlp "column"
  ]
  node [
    id 10
    label "permissions@ExeFile"
    type "ExeFile"
    nlp "permissions"
  ]
  node [
    id 11
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 12
    label "Console@ExeFile"
    type "ExeFile"
    nlp "Console"
  ]
  node [
    id 13
    label "Javascript@ExeFile"
    type "ExeFile"
    nlp "Javascript"
  ]
  edge [
    source 0
    target 1
    action "Explore"
  ]
  edge [
    source 3
    target 4
    action "make"
  ]
  edge [
    source 6
    target 8
    action "signing"
  ]
  edge [
    source 7
    target 7
    action "been"
  ]
  edge [
    source 9
    target 7
    action "enabled"
  ]
]
