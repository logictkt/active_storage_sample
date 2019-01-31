addEventListener "direct-upload:initialize", (event) ->
  target = event.target
  detail = event.detail
  id     = detail.id
  file   = detail.file
  target.insertAdjacentHTML "beforebegin", """
    <div id="direct-upload-#{id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-#{id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">#{file.name}</span>
    </div>
  """
addEventListener "direct-upload:start", (event) ->
  detail  = event.detail
  id      = detail.id
  element = document.getElementById("direct-upload-#{id}")
  element.classList.remove("direct-upload--pending")
addEventListener "direct-upload:progress", (event) ->
  detail   = event.detail
  id       = detail.id
  progress = detail.progress
  progressElement = document.getElementById("direct-upload-progress-#{id}")
  progressElement.style.width = "#{progress}%"
addEventListener "direct-upload:error", (event) ->
  event.preventDefault()
  detail  = event.detail
  id      = detail.id
  error   = detail.progress
  element = document.getElementById("direct-upload-#{id}")
  element.classList.add("direct-upload--error")
  element.setAttribute("title", error)
addEventListener "direct-upload:end", (event) ->
  detail  = event.detail
  id      = detail.id
  element = document.getElementById("direct-upload-#{id}")
  element.classList.add("direct-upload--complete")
