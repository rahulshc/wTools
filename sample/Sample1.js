if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

var arr = _.arrayRange([ 2,10 ]);
// _.toStr([new Error('r'), Error('x') ], { levels:2, errorAsMap:1} )
var f = ( function ()
       {
        var x = Object.create({},
         {
           getFoo:
           {
             value: function() { return this.foo; },
             enumerable: false
           }
         });

        x.foo = 1;

        var y = Object.create( x );
        y.a = "string";

        return y;

      } )();

console.log(_.toStr({ a : { h : "a" }, b : "b", c : { d : "d" } },{wrapString:0,levels:2}));
