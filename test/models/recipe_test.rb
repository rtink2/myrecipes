require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.create!(chefname: 'damon', email: 'damon@example.com',
            password: 'test1234', password_confirmation: 'test1234')
        @recipe = @chef.recipes.build(name: 'vegtable', description: 'great vegtable recipe')
    end
    
    test 'recipe without chef should be invalid' do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end
    
    test 'recipe should be valid' do
        assert @recipe.valid?
    end
    
    test 'name should be present' do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
    test 'description should be present' do
        @recipe.description = " "
        assert_not @recipe.valid?
    end
    
    test 'description should not be less than 5 chars' do
        @recipe.description = "a" * 3
        assert_not @recipe.valid?
    end
    
    test 'description should not be more than 5000 chars' do
        @recipe.description = "a" * 5001
        assert_not @recipe.valid?
    end
    
    
    
end