class TitleBracketsValidator < ActiveModel::Validator
  include ActiveModel::Validations

  def brackets_validate(title)
    stack  = []
    lookup = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
    left   = lookup.keys
    right  = lookup.values

    title.each_char do |char|
      if left.include? char
        stack << char
      elsif right.include? char
        return false if stack.empty? || (lookup[stack.pop] != char)
      end
    end

    if (stack.empty? && !(title.include?('[]') || title.include?('{}') || title.include?('()')))
      return true
    else
      return false
    end
  end
end
