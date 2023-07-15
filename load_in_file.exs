title = "title#{:rand.uniform(100_000_000)}"

IO.puts(title)

frontmatter =
  Macro.to_string(%{title: title})

body = for _ <- 1..60, into: "", do: <<Enum.random(~c"0123456789abcdef")>>

contents = """
#{frontmatter}

---

#{body}
"""

File.write!("content/pages/#{title}.md", contents)
