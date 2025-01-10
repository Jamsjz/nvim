return {
  "CRAG666/code_runner.nvim",
  config = true,
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt",
    },
    python = "python3 $fileName", -- Use python3 for better compatibility
    typescript = "deno run $fileName", -- Ensure Deno is installed
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "./$fileNameWithoutExt", -- Ensure execution from current directory
    },
  },
}
