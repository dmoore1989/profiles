return {
  {
    name = 'run_ruby_tests', -- Unique name for the tool
    description = 'Run Ruby on Rails tests via mini tests and return results', -- Description shown to AI
    command = 'bin/rails test .', -- Shell command to execute
    param = { -- Input parameters (optional)
      type = 'table',
      fields = {
        {
          name = 'target',
          description = "Package or directory to test (e.g. './pkg/...' or './internal/pkg')",
          type = 'string',
          optional = true,
        },
      },
    },
    returns = { -- Expected return values
      {
        name = 'result',
        description = 'Result of the fetch',
        type = 'string',
      },
      {
        name = 'error',
        description = 'Error message if the fetch was not successful',
        type = 'string',
        optional = true,
      },
    },
    func = function(params, on_log, on_complete) -- Custom function to execute
      local target = params.target or '.'
      return vim.fn.system(string.format('bin/rails test %s', target))
    end,
  },
}
