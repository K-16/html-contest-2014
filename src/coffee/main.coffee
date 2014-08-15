random = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

# Рисуем звёзды
drawStars = ->
  canvas = $('#stars')[0]
  context = canvas.getContext('2d')

  context.clearRect 0, 0, canvas.width, canvas.height

  for i in [0...1000]
    context.fillStyle = '#fff'
    context.fillRect random(0, canvas.width), random(0, canvas.height), 1, 1
  return

# Центрируем блок, который этого просит
verticalСentering = ->
  $('.vertical-center').each ->
    $(this).css 'top', ($(this).parent().height() - $(this).height()) / 2

  $('.arrow').each ->
    $(this).css 'top', $(this).parent().height() / -2

elementsInit = -> # нужно название получше
  $('#stars').attr
    width: window.innerWidth
    height: window.innerHeight

  drawStars()
  verticalСentering()

$ ->
  # Задаём отступы у панелей
  $('.panel').each (i) ->
    $(this).css 'top', i * 100 + '%'

  elementsInit()
  $(window).on 'resize', elementsInit # костыль, фу