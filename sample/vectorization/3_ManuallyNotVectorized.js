// scalar routine
function getFullName( user )
{
  return `${user.firstName} ${user.lastName}`;
}

// scalar
let user = { firstName : 'John', lastName : 'Smith', age : 30 }
// vector
let users =
[
  { firstName : 'John', lastName : 'Smith', age : 30 },
  { firstName : 'Samantha', lastName : 'Blum', age : 25 },
  { firstName : 'Edvard', lastName : 'Pitt', age : 33 }
];
console.log( getFullName( user ) );
// John Smith
console.log( getFullName( users ) );
// undefined undefined
