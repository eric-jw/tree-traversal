require 'spec_helper'

RSpec.describe BinaryTree do
  describe 'btree sort should work' do
    it 'should order the array' do
      expected = [1, 4, 6, 7, 9, 10, 14]
      array = [7, 4, 9, 1, 6, 14, 10]

      tree = BinaryTree.new(array.shift)
      array.each do |num|
        tree.push(num)
      end
      expect(tree.sort()).to eq expected
    end
  end
end
