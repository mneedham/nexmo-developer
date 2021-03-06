require 'rails_helper'

RSpec.describe TabbedExamplesFilter do
  context 'when no config is provided' do
    it 'raises an exception' do
      input = <<~HEREDOC
        ```tabbed_examples
        ```
      HEREDOC

      expect {
        TabbedExamplesFilter.new.call(input)
      }.to raise_error('A source, tabs or config key must be present in this tabbed_example config')
    end
  end

  context 'when an invalid config is provided' do
    it 'raises an exception' do
      input = <<~HEREDOC
        ```tabbed_examples
        foo: 'bar'
        ```
      HEREDOC

      expect {
        TabbedExamplesFilter.new.call(input)
      }.to raise_error('A source, tabs or config key must be present in this tabbed_example config')
    end
  end
end
