 // setters and getters

 var argumentone = function(one) {argumentone = one;}
 var argumenttwo = function(two) {argumenttwo = two;}
 var argumentthee = function(three) {argumentthree = three;}

    var argumentone = "Blah Blah Blah .....................................................";
    var argumenttwo = "YES!";
    var argumentthree = "NO!";
var v = $('#firstblock');
$('<span />').text(v.text()).appendTo($(v).empty()).fadeOut(2000).promise().done(function() {
    $(this).text(argumentone).fadeIn(2000).promise().done(function() {
    v.text($(this).text());
        $(this).remove();
  });
  });


  var p = $('#secondblock');
$('<span />').text(p.text()).appendTo($(p).empty()).fadeOut(2000).promise().done(function() {
    $(this).text(argumenttwo).fadeIn(2000).promise().done(function() {
    p.text($(this).text());
        $(this).remove();
  });
  });

    var j = $('#thirdblock');
$('<span />').text(j.text()).appendTo($(j).empty()).fadeOut(2000).promise().done(function() {
    $(this).text(argumentthree).fadeIn(2000).promise().done(function() {
    j.text($(this).text());
        $(this).remove();
  });
  });


// Using multiple unit types within one animation.
 <!-- click funtion <button id="go">&raquo; Run</button> $( "#go" ).click(function() {} -->


 // hover effects




$( document ).ready(function() {

  $(".argument").slideDown(1500)

  $(".bg-primary").hover(function(){
    $(this).css("opacity","1")
  }, function() {
    $(this).css("opacity","0.7");
  });

  $(".bg-primary").on("click", function(){
    var id = $(this).data("args");
    alert(id);
  })

  //animationappear();
});

// this function will reverse the animation

var animationReverse = function() {
  // Handler for .ready() called.
   /* $( "#firstblock" ).animate({

    width: "0%",
    opacity: 0,
    marginLeft: "1.0in",
    fontSize: "3em",
    borderWidth: "1px"

  }, 2500 );

    argumentone()

})*/


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