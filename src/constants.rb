S_ERB = {
  l: "<%",
  r: "%>"
}
SPECIAL_SYMBOLS_ERB = {
  row: {
    l: S_ERB[:l],
    r: S_ERB[:r]
  },
  return: {
    l: S_ERB[:l],
    r: S_ERB[:r]
  }
}
FILE_TYPES = {
  via: "via",
  erb: "erb"
}
VERSIONS = [
  "Version is 1.0b1 (2022-07-22)",
  "Version is 1.0b2 (2022-08-19)",
]
TEMPLATE_PATH = "share/templates"
RETURN_COMMENT = {
  i_s: [
    '="=',
    "='="
  ],
  i_e: [
    '"',
    "'"
  ]
}