updateOrAddParam = (url, param, value) ->
  re = new RegExp("([?|&])" + param + "=.*?(&|$)", "i")
  separator = if url.indexOf('?') != -1 then "&" else "?"
  encodedValue=encodeURIComponent(value)
  if url.match(re)
    url.replace(re,'$1'+param+'='+encodedValue+'$2')
  else
    url+separator+param+'='+encodedValue

filterByProjectName = ->
  projectName = $('#projectName').val()
  newUrl = updateOrAddParam(document.URL, "projectName", projectName)
  pageResetUrl = updateOrAddParam(newUrl, "page", "1")
  window.location = pageResetUrl

$ ->
  $('.dropdown-toggle').dropdown()
  $('.dropdown input, .dropdown label').click((e) -> e.stopPropagation())
  $('#projectNameGo').click => filterByProjectName()
  $('#projectName').keypress((e) -> if e.which == 13 then filterByProjectName())