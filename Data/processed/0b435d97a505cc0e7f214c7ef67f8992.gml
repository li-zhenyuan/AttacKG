graph [
  directed 1
  node [
    id 0
    label "header@ExeFile"
    type "ExeFile"
    nlp "header"
  ]
  node [
    id 1
    label "HTTP@ExeFile"
    type "ExeFile"
    nlp "HTTP"
  ]
  node [
    id 2
    label "HTTPS@ExeFile"
    type "ExeFile"
    nlp "HTTPS"
  ]
  node [
    id 3
    label "web@ExeFile"
    type "ExeFile"
    nlp "web"
  ]
  node [
    id 4
    label "policy@ExeFile"
    type "ExeFile"
    nlp "policy"
  ]
  node [
    id 5
    label "HPKP@ExeFile"
    type "ExeFile"
    nlp "HPKP"
  ]
  node [
    id 6
    label "policies@ExeFile"
    type "ExeFile"
    nlp "policies"
  ]
  node [
    id 7
    label "violation@ExeFile"
    type "ExeFile"
    nlp "violation"
  ]
  node [
    id 8
    label "URI@ExeFile"
    type "ExeFile"
    nlp "URI"
  ]
  node [
    id 9
    label "IPsec@ExeFile"
    type "ExeFile"
    nlp "IPsec"
  ]
  node [
    id 10
    label "exploitsTransport@Vulnerability"
    type "Vulnerability"
    nlp "exploitsTransport"
  ]
  node [
    id 11
    label "version@ExeFile"
    type "ExeFile"
    nlp "version"
  ]
  node [
    id 12
    label "PDFPrintable@ExeFile"
    type "ExeFile"
    nlp "PDFPrintable"
  ]
  edge [
    source 0
    target 1
    action "delivered"
  ]
  edge [
    source 2
    target 3
    action "combat"
  ]
  edge [
    source 4
    target 5
    action "specifies"
  ]
  edge [
    source 5
    target 8
    action "be"
  ]
  edge [
    source 6
    target 5
    action "produce"
  ]
  edge [
    source 7
    target 5
    action "be"
  ]
  edge [
    source 8
    target 2
    action "be"
  ]
]
