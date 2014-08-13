return unless Emoji?

replaceInNodes = (cont, pattern, replacement) ->
  switch cont.nodeType
    when 3
      cont.data = cont.data.replace pattern, replacement
    when 1
      for child in cont.childNodes
        replaceInNodes child, pattern, replacement 
  return

Emoji.editableVal = do (func = Emoji.editableVal) ->
  (cont) ->
    if arguments.callee.caller is IM?.send
      replaceInNodes cont, /\s/g, '&#8194;'
    func.apply this, arguments
