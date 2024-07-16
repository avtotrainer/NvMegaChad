-- ~/.config/nvim/lua/configs/my_mappings.lua
vim.api.nvim_create_autocmd("FileType", {
  -- pattern = "markdown,text",
  callback = function()
    vim.api.nvim_set_keymap("v", "<leader>[", ":<C-u>normal! I[<CR>gv<esc>`>a]<esc>", { noremap = true, silent = true })
  end,
})
local map = vim.keymap.set

-- Replace specific Georgian letters with English
local modes = { "n", "v", "x", "s", "o", "c" }

local mappings = {
  ["ჩ"] = "q",
  ["პ"] = "w",
  ["უ"] = "e",
  ["ძ"] = "r",
  ["ჭ"] = "t",
  ["ტ"] = "y",
  ["თ"] = "u",
  ["ნ"] = "i",
  ["ვ"] = "o",
  ["შ"] = "p",
  ["კ"] = "[",
  ["ქ"] = "]",
  ["ხ"] = "a",
  ["ი"] = "s",
  ["ა"] = "d",
  ["ე"] = "f",
  ["ო"] = "g",
  ["დ"] = "h",
  ["მ"] = "j",
  ["ს"] = "k",
  ["რ"] = "l",
  ["ბ"] = ";",
  ["გ"] = "'",
  ["ჯ"] = "z",
  ["ჰ"] = "x",
  ["ყ"] = "c",
  ["ღ"] = "v",
  ["ჟ"] = "b",
  ["ზ"] = "n",
  ["ც"] = "m",
  ["ლ"] = ",",
  ["ფ"] = ".",
  ["წ"] = "/",
  ["Ჩ"] = "Q",
  ["Პ"] = "W",
  ["Უ"] = "E",
  ["Ძ"] = "R",
  ["Ჭ"] = "T",
  ["Ტ"] = "Y",
  ["Თ"] = "U",
  ["Ნ"] = "I",
  ["Ვ"] = "O",
  ["Შ"] = "P",
  ["Კ"] = "{",
  ["Ქ"] = "}",
  ["Ხ"] = "A",
  ["Ი"] = "S",
  ["Ა"] = "D",
  ["Ე"] = "F",
  ["Ო"] = "G",
  ["Დ"] = "H",
  ["Მ"] = "J",
  ["Ს"] = "K",
  ["Რ"] = "L",
  ["Ბ"] = ":",
  ["Გ"] = '"',
  ["Ჯ"] = "Z",
  ["Ჰ"] = "X",
  ["Ყ"] = "C",
  ["Ღ"] = "V",
  ["Ჟ"] = "G",
  ["Ზ"] = "N",
  ["Ც"] = "M",
  ["Ლ"] = "<",
  ["Ფ"] = ">",
  ["Წ"] = "?",
  ["й"] = "q",
  ["ц"] = "w",
  ["у"] = "e",
  ["к"] = "r",
  ["е"] = "t",
  ["н"] = "y",
  ["г"] = "u",
  ["ш"] = "i",
  ["щ"] = "o",
  ["з"] = "p",
  ["х"] = "[",
  ["ъ"] = "]",
  ["ф"] = "a",
  ["ы"] = "s",
  ["в"] = "d",
  ["а"] = "f",
  ["п"] = "g",
  ["р"] = "h",
  ["о"] = "j",
  ["л"] = "k",
  ["д"] = "l",
  ["ж"] = ";",
  ["э"] = "'",
  ["я"] = "z",
  ["ч"] = "x",
  ["с"] = "c",
  ["м"] = "v",
  ["и"] = "b",
  ["т"] = "n",
  ["ь"] = "m",
  ["б"] = ",",
  ["ю"] = ".",
  ["Й"] = "Q",
  ["Ц"] = "W",
  ["У"] = "E",
  ["К"] = "R",
  ["Е"] = "T",
  ["Н"] = "Y",
  ["Г"] = "U",
  ["Ш"] = "I",
  ["Щ"] = "O",
  ["З"] = "P",
  ["Х"] = "{",
  ["Ъ"] = "}",
  ["Ф"] = "A",
  ["Ы"] = "S",
  ["В"] = "D",
  ["А"] = "F",
  ["П"] = "G",
  ["Р"] = "H",
  ["О"] = "J",
  ["Л"] = "K",
  ["Д"] = "L",
  ["Ж"] = ":",
  ["Э"] = '"',
  ["Я"] = "Z",
  ["Ч"] = "X",
  ["С"] = "C",
  ["М"] = "V",
  ["И"] = "G",
  ["Т"] = "N",
  ["Ь"] = "M",
  ["Б"] = "<",
  ["Ю"] = ">",
}

for _, mode in ipairs(modes) do
  for georgian_letter, english_letter in pairs(mappings) do
    map(mode, georgian_letter, function()
      if vim.fn.getcmdtype() ~= "/" then
        return english_letter
      else
        return georgian_letter
      end
    end, { noremap = true, expr = true, silent = false })
  end
end