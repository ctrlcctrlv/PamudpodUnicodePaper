SILE.registerCommand("requireSpace", function (options, content)
  local required = SILE.measurement(options.height or 0)
  SILE.typesetter:leaveHmode()
  SILE.call("hbox", {}, content) -- push content we want to fit
  local heightOfPageSoFar = SILE.pagebuilder:collateVboxes(SILE.typesetter.state.outputQueue).height
  local heightOfFrame = SILE.typesetter.frame:height()
  table.remove(SILE.typesetter.state.nodes) -- steal it back
  if heightOfFrame - heightOfPageSoFar < required then
    SILE.call("supereject")
  end
end)
