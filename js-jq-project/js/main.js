var numOfRnC = 16;
var wrapper = $('.wrapper');
var cellWidth = 96/numOfRnC;
var cellHeight = 92/numOfRnC;

$(document).ready(function() {
	drawGrid();
});

function drawGrid() {
	for(var i = numOfRnC;i>0;i--) {
		for(var j = numOfRnC;j>0;j--) {
			wrapper.append('<div class="cell"></div>');
		}
		wrapper.append('<br>');
	}
	cellWidth = 96/numOfRnC;
	cellHeight = 91/numOfRnC;
	$('.cell').css({width:cellWidth+'%',
		height:cellHeight+'%'});
	/* rainbow-brush (use instead the code below)
	$('.cell').mouseover(function() {
		$(this).css('background-color',function() {
			return '#'+ (Math.floor((Math.random() * 15) + 1)).toString(16)+(Math.floor((Math.random() * 15) + 1)).toString(16)+(Math.floor((Math.random() * 15) + 1)).toString(16)+(Math.floor((Math.random() * 15) + 1)).toString(16)+(Math.floor((Math.random() * 15) + 1)).toString(16)+(Math.floor((Math.random() * 15) + 1)).toString(16);
		});
	});*/
	$('.cell').mouseover(function() {
		$(this).css('background-color',function() {
			var val = parseInt(($(this).css("background-color")).slice(4,7))-25;
			return 'rgb('+(val-25)+','+(val-25)+','+(val-25)+')';
		});
	});
}

function newGame() {
	do {
		numOfRnC = prompt("Please enter number of row/col cells in for a square grid:", 16);
	} while(numOfRnC<0 || numOfRnC>100);
	wrapper.html('');
	drawGrid();
}