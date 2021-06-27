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
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 2
    label "repos@ExeFile"
    type "ExeFile"
    nlp "repos"
  ]
  node [
    id 3
    label "ECR@ExeFile"
    type "ExeFile"
    nlp "ECR"
  ]
  node [
    id 4
    label "Exploitation@Vulnerability"
    type "Vulnerability"
    nlp "Exploitation"
  ]
  node [
    id 5
    label "functionality@ExeFile"
    type "ExeFile"
    nlp "functionality"
  ]
  node [
    id 6
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 7
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 8
    label "repositories@ExeFile"
    type "ExeFile"
    nlp "repositories"
  ]
  edge [
    source 4
    target 4
    action "README.md"
  ]
  edge [
    source 7
    target 3
    action "explores"
  ]
  edge [
    source 8
    target 7
    action "explores"
  ]
]
