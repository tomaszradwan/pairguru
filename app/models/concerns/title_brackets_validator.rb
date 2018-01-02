class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    @title = record.title
    brackets_validate
  end

  def brackets_validate
    stack  = []
    lookup = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
    left   = lookup.keys
    right  = lookup.values

    @title.each_char do |char|
      if left.include? char
        stack << char
      elsif right.include? char
        return add_error if stack.empty? || (lookup[stack.pop] != char)
      end
    end
    add_error if !(stack.empty? && !(@title.include?('[]') || @title.include?('{}') || @title.include?('()')))
  end

  def add_error
    @record.errors.add(:title)
  end
end
