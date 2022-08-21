#!/usr/bin/env bash

function assert() {
  local input="$1"
  local expected="$2"

  ./9cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  local actual="$?"

  if [[ "${actual}" == "${expected}" ]]; then
    echo "✅ ${input} => ${actual}"
  else
    echo "❌ ${input} => ${expected} expected, but got ${actual}"
    exit 1
  fi
}

assert 0 0
assert 42 42

echo "------------------------------"
echo "✅ OK"
