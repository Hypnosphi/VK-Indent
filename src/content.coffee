# this tiny content script makes an injection to *://vk.com/*
scriptElement = document.createElement 'script'
scriptElement.src = chrome.extension.getURL('js/inject.js')
scriptElement.addEventListener 'load', (e) ->
  document.body.removeChild scriptElement
document.body.appendChild scriptElement
