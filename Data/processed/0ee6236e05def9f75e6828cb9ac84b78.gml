graph [
  directed 1
  node [
    id 0
    label "Email@NetLoc"
    type "NetLoc"
    nlp "Email"
  ]
  node [
    id 1
    label "Documentation@DocumentFile"
    type "DocumentFile"
    nlp "Documentation"
  ]
  node [
    id 2
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 3
    label "malware\xe2\x80\x99s@ExeFile"
    type "ExeFile"
    nlp "malware\xe2\x80\x99s"
  ]
  node [
    id 4
    label "operations@ExeFile"
    type "ExeFile"
    nlp "operations"
  ]
  node [
    id 5
    label "ATM@ExeFile"
    type "ExeFile"
    nlp "ATM"
  ]
  node [
    id 6
    label "CnC@ExeFile"
    type "ExeFile"
    nlp "CnC"
  ]
  node [
    id 7
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 8
    label "task@Service"
    type "Service"
    nlp "task"
  ]
  node [
    id 9
    label "VBR@ExeFile"
    type "ExeFile"
    nlp "VBR"
  ]
  node [
    id 10
    label "Windows@ExeFile"
    type "ExeFile"
    nlp "Windows"
  ]
  node [
    id 11
    label "operating@ExeFile"
    type "ExeFile"
    nlp "operating"
  ]
  node [
    id 12
    label "system@ExeFile"
    type "ExeFile"
    nlp "system"
  ]
  node [
    id 13
    label "payload@ExeFile"
    type "ExeFile"
    nlp "payload"
  ]
  node [
    id 14
    label "kernel@ExeFile"
    type "ExeFile"
    nlp "kernel"
  ]
  node [
    id 15
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 16
    label "boot@ExeFile"
    type "ExeFile"
    nlp "boot"
  ]
  node [
    id 17
    label "MBR@ExeFile"
    type "ExeFile"
    nlp "MBR"
  ]
  node [
    id 18
    label "installer@ExeFile"
    type "ExeFile"
    nlp "installer"
  ]
  node [
    id 19
    label "BOOTRASH@ExeFile"
    type "ExeFile"
    nlp "BOOTRASH"
  ]
  node [
    id 20
    label "code@ExeFile"
    type "ExeFile"
    nlp "code"
  ]
  node [
    id 21
    label "registry@ExeFile"
    type "ExeFile"
    nlp "registry"
  ]
  node [
    id 22
    label "HKCU\\.Default\\Identities@ExeFile"
    type "ExeFile"
    nlp "HKCU\\.Default\\Identities"
  ]
  node [
    id 23
    label "components@ExeFile"
    type "ExeFile"
    nlp "components"
  ]
  node [
    id 24
    label "Nemesis@ExeFile"
    type "ExeFile"
    nlp "Nemesis"
  ]
  node [
    id 25
    label "interrupt[6@ExeFile"
    type "ExeFile"
    nlp "interrupt[6"
  ]
  node [
    id 26
    label "BIOS@ExeFile"
    type "ExeFile"
    nlp "BIOS"
  ]
  node [
    id 27
    label "Descriptor@ExeFile"
    type "ExeFile"
    nlp "Descriptor"
  ]
  node [
    id 28
    label "CPU@ExeFile"
    type "ExeFile"
    nlp "CPU"
  ]
  node [
    id 29
    label "actors@APTFamily"
    type "APTFamily"
    nlp "actors"
  ]
  node [
    id 30
    label "DLL@ExeFile"
    type "ExeFile"
    nlp "DLL"
  ]
  node [
    id 31
    label "search@ExeFile"
    type "ExeFile"
    nlp "search"
  ]
  node [
    id 32
    label "VFS@ExeFile"
    type "ExeFile"
    nlp "VFS"
  ]
  node [
    id 33
    label "MIR@ExeFile"
    type "ExeFile"
    nlp "MIR"
  ]
  node [
    id 34
    label "services@ExeFile"
    type "ExeFile"
    nlp "services"
  ]
  node [
    id 35
    label "Core@ExeFile"
    type "ExeFile"
    nlp "Core"
  ]
  node [
    id 36
    label "driver@ExeFile"
    type "ExeFile"
    nlp "driver"
  ]
  node [
    id 37
    label "http://www.malwaretech.com/2014/11/virtual-file-systems-for-beginners.html@ExeFile"
    type "ExeFile"
    nlp "http://www.malwaretech.com/2014/11/virtual-file-systems-for-beginners.html"
  ]
  node [
    id 38
    label "email@NetLoc"
    type "NetLoc"
    nlp "email"
  ]
  node [
    id 39
    label "Documents@DocumentFile"
    type "DocumentFile"
    nlp "Documents"
  ]
  edge [
    source 2
    target 2
    action "are"
  ]
  edge [
    source 2
    target 6
    action "used"
  ]
  edge [
    source 2
    target 18
    action "is"
  ]
  edge [
    source 2
    target 30
    action "using"
  ]
  edge [
    source 2
    target 32
    action "are"
  ]
  edge [
    source 3
    target 2
    action "eradicate"
  ]
  edge [
    source 4
    target 5
    action "speaking"
  ]
  edge [
    source 6
    target 7
    action "used"
  ]
  edge [
    source 9
    target 10
    action "loading"
  ]
  edge [
    source 10
    target 11
    action "executed"
  ]
  edge [
    source 12
    target 10
    action "is"
  ]
  edge [
    source 13
    target 2
    action "load"
  ]
  edge [
    source 14
    target 10
    action "injects"
  ]
  edge [
    source 16
    target 17
    action "has"
  ]
  edge [
    source 18
    target 19
    action "is"
  ]
  edge [
    source 20
    target 9
    action "encoded"
  ]
  edge [
    source 21
    target 22
    action "be"
  ]
  edge [
    source 21
    target 10
    action "scanned"
  ]
  edge [
    source 23
    target 24
    action "assist"
  ]
  edge [
    source 25
    target 26
    action "intercept"
  ]
  edge [
    source 27
    target 28
    action "changes"
  ]
  edge [
    source 29
    target 29
    action "targeted"
  ]
  edge [
    source 30
    target 31
    action "using"
  ]
  edge [
    source 32
    target 13
    action "load"
  ]
  edge [
    source 32
    target 21
    action "scanned"
  ]
  edge [
    source 33
    target 2
    action "provides"
  ]
]
