require "./src/lib_ruby/lib_ruby"
require "./src/inflector/wrapper"

fun init = Init_inflector
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  # String
  string = LibRuby.rb_define_class("String", LibRuby.rb_cObject)

  LibRuby.rb_define_method(string, "cr_squish",        ->Wrapper.squish(LibRuby::VALUE).pointer,        0)
  LibRuby.rb_define_method(string, "cr_blank?",        ->Wrapper.blank?(LibRuby::VALUE).pointer,        0)
  LibRuby.rb_define_method(string, "cr_pluralize",     ->Wrapper.pluralize(LibRuby::VALUE).pointer,     0)
  LibRuby.rb_define_method(string, "cr_singularize",   ->Wrapper.singularize(LibRuby::VALUE).pointer,   0)
  LibRuby.rb_define_method(string, "cr_camelize",      ->Wrapper.camelize(LibRuby::VALUE, LibRuby::VALUE).pointer,      1)
  LibRuby.rb_define_method(string, "cr_titleize",      ->Wrapper.titleize(LibRuby::VALUE).pointer,      0)
  LibRuby.rb_define_method(string, "cr_titlecase",     ->Wrapper.titlecase(LibRuby::VALUE).pointer,     0)
  LibRuby.rb_define_method(string, "cr_as_underscore", ->Wrapper.as_underscore(LibRuby::VALUE).pointer, 0)
  LibRuby.rb_define_method(string, "cr_dasherize",     ->Wrapper.dasherize(LibRuby::VALUE).pointer,     0)
  LibRuby.rb_define_method(string, "cr_demodulize",    ->Wrapper.demodulize(LibRuby::VALUE).pointer,    0)
  LibRuby.rb_define_method(string, "cr_deconstantize", ->Wrapper.deconstantize(LibRuby::VALUE).pointer, 0)
  LibRuby.rb_define_method(string, "cr_tableize",      ->Wrapper.tableize(LibRuby::VALUE).pointer,      0)
  LibRuby.rb_define_method(string, "cr_classify",      ->Wrapper.classify(LibRuby::VALUE).pointer,      0)
  LibRuby.rb_define_method(string, "cr_humanize",      ->Wrapper.humanize(LibRuby::VALUE, LibRuby::VALUE).pointer,      1)
  LibRuby.rb_define_method(string, "cr_upcase_first",  ->Wrapper.upcase_first(LibRuby::VALUE).pointer,  0)
  LibRuby.rb_define_method(string, "cr_foreign_key",   ->Wrapper.foreign_key(LibRuby::VALUE, LibRuby::VALUE).pointer,   1)


  integer = LibRuby.rb_define_class("Integer", LibRuby.rb_cNumeric)
  LibRuby.rb_define_method(integer, "cr_ordinal",      ->Wrapper.ordinal(LibRuby::VALUE).pointer,       0)
  LibRuby.rb_define_method(integer, "cr_ordinalize",   ->Wrapper.ordinalize(LibRuby::VALUE).pointer,    0)

  float = LibRuby.rb_define_class("Float", LibRuby.rb_cNumeric)
  LibRuby.rb_define_method(float, "cr_square",   ->Wrapper.square(LibRuby::VALUE).pointer,    0)

end
