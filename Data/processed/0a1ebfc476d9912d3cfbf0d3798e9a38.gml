graph [
  directed 1
  node [
    id 0
    label "system@ExeFile"
    type "ExeFile"
    nlp "system"
  ]
  node [
    id 1
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 4
    label "GUID@ExeFile"
    type "ExeFile"
    nlp "GUID"
  ]
  node [
    id 5
    label "Description@ExeFile"
    type "ExeFile"
    nlp "Description"
  ]
  node [
    id 6
    label "field@ExeFile"
    type "ExeFile"
    nlp "field"
  ]
  node [
    id 7
    label "addresses@ExeFile"
    type "ExeFile"
    nlp "addresses"
  ]
  node [
    id 8
    label "IP@ExeFile"
    type "ExeFile"
    nlp "IP"
  ]
  node [
    id 9
    label "UtcTime@ExeFile"
    type "ExeFile"
    nlp "UtcTime"
  ]
  node [
    id 10
    label "option@ExeFile"
    type "ExeFile"
    nlp "option"
  ]
  node [
    id 11
    label "\xe2\x80\x93l@ExeFile"
    type "ExeFile"
    nlp "\xe2\x80\x93l"
  ]
  node [
    id 12
    label "fields@ExeFile"
    type "ExeFile"
    nlp "fields"
  ]
  node [
    id 13
    label "StartFunction@ExeFile"
    type "ExeFile"
    nlp "StartFunction"
  ]
  node [
    id 14
    label "credentials@DocumentFile"
    type "DocumentFile"
    nlp "credentials"
  ]
  node [
    id 15
    label "Lsass.exe@ExeFile"
    type "ExeFile"
    nlp "Lsass.exe"
  ]
  node [
    id 16
    label "namespace@ExeFile"
    type "ExeFile"
    nlp "namespace"
  ]
  node [
    id 17
    label "WMI@ExeFile"
    type "ExeFile"
    nlp "WMI"
  ]
  node [
    id 18
    label "consumers@ExeFile"
    type "ExeFile"
    nlp "consumers"
  ]
  node [
    id 19
    label "lookup@ExeFile"
    type "ExeFile"
    nlp "lookup"
  ]
  node [
    id 20
    label "DNS@ExeFile"
    type "ExeFile"
    nlp "DNS"
  ]
  node [
    id 21
    label "Command@ExeFile"
    type "ExeFile"
    nlp "Command"
  ]
  node [
    id 22
    label "node@ExeFile"
    type "ExeFile"
    nlp "node"
  ]
  node [
    id 23
    label "EventFiltering@ExeFile"
    type "ExeFile"
    nlp "EventFiltering"
  ]
  node [
    id 24
    label "ProcessAccess@ExeFile"
    type "ExeFile"
    nlp "ProcessAccess"
  ]
  node [
    id 25
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 26
    label "condition=&#34;contains&#34;>100</CommandLine@ExeFile"
    type "ExeFile"
    nlp "condition=&#34;contains&#34;>100</CommandLine"
  ]
  node [
    id 27
    label "CommandLine@ExeFile"
    type "ExeFile"
    nlp "CommandLine"
  ]
  node [
    id 28
    label "\r@ExeFile"
    type "ExeFile"
    nlp "\r"
  ]
  edge [
    source 0
    target 1
    action "remains"
  ]
  edge [
    source 7
    target 8
    action "contains"
  ]
  edge [
    source 10
    target 11
    action "be"
  ]
  edge [
    source 12
    target 13
    action "exported"
  ]
  edge [
    source 14
    target 15
    action "steal"
  ]
  edge [
    source 16
    target 17
    action "is"
  ]
  edge [
    source 17
    target 2
    action "used"
  ]
  edge [
    source 18
    target 17
    action "recording"
  ]
  edge [
    source 19
    target 20
    action "reverse"
  ]
  edge [
    source 22
    target 23
    action "has"
  ]
  edge [
    source 26
    target 27
    action "generate"
  ]
  edge [
    source 27
    target 3
    action "generate"
  ]
]
