graph [
  directed 1
  node [
    id 0
    label "program@ExeFile"
    type "ExeFile"
    nlp "program"
  ]
  node [
    id 1
    label "scripts@ExeFile"
    type "ExeFile"
    nlp "scripts"
  ]
  node [
    id 2
    label "scripting@ExeFile"
    type "ExeFile"
    nlp "scripting"
  ]
  node [
    id 3
    label "malware@ExeFile"
    type "ExeFile"
    nlp "malware"
  ]
  node [
    id 4
    label "extractor@APTFamily"
    type "APTFamily"
    nlp "extractor"
  ]
  node [
    id 5
    label "LZW@ExeFile"
    type "ExeFile"
    nlp "LZW"
  ]
  node [
    id 6
    label "script@ExeFile"
    type "ExeFile"
    nlp "script"
  ]
  node [
    id 7
    label "scripts[edit@ExeFile"
    type "ExeFile"
    nlp "scripts[edit"
  ]
  node [
    id 8
    label "files@ExeFile"
    type "ExeFile"
    nlp "files"
  ]
  node [
    id 9
    label "COM@ExeFile"
    type "ExeFile"
    nlp "COM"
  ]
  node [
    id 10
    label "LZEXE@ExeFile"
    type "ExeFile"
    nlp "LZEXE"
  ]
  node [
    id 11
    label "document@DocumentFile"
    type "DocumentFile"
    nlp "document"
  ]
  node [
    id 12
    label "file@ExeFile"
    type "ExeFile"
    nlp "file"
  ]
  node [
    id 13
    label "EXE@ExeFile"
    type "ExeFile"
    nlp "EXE"
  ]
  node [
    id 14
    label "option@ExeFile"
    type "ExeFile"
    nlp "option"
  ]
  node [
    id 15
    label "EXEPACK@ExeFile"
    type "ExeFile"
    nlp "EXEPACK"
  ]
  node [
    id 16
    label "command@ExeFile"
    type "ExeFile"
    nlp "command"
  ]
  node [
    id 17
    label "home@ExeFile"
    type "ExeFile"
    nlp "home"
  ]
  node [
    id 18
    label "PKLITE@ExeFile"
    type "ExeFile"
    nlp "PKLITE"
  ]
  node [
    id 19
    label "description@ExeFile"
    type "ExeFile"
    nlp "description"
  ]
  node [
    id 20
    label "descriptionShort@ExeFile"
    type "ExeFile"
    nlp "descriptionShort"
  ]
  node [
    id 21
    label "version@ExeFile"
    type "ExeFile"
    nlp "version"
  ]
  node [
    id 22
    label "PDFPrintable@ExeFile"
    type "ExeFile"
    nlp "PDFPrintable"
  ]
  edge [
    source 6
    target 1
    action "removing"
  ]
  edge [
    source 6
    target 6
    action "output"
  ]
  edge [
    source 8
    target 9
    action "compressed"
  ]
  edge [
    source 9
    target 10
    action "compressed"
  ]
  edge [
    source 12
    target 13
    action "has"
  ]
  edge [
    source 14
    target 15
    action "say"
  ]
  edge [
    source 19
    target 20
    action "dates"
  ]
]
