# frozen_string_literal: true

class HookTest < Minitest::Test
  AdequateSerialization.hook_into_rails!

  def test_hooks_into_records
    file, = Post.first.method(:as_json).source_location
    assert file.include?('adequate_serialization')
  end

  def test_hooks_into_relations
    file, = Post.all.method(:as_json).source_location
    assert file.include?('adequate_serialization')
  end
end