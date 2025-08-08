-- A query that creates or replaces a user-defined SQL function, count_vowels

-- The function should accept a string and return an integer representing the number of vowels in the string

-- Y should be counted as a vowel

-- Vowels are not case-sensitive

create or replace function count_vowels(input_text text)
returns integer
as
$$
def count_vowels(text):
    vowels = ('aeiouy')
    count = 0
    for x in text.lower():
        if x in vowels:
            count += 1
    return count

return count_vowels(input_text)
$$language plpythonu

-- I tried looking into why plpythonu didn't work but i couldn't find it