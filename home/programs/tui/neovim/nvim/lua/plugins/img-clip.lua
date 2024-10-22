return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      show_dir_path_in_prompt = true,
    },
    filetypes = {
      tex = {
        relative_template_path = false,
        template = [[
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
    ]],
      },
    },
  },
  keys = {
    { "<leader>i", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
