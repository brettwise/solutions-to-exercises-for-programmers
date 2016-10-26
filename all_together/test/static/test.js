import test from 'tape';

const cubeNum = num => num * num * num;

test('the test that always passes', (assert) => {
  assert.pass('This test will pass.');
  assert.end();
});

test('assertions', (assert) => {
  const expected = 'something to test';
  const actual = 'something to test';

  assert.equal(actual, expected,
    'Given two mismatched values, .equal() should produce a nice bug report');

  assert.end();
});

test('the cube function', (assert) => {
  assert.plan(2);
  assert.equal(cubeNum(5), 125);
  assert.equal(typeof cubeNum(5), 'number');
});
