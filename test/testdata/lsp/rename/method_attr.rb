# typed: true
# frozen_string_literal: true

class Foo
  attr_reader :foo
#              ^ apply-rename: [A] invalid: true
# ^ apply-rename: [E] invalid: true
  attr_writer :bar
#              ^ apply-rename: [C] invalid: true
#      ^ apply-rename: [I] invalid: true
#             ^ apply-rename: [K] invalid: true
  attr_accessor :baz
#                ^ apply-rename: [D] invalid: true
#     ^ apply-rename: [J] invalid: true
  attr_reader "strfoo"
#              ^ apply-rename: [L] invalid: true
#             ^ apply-rename: [M] invalid: true
  attr_writer "strbar"
#              ^ apply-rename: [N] invalid: true
#             ^ apply-rename: [O] invalid: true
  attr_accessor "strbaz"
#                ^ apply-rename: [P] invalid: true
#               ^ apply-rename: [Q] invalid: true
end

f = Foo.new
f.foo
#  ^ apply-rename: [B] newName: bar invalid: true expectedErrorMessage: Sorbet does not support renaming `attr_reader`s
f.bar = 5
# ^ apply-rename: [F] newName: bar2 invalid: true
f.baz
#   ^ apply-rename: [G] newName: baz2 invalid: true
f.baz = 9
#   ^ apply-rename: [H] newName: baz2 invalid: true

