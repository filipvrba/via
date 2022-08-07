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
]
TEMPLATE_PATH = "share/templates"