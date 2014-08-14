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
        replaceInNodes node, /\s/g, '&#8194;'
      func.apply this, arguments
