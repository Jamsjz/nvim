return {
  "CRAG666/code_runner.nvim",
  config = true,

  opts = {
    filetype = {
      javascript = "node $fileName",
      go = "go run .",
      typescript = {
        "cd $dir &&",
        "bun $fileName &&",
      },
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
      c = {
        "cd $dir &&",
        "clang $fileName",
        "-o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt",
      },
      cpp = {
        "cd $dir &&",
        "g++ $fileName",
        "-o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt",
      },
      -- python = "cd $dir &&",
      -- "python3 $filename",

      sh = "zsh $filename",
      ruby = "ruby",
      rust = {
        "cd $dir &&",
        "cargo run",
      },
      elixir = {
        "elixir $fileName",
      },
    },
  },
}
