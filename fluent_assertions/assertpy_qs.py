from assertpy import assert_that, soft_assertions, assert_warn, fail

# https://github.com/assertpy/assertpy
# https://assertpy.github.io/docs.html#assertpy.assertpy.assert_that


assert_that('abcdefg').contains('de').is_alpha()    # chaining
assert_that(9, 'optional extra error message description').is_between(0, 10)
assert_that(27.6).is_close_to(27.1, 0.5)    # 0.4 would fail assertion
assert_that(['a', 'b', 'c']).does_not_contain_duplicates().contains('b')    # chaining
assert_that(['a', 'b', 'b', 'b', 'a']).contains_only('a','b')

assert_that({'a': 1,'b': 2}).contains_entry({'a': 1})
assert_that({'fname': "Taysom", 'lname': "Hill"}).has_fname("Taysom")

people = [{'fname': "Drew"}, {'fname': "Jameis"}, {'fname': "Taysom"}, {'fname': "Ian"}]
assert_that(people).extracting('fname').contains("Jameis")    # flattening

people = [['Drew', 'Brees'], ['Jameis', 'Winston']]
assert_that(people).extracting(-1).is_equal_to(['Brees','Winston'])    # flattening

text = 'text text [pass] [error] [pass] pass [fail] text'
pattern = r'\[.+?\]'
assert_that(text).matches(pattern)


assert_warn('foo').is_upper()

with soft_assertions():
    assert_that(10).is_equal_to(11)
    assert_that(10).is_equal_to(10)
    assert_that(10).is_equal_to(12)

fail('should have thrown exception')
