( function _l0_l3_Regexp_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// implementation
// --

function identical( test )
{
  var context = this;

  /* */

  test.case = 'null';

  var expected = false;
  var got = _.regexp.identical( null, null );
  test.identical( got, expected );

  /* */

  test.case = 'null and regexp';

  var expected = false;
  var got = _.regexp.identical( /x/, null );
  test.identical( got, expected );

  /* */

  test.case = 'same string';

  var expected = false;
  var got = _.regexp.identical( 'x', 'x' );
  test.identical( got, expected );

  /* */

  test.case = 'same regexp';
  var expected = true;
  var got = _.regexp.identical( /abc/iy, /abc/yi );
  test.identical( got, expected );

  /* */

  test.case = 'not identical regexp, different flags';
  var expected = false;
  var got = _.regexp.identical( /abc/i, /abc/ );
  test.identical( got, expected );

  /* */

  test.case = 'not identical regexp, different source';
  var expected = false;
  var got = _.regexp.identical( /abcd/i, /abc/i );
  test.identical( got, expected );

  /* */

  test.case = 'not identical regexp';
  var expected = false;
  var got = _.regexp.identical( /abcd/y, /abc/i );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.identical() );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.identical( /abc/i, /def/i, 3, 4 ) );

}

//

function equivalent( test )
{
  test.case = 'null';
  var expected = false;
  var got = _.regexp.equivalent( null, null );
  test.identical( got, expected );

  test.case = 'null and regexp';
  var expected = false;
  var got = _.regexp.equivalent( /x/, null );
  test.identical( got, expected );

  test.case = 'same string';
  var expected = false;
  var got = _.regexp.equivalent( 'x', 'x' );
  test.identical( got, expected );

  test.case = 'same regexp';
  var expected = true;
  var got = _.regexp.equivalent( /abc/iy, /abc/yi );
  test.identical( got, expected );

  /* - */

  test.case = 'identical regexp, first with flag';
  var expected = false;
  var got = _.regexp.equivalent( /abc/i, /abc/ );
  test.identical( got, expected );

  test.case = 'identical regexp, different flags';
  var expected = false;
  var got = _.regexp.equivalent( /abc/i, /abc/g );
  test.identical( got, expected );

  test.case = 'identical regexp, second with flag';
  var expected = false;
  var got = _.regexp.equivalent( /abc/, /abc/g );
  test.identical( got, expected );

  /* - */

  test.case = 'not identical regexp, different source';
  var expected = false;
  var got = _.regexp.equivalent( /abcd/i, /abc/i );
  test.identical( got, expected );

  test.case = 'not identical regexp, different source & flags';
  var expected = false;
  var got = _.regexp.equivalent( /abcd/y, /abc/i );
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'none argument';
  test.shouldThrowErrorSync( () => _.regexp.identical() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.regexp.identical( /abc/i, /def/i, 3, 4 ) );

}

//

function regexpEquivalent( test )
{
  test.open( 'true' );

  test.case = 'strings';
  var got = _.regexp.equivalent( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexp.equivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexp.equivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w+/, /\w+/ );
  test.identical( got, true );

  test.case = 'string with and without spaces ';
  var got = _.regexp.equivalent( 'abc', ' abc ' );
  test.identical( got, true );

  test.case = 'string with and without newlines ';
  var got = _.regexp.equivalent( 'abc', '\nabc\n' );
  test.identical( got, true );

  test.case = 'string with identical newlines';
  var got = _.regexp.equivalent( '\na\nb\nc\n', '\na\nb\nc\n' );
  test.identical( got, true );

  test.case = 'strings with different newlines';
  var got = _.regexp.equivalent( '\n\nabc\n', '\nabc\n\n' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs';
  var got = _.regexp.equivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t           ' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs on each line';
  var got = _.regexp.equivalent( '      \t\na   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs on each line from both sides';
  var got = _.regexp.equivalent( '      \t\n  \ta   \t\n\n  \n\t  b   \t   \n   \n  \n  \t  c  \t     ', '        \n  \t a  \n  \n  \t   \n \n  b  \t \n   \n \t c \t \n \n \t \t           ' );
  test.identical( got, true );

  test.close( 'true' );

  /* - */

  test.open( 'false' );

  test.case = 'strings';
  var got = _.regexp.equivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexp.equivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexp.equivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexp.equivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexp.equivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.case = 'diff strings with different newlines';
  var got = _.regexp.equivalent( '\n\nabc\nb', '\nabc\n\n' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs';
  var got = _.regexp.equivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t    c       ' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs on each line';
  var got = _.regexp.equivalent( '      \t\nab   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, false );

  test.close( 'false' );
}

//

function regexpsEquivalent( test )
{
  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalent( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vector, true' );

  test.case = 'vector, vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.case = 'vector, scalar';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.case = 'scalar, vector';
  var src1 = 'abc';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.close( 'vector, true' );

  /* - */

  test.open( 'vector, false' );

  test.case = 'vector, vector';
  var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/g ];
  var src2 = [ 'abc', 'abc', 'abc', /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, false, false, false, false, false ] );

  test.case = 'vector, scalar';
  var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
  var src2 = 'abc';
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, true, true, true, true, true ] );

  test.case = 'scalar, vector';
  var src1 = 'abc';
  var src2 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, true, true, true, true, true ] );

  test.close( 'vector, false' );
}

//

function regexpsEquivalentAll( test )
{
  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAll( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAll( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAll( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAll( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAll( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAll( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAll( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAll( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'bb', 'aa' ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/gi ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function regexpsEquivalentAny( test )
{

  /* - */

  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAny( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAny( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAny( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAny( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAny( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAny( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAny( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAny( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+\s\w/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/gi, /\w+/g ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'a', 'b' ];
  var src2 = [ 'ab', 'ab', 'aa', 'b' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc d', 'aa d', 'bb d' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc d', 'aa d', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+\s/;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+\s/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'b', 'a' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
  var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function regexpsEquivalentNone( test )
{

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalentNone( 'abc', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentNone( /\w+/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentNone( 'abc', /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w+/, /\w+/ );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalentNone( 'abd', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentNone( /\s+/, 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentNone( /\w/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentNone( 'abc', /\s+/ );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentNone( 'abc', /\w/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w*/, /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w+/g, /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w+/g, /\w+/gi );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+\s/;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+\s/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'b', 'a' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
  var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+\s\w/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/gi, /\w+/g ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'aa'+'a', 'bb' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc d', 'aa'+'a d', 'bb d' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc d', 'aa'+'a d', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function exportStringShallowDiagnostic( test )
{

  test.case = 'regexp without flags';
  var src = /regexp/;
  var expected = '/regexp/';
  var got = _.regexp.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'regexp with flags';
  var src = /regexp/gi;
  var expected = '/regexp/gi';
  var got = _.regexp.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'regexp complex';
  var src = /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}1\d{4}/gi;
  var expected = '/(?:\\d{3}|\\(\\d{3}\\))([-\\/\\.])\\d{3}1\\d{4}/gi';
  var got = _.regexp.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.routine.exportStringShallowDiagnostic() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.routine.exportStringShallowDiagnostic( /hello/, /hello/ ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.routine.exportStringShallowDiagnostic( {} ) );
}

// --
// suite definition
// --

const Proto =
{

  name : 'Tools.l1.Regexp.l0.l3',
  silencing : 1,

  tests :
  {

    identical,
    equivalent,

    regexpEquivalent,
    regexpsEquivalent,
    regexpsEquivalentAll,
    regexpsEquivalentAny,
    regexpsEquivalentNone,

    exportStringShallowDiagnostic

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
