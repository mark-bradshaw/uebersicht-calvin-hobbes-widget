# Use this command to load a random comic strip from the past
command: "curl --silent -L https://www.gocomics.com/random/calvinandhobbes | awk '/data-image/ {print}' | sed 's/data-image=\\\"//g' | sed 's/\"//g'"

# Set the refresh frequency (milliseconds) to every hour
refreshFrequency: 60*60*1000

style: """

  bottom: 10px				// Position widget
  left: 200px

  widget-align = left
  color: #fff
  font-family Helvetica Neue
  background rgba(255, 255, 255, .1)
  padding 20px 20px 20px 20px
  border-radius 5px

  #container
    text-align: widget-align
    position: relative
    clear: both

  .ch-image
    max-height: 35vh		// allow the img to use up at most 35% of the desktop's height
    max-width: 50vw		// allow the img to use up at most 50% of the desktop's width

"""

# Render the output.
render: (output) -> """
  <div id='container'>
  <div>
"""

update: (output, domEl) ->
  try

    # xkcd = JSON.parse(output)
    container = $(domEl).find('#container')
    content =
      """
      <img class="ch-image" src="#{output}" />
      """
    $(container).html content
  catch e
    #console.log e
