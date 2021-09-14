graph [
  directed 1
  node [
    id 0
    label "actors#actor#2"
    type "actor"
    nlp "actors"
    regex ""
  ]
  node [
    id 1
    label "documents#file#8"
    type "file"
    nlp "documents"
    regex ""
  ]
  node [
    id 2
    label "word#file#7"
    type "file"
    nlp "Microsoft Word"
    regex ""
  ]
  node [
    id 3
    label "email#network#12"
    type "network"
    nlp "email"
    regex ""
  ]
  node [
    id 4
    label "talos#file#14"
    type "file"
    nlp "Talos"
    regex ""
  ]
  node [
    id 5
    label "document#file#17"
    type "file"
    nlp "document"
    regex ""
  ]
  node [
    id 6
    label "document#file#20"
    type "file"
    nlp "document"
    regex "MinutesofMeeting-2May19.docx"
  ]
  node [
    id 7
    label "jordan#file#30"
    type "file"
    nlp "Jordan"
    regex ""
  ]
  node [
    id 8
    label "template#file#43"
    type "file"
    nlp "template"
    regex ""
  ]
  node [
    id 9
    label "document#file#37"
    type "file"
    nlp "document"
    regex ""
  ]
  node [
    id 10
    label "network#network#51"
    type "network"
    nlp "network"
    regex "hxxp://droobox[.]online:80/luncher.doc"
  ]
  node [
    id 11
    label "actor#actor#46"
    type "actor"
    nlp "actor"
    regex ""
  ]
  node [
    id 12
    label "document#file#55"
    type "file"
    nlp "document"
    regex "luncher.doc"
  ]
  node [
    id 13
    label "code#executable#65"
    type "executable"
    nlp "code"
    regex ""
  ]
  node [
    id 14
    label "file#file#77"
    type "file"
    nlp "file"
    regex ""
  ]
  node [
    id 15
    label "commands#executable#87"
    type "executable"
    nlp "commands"
    regex ""
  ]
  node [
    id 16
    label "powershell#executable#86"
    type "executable"
    nlp "PowerShell"
    regex ""
  ]
  node [
    id 17
    label "stager#executable#92"
    type "executable"
    nlp "stager"
    regex ""
  ]
  node [
    id 18
    label "registry#registry#102"
    type "registry"
    nlp "registry"
    regex "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
  ]
  node [
    id 19
    label "registry#registry#103"
    type "registry"
    nlp "Registry"
    regex ""
  ]
  node [
    id 20
    label "commands#executable#118"
    type "executable"
    nlp "commands"
    regex ""
  ]
  node [
    id 21
    label "powershell#executable#117"
    type "executable"
    nlp "PowerShell"
    regex ""
  ]
  node [
    id 22
    label "stager#executable#123"
    type "executable"
    nlp "stager"
    regex ""
  ]
  edge [
    source 0
    target 1
    action ""
  ]
  edge [
    source 1
    target 2
    action ""
  ]
  edge [
    source 2
    target 3
    action ""
  ]
  edge [
    source 4
    target 5
    action ""
  ]
  edge [
    source 4
    target 8
    action ""
  ]
  edge [
    source 4
    target 12
    action ""
  ]
  edge [
    source 5
    target 6
    action ""
  ]
  edge [
    source 5
    target 10
    action ""
  ]
  edge [
    source 5
    target 13
    action ""
  ]
  edge [
    source 6
    target 7
    action ""
  ]
  edge [
    source 8
    target 9
    action ""
  ]
  edge [
    source 9
    target 5
    action ""
  ]
  edge [
    source 10
    target 11
    action ""
  ]
  edge [
    source 12
    target 5
    action ""
  ]
  edge [
    source 14
    target 15
    action ""
  ]
  edge [
    source 14
    target 18
    action ""
  ]
  edge [
    source 15
    target 16
    action ""
  ]
  edge [
    source 16
    target 17
    action ""
  ]
  edge [
    source 17
    target 14
    action ""
  ]
  edge [
    source 18
    target 19
    action ""
  ]
  edge [
    source 20
    target 21
    action ""
  ]
  edge [
    source 21
    target 22
    action ""
  ]
]
