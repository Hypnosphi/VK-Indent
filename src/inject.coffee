replaceInNodes = (node, pattern, replacement) ->
  switch node.nodeType
    when 3
      node.data = node.data.replace pattern, replacement
    when 1
      for child in node.childNodes
        replaceInNodes child, pattern, replacement 
  return

do replaceEditableVal = ->
  unless Emoji?
    stManager.add 'emoji.js', replaceEditableVal
    return
  Emoji.editableVal = do (func = Emoji.editableVal) ->
    (node) ->
      caller = arguments.callee.caller
      if caller in [
        IM?.send
        IM?.sendNewMsg
        FastChat?.send
        Composer?.getSendParams
      ]
        # replace all the spaces at the beginning of string
        # and all but one space in between two words
        replaceInNodes node, /(^|\b\s)(\s+)\b/g, (match, p1, p2) ->
          p1 + Array(p2.length + 1).join '&#8194;'
      func.apply this, arguments
