graph [
  directed 1
  node [
    id 0
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 1
    label "HTML@ExeFile"
    type "ExeFile"
    nlp "HTML"
  ]
  edge [
    source 0
    target 1
    action "prepend"
  ]
]
