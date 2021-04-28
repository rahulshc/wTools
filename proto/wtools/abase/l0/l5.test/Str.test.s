( function _l0_l5_Str_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include5.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
//
// --


function exportStringShallowDiagnosticOptionHeightLimit( test )
{

  test.case = 'heightLimit = 0';
  var src = 's\nt\n\nr\ni\nn\ng\n\n\nf\ng';
  var o = { heightLimit : 0 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 's\nt\n\nr\ni\nn\ng\n\n\nf\ng';
  test.identical( got, expected );

  test.case = 'src without linebreaks < heightLimit';
  var src = 'string';
  var o = { heightLimit : 2 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'string';
  test.identical( got, expected );

  test.case = 'src without linebreaks = heightLimit';
  var src = 'string';
  var o = { heightLimit : 1 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'string';
  test.identical( got, expected );

  test.case = 'src with linebreaks < heightLimit';
  var src = 'a\nb\n';
  var o = { heightLimit : 4 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'a\nb\n';
  test.identical( got, expected );

  test.case = 'src with linebreaks = heightLimit';
  var src = 'a\nb\n';
  var o = { heightLimit : 3 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'a\nb\n';
  test.identical( got, expected );


  test.case = 'src with linebreaks > heightLimit';
  var src = 'a\nb\nc';
  var o = { heightLimit : 2 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'a\nb';
  test.identical( got, expected );

  test.case = 'src with linebreaks > heightLimit, even src and limit';
  var src = 'a\nb\nc\nd';
  var o = { heightLimit : 2 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'a\nd';
  test.identical( got, expected );

  test.case = 'src with linebreaks > heightLimit, even src';
  var src = 'a\nb\nc\nd';
  var o = { heightLimit : 3 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'a\nb\nd';
  test.identical( got, expected );

  test.case = 'src with linebreaks > heightLimit, even limit';
  var src = 'a\nb\nc\nd\ne';
  var o = { heightLimit : 2 }
  var got = _.entity.exportStringShallowDiagnostic( src, o );
  var expected = 'a\ne';
  test.identical( got, expected );

}

//

function exportStringShallowCodeOptionHeightLimit( test )
{

  test.case = 'heightLimit = 0';
  var src = 's\nt\n\nr\ni\nn\ng\n\n\nf\ng';
  var o = { heightLimit : 0 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'s\nt\n\nr\ni\nn\ng\n\n\nf\ng'`;
  test.identical( got, expected );

  test.case = 'src without linebreaks < heightLimit';
  var src = 'string';
  var o = { heightLimit : 2 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'string'`;
  test.identical( got, expected );

  test.case = 'src without linebreaks = heightLimit';
  var src = 'string';
  var o = { heightLimit : 1 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'string'`;
  test.identical( got, expected );

  test.case = 'src with linebreaks < heightLimit';
  var src = 'a\nb\n';
  var o = { heightLimit : 4 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'a\nb\n'`;
  test.identical( got, expected );

  test.case = 'src with linebreaks = heightLimit';
  var src = 'a\nb\n';
  var o = { heightLimit : 3 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'a\nb\n'`;
  test.identical( got, expected );

  /* middle */

  test.case = 'src with linebreaks > heightLimit';
  var src = 'a\nb\nc';
  var o = { heightLimit : 2 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'a\nc'`;
  test.identical( got, expected );

  test.case = 'src with linebreaks > heightLimit, even src and limit';
  var src = 'a\nb\nc\nd';
  var o = { heightLimit : 2 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'a\nd'`;
  test.identical( got, expected );

  test.case = 'src with linebreaks > heightLimit, even src';
  var src = 'a\nb\nc\nd';
  var o = { heightLimit : 3 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'a\nb\nd'`;
  test.identical( got, expected );

  test.case = 'src with linebreaks > heightLimit, even limit';
  var src = 'a\nb\nc\nd\ne';
  var o = { heightLimit : 2 };
  var got = _.entity.exportStringShallowCode( src, o );
  var expected = `'a\ne'`;
  test.identical( got, expected );

}

// --
// test suite
// --

const Proto =
{

  name : 'Tools.Str.l0.l3',
  silencing : 1,

  tests :
  {

    /* */

    exportStringShallowDiagnosticOptionHeightLimit,
    exportStringShallowCodeOptionHeightLimit,
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
