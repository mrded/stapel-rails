//= require stapel/modernizr.custom.63321
//= require stapel/jquery.stapel

$(document).ready(function() {
  var options = $(".stapel-options").data('options');
  var $grid = $( '#tp-grid' ),
    $name = $( '#name' ),
    $close = $( '#close' ),
    $loader = $( '<div class="loader"><i></i><i></i><i></i><i></i><i></i><i></i><span>Loading...</span></div>' ).insertBefore( $grid ),
    stapel = $grid.stapel( {
      randomAngle : options.randomAngle,
      delay : options.delay,
      gutter : options.gutter,
      pileAngles : options.pileAngles,
      onLoad : function() {
        $loader.remove();
      },
      onBeforeOpen : function( pileName ) {
        $name.html( pileName );
      },
      onAfterOpen : function( pileName ) {
        $close.show();
      }
    } );

  $close.on( 'click', function() {
    $close.hide();
    $name.empty();
    stapel.closePile();
  } );
});
