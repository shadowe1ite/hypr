local options = {
  system_prompt = 'COPILOT_INSTRUCTIONS',
  model = 'claude-3.7-sonnet',
  agent = 'copilot',
  context = nil,
  sticky = nil,

  temperature = 0.1,
  headless = false,
  stream = nil,
  callback = nil,
  remember_as_sticky = true,

  window = {
    layout = 'float',
    width = 0.5,
    height = 0.5,
    relative = 'editor',
    border = 'single',
    row = nil,
    col = nil,
    title = 'Copilot Chat',
    footer = nil,
    zindex = 1,
  },

  show_help = false,
  highlight_selection = true,
  highlight_headers = true,
  references_display = 'virtual',
  auto_follow_cursor = true,
  auto_insert_mode = false,
  insert_at_end = false,
  clear_chat_on_new_prompt = false,

  debug = false,
  log_level = 'info',
  proxy = nil,
  allow_insecure = false,

  chat_autocomplete = false,
  
  question_header = '# Elite ',
  answer_header = '# Copilot ',
  error_header = '# Error ',
  separator = '',
  
  prompts = {
    Explain = {
      prompt = 'Write an explanation for the selected code as paragraphs of text.',
      system_prompt = 'COPILOT_EXPLAIN',
    },
    Review = {
      prompt = 'Review the selected code.',
      system_prompt = 'COPILOT_REVIEW',
    },
    Fix = {
      prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
    },
    Optimize = {
      prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
    },
    Docs = {
      prompt = 'Please add documentation comments to the selected code.',
    },
    Tests = {
      prompt = 'Please generate tests for my code.',
    },
    Commit = {
      prompt = 'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
      context = 'git:staged',
    },
  },
}

return options
