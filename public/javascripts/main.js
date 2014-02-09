// Using multiple unit types within one animation.
 <!-- click funtion <button id="go">&raquo; Run</button> $( "#go" ).click(function() {} -->

$( document ).ready(function() {

  $(".argument").slideDown(800)

  $(".bg-primary").hover(function(){
    $(this).css("opacity","1")
    $(this).find('.votes').slideToggle();
  }, function() {
    $(this).css("opacity","0.7");
    $(this).find('.votes').slideToggle();
  });

});

// this function will reverse the animation

var animationReverse = function() {

$( "#secondblock" ).animate({
  width: "0%",
  opacity: 0,
  marginLeft: "1.0in",
  fontSize: "3em",
  borderWidth: "0px"
}, 2500 );

$( "#thirdblock" ).animate({
  width: "0%",
  opacity: 0,
  marginLeft: "3.0in",
  fontSize: "3em",
  borderWidth: "0px"
}, 2500 );

  // this function will display the content boxes

var animationappear = function() {

  $( "#firstblock" ).animate({
    width: "70%",
    opacity: 0.4,
    marginLeft: "1.0in",
    fontSize: "3em",
    borderWidth: "1px"
  }, 1000 );

  $( "#secondblock" ).animate({
    width: "70%",
    opacity: 0.4,
    marginLeft: "2.0in",
    marginRight: "0.2in",
    fontSize: "2em",
    borderWidth: "0px"
  }, 400 );

  $( "#thirdblock" ).animate({
    width: "70%",
    opacity: 0.4,
    marginLeft: "0.2in",
    fontSize: "2em",
    borderWidth: "0px"
  }, 400 );

}
}
