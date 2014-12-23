# handles auto resizing of penguu

PERCENT_WIDTH = .3
PERCENT_WIDTH_SIDES = .5
ROTATION = 30

$penguCenter = $('#penguCenter')
$penguLeft = $('#penguLeft')
$penguRight = $('#penguRight')

$(document).ready ()->
	fixPengu()
	$penguLeft.rotate ROTATION*-1
	$penguRight.rotate ROTATION
	
$(window).resize ()->
	fixPengu()
	
fixPengu = () ->	
	$penguCenter.width $('body').width()*PERCENT_WIDTH
	$penguCenter.height $penguCenter.width()
	$penguCenter.centerHorizontal()
	
	$penguLeft.width $penguCenter.width()*PERCENT_WIDTH_SIDES
	$penguLeft.height $penguLeft.width()
	
	$penguRight.width $penguCenter.width()*PERCENT_WIDTH_SIDES
	$penguRight.height $penguRight.width()
		
	
jQuery.fn.centerHorizontal = () ->
	this.css 'display', 'inline'
	this.css 'left', Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px"
	
	return this
	
jQuery.fn.centerVertical = () ->
	this.css 'display', 'block'
	this.css 'top', Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px"
	return this
	
jQuery.fn.rotate = (degrees) ->
	this.css 
		'-webkit-transform': 'rotate('+ degrees + 'deg)',
		'-mos-transform': 'rotate('+ degrees + 'deg)',
		'-ms-transform': 'rotate('+ degrees + 'deg)',
		'transform': 'rotate('+ degrees + 'deg)'
	return this